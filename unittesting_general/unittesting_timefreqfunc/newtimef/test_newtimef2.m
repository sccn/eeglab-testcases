% testing newtimef output
% Arnaud Delorme - May 2010
% -----------------------
function test_newtimef;

% parameter common to all functions
% ---------------------------------
srate   = 100;
frames  = 100;
data    = rand(100,10); % 100 time points, 10 trials
options = { 'timesout', [20 30 40 50 60 70 80]*10, 'padratio', 1, 'winsize', 32, 'plotitc', 'off', 'plotersp', 'off', 'verbose', 'off', 'outputformat', 'plot' };

% compute time frequency decomposition using local custom functions
% -----------------------------------------------------------------
[fftData1 fftFreqs] = timefreqfft(data, srate, 21);
[fftData2         ] = timefreqfft(data, srate, 31);
[fftData3         ] = timefreqfft(data, srate, 41);
[wavData1 wavFreqs] = timefreqwav(data, srate, 31, [10 12 14 16 18]);
powerTest1 = mean(abs(fftData1).^2,2);
powerTest2 = mean(abs(fftData2).^2,2);
powerTest3 = mean(abs(fftData3).^2,2);
powerWav   = mean(abs(wavData1).^2,2);

% compute baseline in different ways
% ----------------------------------
itcTest                = abs(mean(fftData1./abs(fftData1),2));
powerWithBaseline      = powerTest2./powerTest1;
powerTrialWithBaseline = mean(abs(fftData2./abs(fftData1)).^2,2);

meanBase   = (powerTest1+powerTest2)/2;
stdBase    = sqrt( (powerTest1-meanBase).^2 + (powerTest2-meanBase).^2 );
powerNorm  = (powerTest3-meanBase)./stdBase;

meanBase       = abs(fftData1).^2/2+abs(fftData2).^2/2;
stdBase        = sqrt( (abs(fftData1).^2-meanBase).^2 + (abs(fftData2).^2-meanBase).^2);
powerTrialNorm = mean((abs(fftData3).^2-meanBase)./stdBase,2);

% compute the same thing using newtimef
% -------------------------------------
[powAbs itc tmp tmp2 freqs] = newtimef(data, frames, [0 990], srate, 0, 'baseline', NaN, 'scale', 'abs', options{:});
[powLog                   ] = newtimef(data, frames, [0 990], srate, 0, 'baseline', NaN, 'scale', 'log', options{:});
[powWithBase r powBase1   ] = newtimef(data, frames, [0 990], srate, 0, 'baseline', 250, 'scale', 'abs', options{:});
[powLogWithBase r powBase2] = newtimef(data, frames, [0 990], srate, 0, 'baseline', 250, 'scale', 'log', options{:});
[powTrialBase             ] = newtimef(data, frames, [0 990], srate, 0, 'baseline', 250, 'scale', 'abs', 'trialbase', 'on', options{:});
[powLogTrialBase          ] = newtimef(data, frames, [0 990], srate, 0, 'baseline', 250, 'scale', 'log', 'trialbase', 'on', options{:});
[powNormBase              ] = newtimef(data, frames, [0 990], srate, 0, 'baseline', 350, 'scale', 'abs', 'basenorm' , 'on', options{:});
[powTrialNormBase         ] = newtimef(data, frames, [0 990], srate, 0, 'baseline', 350, 'scale', 'abs', 'trialbase', 'on', 'basenorm' , 'on', options{:});
[powWav                   ] = newtimef(data, frames, [0 990], srate, 3, 'baseline', NaN, 'scale', 'abs', 'freqs', [10 12 14 16 18], options{:});

% compare results
% ---------------
assert(fftFreqs            , freqs        , 'Frequency values...');
assert(itcTest             , abs(itc(:,1)), 'ITC absolute values...');
assert(powerTest1          , powAbs(:,1)  , 'FFT absolute power...');
assert(10*log10(powerTest1), powLog(:,1)  , 'FFT log power...');

assert(powerWithBaseline          , powWithBase(:,2)   , 'FFT absolute power with baseline...');
assert(powerTest1                 , powBase1'          , 'FFT absolute baseline power...');
assert(10*log10(powerWithBaseline), powLogWithBase(:,2), 'FFT log power with baseline...');
assert(10*log10(powerTest1)       , powBase2'          , 'FFT log baseline power...');

assert(powerTrialWithBaseline          , powTrialBase(:,2),    'FFT power with trial baseline...');
assert(10*log10(powerTrialWithBaseline), powLogTrialBase(:,2), 'FFT log power with trial baseline...');
assert(powerNorm                       , powNormBase(:,3),     'FFT power baseline normalized...');
assert(powerTrialNorm                  , powTrialNormBase(:,3),'FFT trial power baseline normalized...');

assert(powerWav, powWav(:,2), 'Wavelet absolute power...');

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-8), fprintf('Pass\n'); else error('Fail\n'); end; 

% minimalist function to compute FFT power
% ----------------------------------------
function [fftData freqstest] = timefreqfft(data, srate, wincenter);

firstwin   = data(wincenter-15:wincenter+16,:);           % selecting a data window
firstwin   = bsxfun(@minus, firstwin, mean(firstwin));    % removing mean
taperedwin = bsxfun(@times, firstwin, hanning(32));       % tapering window
fftData    = fft(taperedwin, 32);                         % computing FFT
fftData    = fftData(2:size(fftData,1)/2+1,:)*2/0.375/32; % selecting frequencies and normalizing
freqstest = linspace(0, srate/2, size(fftData,1)+1);      % computing frequency array
freqstest(1) = [];                                        % removing DC (frequency 0)

% minimalist function to compute wavelet power
% --------------------------------------------
function [taperedwin freqs] = timefreqwav(data, srate, wincenter, freqs);

win = dftfilt3(freqs, 3, srate, 'cycleinc', 'linear');
taperedwin = zeros(length(win), size(data,2));
for i = 1:length(win)
    sizewav       = length(win{i})-1;
    firstwin      = data([-sizewav/2:sizewav/2]+wincenter,:);           % selecting a data window
    firstwin      = bsxfun(@minus, firstwin, mean(firstwin));    % removing mean
    taperedwin(i,:) = sum(bsxfun(@times, firstwin,transpose(win{i})),1);       % tapering window
end;

function w = hanning(n)
if ~rem(n,2)
    w = .5*(1 - cos(2*pi*(1:n/2)'/(n+1)));
    w = [w; w(end:-1:1)];
else
    w = .5*(1 - cos(2*pi*(1:(n+1)/2)'/(n+1)));
    w = [w; w(end-1:-1:1)];
end

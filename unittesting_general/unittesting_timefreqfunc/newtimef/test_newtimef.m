% code for testing frequencies in newtimef

Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 600;                     % Length of signal
t = (0:L-1)*T;                % Time vector
% Sum of a 25 Hz sinusoid and a 50 Hz
x = 0.7*sin(2*pi*25*t) + cos(2*pi*50*t);

addopt = {};
try
    if ~ismatlab
        addopt = { 'plotersp', 'off', 'plotitc', 'off' };
    end;
catch, end;

% FFT
if isempty(addopt) figure; end;
newtimef(x,L,[0 L/Fs*1000],Fs,0,'winsize',200,'freqs',[3 100], 'baseline', NaN, addopt{:});
close;

% wavelet
if isempty(addopt) figure; end;
newtimef(x,L,[0 L/Fs*1000],Fs,5,'winsize',200,'freqs',[10 100], 'baseline', NaN, addopt{:}); 
close;

% direct decomposition
tmp   = fft(x(1:402));
f     = linspace(0, Fs/2, size(tmp,2)/2);
f     = f(2:end); % remove DC (match the output of PSD)
tmp   = tmp(:,2:size(tmp,2)/2,:);

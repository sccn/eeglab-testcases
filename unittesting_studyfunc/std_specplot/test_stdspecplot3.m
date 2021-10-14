function test_stdspecplot3;

eegvers = eeg_getversion;
eegnewvers = str2double(eegvers(1:2)) > 14;
if isnan(eegnewvers) || eegvers(1) == 'd', eegnewvers = 1; end % 'd' is dev version
if ~exist('newtimefbaseln'), eegnewvers = 0; end
    
readsamplestudy;

allchanlocs = eeg_mergelocs(ALLEEG.chanlocs);
rmbase  = []; %[-1000 -500];
%channel = 'F7'; %allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
channel = allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
%channel = allchanlocs(2).labels;
%channel = 'F9';

for design = 1:length(STUDY.design)
    
    % WARNING: THE METHOD BELOW IS KIND OF A HACK
    % THE METHOD IN test_stdspecplot4.m USED FOR COMPONENTS IS MUCH
    % BETTER ******************************************************
    
    if eegnewvers
        posVal1   = 2; % synonym condition, ideally search STUDY.design(x).variable.values for STUDY.datasetinfo(1).condition
        posVal2   = 1;
        subject   = STUDY.datasetinfo(1).subject;
        casePos   = strmatch(subject, STUDY.design(design).cases.value, 'exact');
        fileBase  = fullfile(STUDY.datasetinfo(1).filepath, subject);
        datInds   = 1;
        trialInds = {[1:ALLEEG(1).trials]};
    else
        %randCellInd = 4; %ceil(length(STUDY.design(design).cell)*rand(1)); % random cell
        randCellInd = 2; % works in all cases
        randCellInd = ceil(length(STUDY.design(design).cell)*rand(1)); % random cell
        
        % get positions in the final array
        % --------------------------------
        datInds   = STUDY.design(design).cell(randCellInd).dataset;
        trialInds = STUDY.design(design).cell(randCellInd).trials;
        indepVarVal1 = STUDY.design(design).cell(randCellInd).value{1};
        indepVarVal2 = STUDY.design(design).cell(randCellInd).value{2};
        subject      = STUDY.design(design).cell(randCellInd).case;
        casePos      = strmatch(subject, STUDY.design(design).cases.value, 'exact');
        
        if ~isempty(indepVarVal1)
            if isstr(indepVarVal1), posVal1 = strmatch(indepVarVal1, STUDY.design(design).variable(1).value, 'exact');
            else                    posVal1 = find(cellfun(@(x)(isequal(x, indepVarVal1)), STUDY.design(design).variable(1).value));
            end;
        else
            posVal1 = 1;
        end;
        if ~isempty(indepVarVal2)
            if isstr(indepVarVal2), posVal2 = strmatch(indepVarVal2, STUDY.design(design).variable(2).value, 'exact');
            else                    posVal2 = find(cellfun(@(x)(isequal(x, indepVarVal2)), STUDY.design(design).variable(2).value));
            end;
        else
            posVal2 = 1;
        end;
        fileBase = STUDY.design(design).cell(randCellInd).filebase;
    end;
    
    % use EEGLAB STUDY functions
    % --------------------------
    STUDY = std_selectdesign(STUDY, ALLEEG, design);
    [STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'savetrials','on','recompute','on', 'interp', 'on', 'spec','on', 'specparams', { 'specmode', 'fft' });
    [STUDY, specdataAll, specfreqs] = std_specplot(STUDY, ALLEEG, 'channels', { channel }); close;
    specdata = specdataAll{posVal1, posVal2};
    
    if ~isempty(specdata) && casePos <= size(specdata,2)
        
        % get data from file
        % ------------------
        fileData     = load('-mat', [ fileBase '.datspec']);
        chanInd      = strmatch(channel, fileData.labels, 'exact');
        fileData     = getfield(fileData, [ 'chan' int2str(chanInd) ]);
        if eegnewvers
            fileData = mean(fileData(:, trialInds{1}),2)';
        else fileData = mean(fileData,2)';
        end;
        specdata = specdata(:, casePos)';
        
        %% get the data directly
        % ---------------------
        ALLTMPEEG = [];
        for tmpInd = 1:length(datInds)
            TMPEEG = ALLEEG(datInds(tmpInd));
            TMPEEG.data = eeg_getdatact(TMPEEG, 'trialindices', trialInds{tmpInd});
            TMPEEG.trials = size(TMPEEG.data,3);
            TMPEEG.epoch  = [];
            if TMPEEG.nbchan < length(allchanlocs)
                TMPEEG = eeg_interp(TMPEEG, allchanlocs);
            end;
            if isempty(ALLTMPEEG), ALLTMPEEG = TMPEEG;
            else                   ALLTMPEEG = pop_mergeset(ALLTMPEEG, TMPEEG);
            end;
        end;
        X = ALLTMPEEG.data;
        
        % special EEGLAB 13 (only later than 13.6.5)
        if eegnewvers
            if size(X,3) > 1
                for iTrial = 1:size(X,3)
                    X(:,:,iTrial) = detrend(X(:,:,iTrial)')';
                end;
            else
                X = detrend(X')';
            end;
            X = bsxfun(@times, X, hamming2(size(X,2))'); % apply hamming window even for data trials (not the case in EEGLAB 13)
        end;
        
        tmp        = fft(X, [], 2);
        specfreqs2 = linspace(0, TMPEEG(1).srate/2, floor(size(tmp,2)/2));
        specfreqs2 = specfreqs2(2:end); % remove DC (match the output of PSD)
        tmp    = tmp(:,2:floor(size(tmp,2)/2),:);
        X2     = 10*log10(abs(tmp).^2);
        specdata2 = mean(X2,3);
        
        tmpchanlocs = ALLTMPEEG.chanlocs;
        chanInd   = strmatch(channel, { tmpchanlocs.labels }, 'exact');
        specdata2  = specdata2(chanInd,:);
        
        % check results
        % -------------
        assert(specfreqs, specfreqs2, sprintf('Design %d: Frequency values...', design));
        assert(fileData , specdata  , sprintf('Design %d: ERP data, file versus std_erpplot output...', design));
        assert(fileData , specdata2 , sprintf('Design %d: ERP data, file versus recomputed output...', design));
    end;
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-4), fprintf('Pass\n'); else error('Fail\n'); end;

% -------------------------------------    
% Adapted from Octave version
% -------------------------------------
function c = hamming2(m, opt)

if (nargin < 1 || nargin > 2)
    help hamming;
    return;
end

if (~(isscalar (m) && (m == fix (m)) && (m > 0)))
    error ('hamming: M must be a positive integer');
end

N = m - 1;
if (nargin == 2)
    switch (opt)
        case 'periodic'
            N = m;
        case 'symmetric'
            % Default option, same as no option specified.
        otherwise
            error ('hamming: window type must be either "periodic" or "symmetric"');
    end
end

if (m == 1)
    c = 1;
else
    m = m - 1;
    c = 0.54 - 0.46 * cos (2 * pi * (0 : m)' / N);
end

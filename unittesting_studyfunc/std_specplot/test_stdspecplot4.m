function test_stdspecplot4

eegvers = eeg_getversion;
eegnewvers = str2double(eegvers(1:2)) > 14;
if isnan(eegnewvers) || eegvers(1) == 'd', eegnewvers = 1; end % 'd' is dev version
if ~exist('newtimefbaseln'), eegnewvers = 0; end

readsamplestudy;
allchanlocs = eeg_mergelocs(ALLEEG.chanlocs);
rmbase  = []; %[-1000 -500];

clustInd = 3;
compInd  = 5;
condInd  = 1;

for design = 1:length(STUDY.design)

    % skip some designs for EEGLAB 9
    % ------------------------------
    skipdesign = 0;
    if eegvers(1) == '9'
        if any(cellfun(@iscell, STUDY.design(design).variable(2).value)) || any(cellfun(@iscell, STUDY.design(design).variable(1).value))
            skipdesign = 1;
        end;
        if ~isempty(STUDY.design(design).variable(1).value) && isnumeric(STUDY.design(design).variable(1).value{1}) && ...
                any(cellfun(@length, STUDY.design(design).variable(1).value) > 1)
                    skipdesign = 1; % combined indep. var. values
        end;
        if ~isempty(STUDY.design(design).variable(2).value) && isnumeric(STUDY.design(design).variable(2).value{1}) && ...
                any(cellfun(@length, STUDY.design(design).variable(2).value) > 1)
                    skipdesign = 1;% combined indep. var. values
        end;
        if any(cellfun(@(x)(isempty(x{1})), { STUDY.design(design).cell.trials })) % design with empty trials
            skipdesign = 1;
        end;
    end;
    
    if ~skipdesign
        
        % use EEGLAB STUDY functions
        % --------------------------
        STUDY = std_selectdesign(STUDY, ALLEEG, design);
        [STUDY,ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'savetrials','on','recompute','on', 'spec','on', 'specparams', { 'specmode', 'fft' });
        [STUDY,specdataAll,specfreqs] = std_specplot(STUDY, ALLEEG, 'clusters', clustInd); close;
        
        set       = STUDY.cluster(clustInd).sets(condInd,compInd);
        component = STUDY.cluster(clustInd).comps(compInd);
        condName  = STUDY.datasetinfo(set).condition;
        subject   = STUDY.datasetinfo(set).subject;
        condPos   = strmatch(condName, STUDY.design(design).variable(1).value, 'exact');
        
        specdata = specdataAll{condPos}(:,compInd)';
        
        % get data from file
        % ------------------
        % get data from file
        % ------------------
        if eegnewvers
            fileBase  = fullfile(STUDY.datasetinfo(set).filepath, subject);
            fileDataOri  = load('-mat', [ fileBase '.icaspec']);
            fileData     = getfield(fileDataOri, [ 'comp' int2str(component) ]);
            fileTrials = strmatch(condName, { fileDataOri.trialinfo.condition }, 'exact');
            fileData = mean(fileData(:, fileTrials),2)';
        else
            allCells = STUDY.design(design).cell;
            indS    = strmatch(subject, {allCells.case}); allCells = allCells(indS);
            indVar1 = strmatch(condName, cellfun(@(x)x{1}, {allCells.value}, 'uniformoutput', false), 'exact'); allCells = allCells(indVar1);
            % add code here for second variable if necessary
            if length(allCells) ~= 1
                error('wrong number of cell detected');
            end;
            fileBase  = allCells(1).filebase;
            fileDataOri  = load('-mat', [ fileBase '.icaspec']);
            fileData  = getfield(fileDataOri, [ 'comp' int2str(component) ]);
            fileData = mean(fileData(:, :),2)';
        end;
        
        %% compute the measure directly
        % -----------------------------
        TMPEEG = ALLEEG(set);
        X             = eeg_getdatact(TMPEEG, 'component', component, 'trialindices', [1:ALLEEG(set).trials]);
        TMPEEG.trials = size(X,3);

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
        
        % check results
        % -------------
        assert(specfreqs, specfreqs2, sprintf('Design %d: Frequency values...', design));
        assert(fileData , specdata  , sprintf('Design %d: Spectrum data, file versus std_erpplot output...', design));
        assert(fileData , specdata2 , sprintf('Design %d: Spectrum data, file versus recomputed output...', design));
    end;
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-3) || all(abs(expression1 + expression2) < 10^-4), fprintf('Pass\n'); else error('Fail\n'); end; 

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

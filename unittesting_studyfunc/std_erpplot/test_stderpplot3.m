function test_stderpplot3

% the STUDY is no longer compatible with versions of EEGLAB lower than 13

readsamplestudy;
eegvers = eeg_getversion;
eegnewvers = str2double(eegvers(1:2)) > 14;
if isnan(eegnewvers) || eegvers(1) == 'd', eegnewvers = 1; end % 'd' is dev version

if ~eegnewvers
    STUDY.design(1).cell = [];
    STUDY = std_checkset(STUDY, ALLEEG);
end;

allchanlocs = eeg_mergelocs(ALLEEG.chanlocs);
rmbase  = []; %[-1000 -500];
%channel = 'F7'; %allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
channel = allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
%channel = allchanlocs(2).labels;
%channel = 'F9';

clustInd = 3;
compInd  = 2;
condInd  = 2;

for design = 1:length(STUDY.design)
    
    % use EEGLAB STUDY functions
    % --------------------------
    STUDY = std_selectdesign(STUDY, ALLEEG, design);
    [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'savetrials','on','recompute','on', 'interp', 'on', 'erp','on', 'erpparams', { 'rmbase', rmbase });
    [STUDY erpdataAll erptimes] = std_erpplot(STUDY, ALLEEG, 'clusters', clustInd); close;
    
    set       = STUDY.cluster(clustInd).sets(condInd,compInd);
    component = STUDY.cluster(clustInd).comps(compInd);
    condName  = STUDY.datasetinfo(set).condition;
    subject   = STUDY.datasetinfo(set).subject;
    condPos   = strmatch(condName, STUDY.design(design).variable(1).value, 'exact');
    
    erpdata = erpdataAll{condPos}(:,compInd)';
    
    % get data from file
    % ------------------
    if eegnewvers
        fileBase  = fullfile(STUDY.datasetinfo(set).filepath, subject);
        fileDataOri  = load('-mat', [ fileBase '.icaerp']);
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
        fileDataOri  = load('-mat', [ fileBase '.icaerp']);
        fileData  = getfield(fileDataOri, [ 'comp' int2str(component) ]);
        fileData = mean(fileData(:, :),2)';
    end;
    
    %% compute the measure directly
    % -----------------------------
    TMPEEG = ALLEEG(set);
    erpdata2      = eeg_getdatact(TMPEEG, 'component', component, 'trialindices', [1:ALLEEG(set).trials]);
    TMPEEG.trials = size(TMPEEG.data,3);
    if ~isempty(rmbase)
        [tmp timebeg] = min(abs(TMPEEG.times - rmbase(1)));
        [tmp timeend] = min(abs(TMPEEG.times - rmbase(2)));
        basePoints = timebeg:timeend;
        erpdata2  = bsxfun(@minus, mean(erpdata2,3), mean(mean(erpdata2(:,basePoints,:),2),3));
    else erpdata2 = mean(erpdata2,3);
    end;
    erptimes2 = TMPEEG.times;
    
    % check results
    % -------------
    if sign(erpdata(1)) ~= sign(fileData(1)), erpdata = -erpdata; end; % compensate for sign inversion
    assert(erptimes, erptimes2, sprintf('Design %d: Time values...', design));
    assert(fileData, erpdata , sprintf('Design %d: ERP data, file versus std_erpplot output...', design));
    assert(fileData, erpdata2 , sprintf('Design %d: ERP data, file versus recomputed output...', design));
end

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-4) || all(abs(expression1 + expression2) < 10^-4), fprintf('Pass\n'); else error('Fail\n'); end;

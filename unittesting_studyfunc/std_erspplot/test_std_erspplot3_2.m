function test_std_erspplot3_2

eegvers = eeg_getversion;
eegnewvers = str2double(eegvers(1:2)) > 14;
if isnan(eegnewvers) || eegvers(1) == 'd', eegnewvers = 1; end % 'd' is dev version
if ~eegnewvers || ~exist('newtimefbaseln')
    return;
end

readsamplestudy;
allchanlocs = eeg_mergelocs(ALLEEG.chanlocs);
rmbase  = []; %[-1000 -500];
%channel = 'F7'; %allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
channel = allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
%channel = allchanlocs(2).labels;
%channel = 'F9';
eegvers = eeg_getversion;

clustInd = 3;
compInd  = 2;
condInd  = 2;

for design = 1:length(STUDY.design)
    
    % use EEGLAB STUDY functions
    % --------------------------
    STUDY = std_selectdesign(STUDY, ALLEEG, design);
    [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'savetrials','on', 'recompute','on', 'interp', 'on', 'ersp','on', 'erspparams', {'cycles' [3 0.8]  'nfreqs' 10 'ntimesout' 10 'baseline' NaN 'verbose' 'off'});
    [STUDY erspdataAll ersptimes erspfreqs] = std_erspplot(STUDY, ALLEEG, 'clusters', clustInd); close;
    
    set       = STUDY.cluster(clustInd).sets(condInd,compInd);
    component = STUDY.cluster(clustInd).comps(compInd);
    condName  = STUDY.datasetinfo(set).condition;
    subject   = STUDY.datasetinfo(set).subject;
    fileBase  = fullfile(STUDY.datasetinfo(set).filepath, subject);
    condPos   = strmatch(condName, STUDY.design(design).variable(1).value, 'exact');
    
    erspdata = erspdataAll{condPos}(:,:,compInd);
    
    % get data from file
    % ------------------
    fileData     = load('-mat', [ fileBase '.icatimef']);
    params       = struct(fileData.parameters{:});
    rawData      = getfield(fileData, [ 'comp' int2str(component) ]);
    if eegnewvers
        fileTrials            = strmatch(condName, { fileData.trialinfo.condition }, 'exact');
        precomputed.tfdata    = rawData(:,:,fileTrials);
    end;
    precomputed.times     = ersptimes;
    precomputed.freqs     = erspfreqs;
    precomputed.recompute = 'ersp';
    cycles = params.cycles;
    params = rmfield(params, 'cycles');
    tmpParams = fieldnames(params)';
    tmpParams(2,:) = struct2cell(params)';
    srate = 1;
    TMPEEG = ALLEEG(set);
    fileData = newtimef([],TMPEEG.pnts, [TMPEEG.xmin TMPEEG.xmax]*1000, srate, cycles, 'precomputed', precomputed, 'verbose', 'off', tmpParams{:});
    
    %% compute the measure directly
    % -----------------------------
    TMPEEG = ALLEEG(set);
    datain        = eeg_getdatact(TMPEEG, 'component', component, 'trialindices', [1:ALLEEG(set).trials]);
    TMPEEG.trials = size(TMPEEG.data,3);
    [erspdata2,logitc,logbase,ersptimes2,erspfreqs2,logeboot,logiboot,alltfX] ...
        = newtimef( datain, TMPEEG.pnts, [TMPEEG.xmin TMPEEG.xmax]*1000, TMPEEG.srate, ...
        [3 0.8],   'freqscale', 'log', 'nfreqs', 10, 'ntimesout', 10, 'baseline', NaN, 'freqs', [3 TMPEEG.srate/2]); close;
    
    % check results
    % -------------
    if sign(erspdata(1)) ~= sign(fileData(1)), erspdata = -erspdata; end; % compensate for sign inversion
    assert(ersptimes, ersptimes2, sprintf('Design %d: Time values...', design));
    assert(fileData, erspdata  , sprintf('Design %d: ERSP data, file versus std_erspplot output...', design));
    assert(fileData, erspdata2 , sprintf('Design %d: ERSP data, file versus recomputed output...', design));
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(all(abs(expression1 - expression2) < 10^-4)) || all(all(abs(expression1 + expression2) < 10^-4)), fprintf('Pass\n'); else error('Fail\n'); end;






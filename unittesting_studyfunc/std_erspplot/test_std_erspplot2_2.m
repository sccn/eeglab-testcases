function test_std_erspplot2_2

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

for design = 1:length(STUDY.design)
    
    % WARNING: THE METHOD BELOW IS KIND OF A HACK
    % THE METHOD IN test_stderpplot3.m USED FOR COMPONENTS IS MUCH
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
    [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'savetrials','on', 'recompute','on', 'interp', 'on', 'ersp','on', 'erspparams', {'cycles' [3 0.8]  'nfreqs' 10 'ntimesout' 10 'baseline' NaN 'verbose' 'off'});
    [STUDY,erspdataAll,ersptimes,erspfreqs] = std_erspplot(STUDY, ALLEEG, 'channels', { channel }); close;
    erspdata = erspdataAll{posVal1, posVal2};
    
    if ~isempty(erspdata) && casePos <= size(erspdata,2)
        erspdata = erspdata(:, :, 1, casePos);
        
        % get data from file
        % ------------------
        fileData     = load('-mat', [ fileBase '.dattimef']);
        chanInd      = strmatch(channel, fileData.labels, 'exact');
        params       = struct(fileData.parameters{:});
        rawData      = getfield(fileData, [ 'chan' int2str(chanInd) ]);
        precomputed.tfdata    = rawData(:,:,trialInds{1});
        precomputed.times     = ersptimes;
        precomputed.freqs     = erspfreqs;
        precomputed.recompute = 'ersp';
        
        cycles = params.cycles;
        params = rmfield(params, 'cycles');
        tmpParams = fieldnames(params)';
        tmpParams(2,:) = struct2cell(params)';
        srate = 1;
        
        TMPEEG = ALLEEG(datInds(1));
        fileData = newtimef([],TMPEEG.pnts, [TMPEEG.xmin TMPEEG.xmax]*1000, srate, cycles, 'precomputed', precomputed, 'verbose', 'off', tmpParams{:});
        
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
        tmpchanlocs = ALLTMPEEG.chanlocs;
        chanInd   = strmatch(channel, { tmpchanlocs.labels }, 'exact');
        [erspdata2,logitc,logbase,ersptimes2,erspfreqs2,logeboot,logiboot,alltfX] ...
            = newtimef( ALLTMPEEG.data(chanInd,:,:), ALLTMPEEG.pnts, [ALLTMPEEG.xmin ALLTMPEEG.xmax]*1000, ALLTMPEEG.srate, ...
            [3 0.8],   'freqscale', 'log', 'nfreqs', 10, 'ntimesout', 10, 'baseline', NaN, 'freqs', [3 ALLTMPEEG.srate/2]); close;
        precomputed = [];
        precomputed.tfdata = alltfX;
        precomputed.times  = ersptimes2;
        precomputed.freqs  = erspfreqs2;
        precomputed.recompute = 'ersp';
        [erspdata3,logitc,logbase,ersptimes2,erspfreqs2,logeboot,logiboot,alltfX] ...
            = newtimef( [], ALLTMPEEG.pnts, [ALLTMPEEG.xmin ALLTMPEEG.xmax]*1000, ALLTMPEEG.srate, ...
            [3 0.8],  'precomputed', precomputed, 'plotersp', 'off', 'plotitc', 'off', 'freqscale', 'log', 'nfreqs', 10, 'ntimesout', 10, 'baseline', NaN, 'freqs', [3 ALLTMPEEG.srate/2]); close;
        
        % check results
        % -------------
        assert(ersptimes, ersptimes2, sprintf('Design %d: Time values...', design));
        assert(erspfreqs, erspfreqs2, sprintf('Design %d: Freq. values...', design));
        assert(fileData, erspdata  , sprintf('Design %d: ERP data, file versus std_erpplot output...', design));
        assert(fileData, erspdata2 , sprintf('Design %d: ERP data, file versus recomputed output...', design));
        assert(fileData, erspdata3 , sprintf('Design %d: ERP data, file versus recomputed output...', design));
    end;
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-3), fprintf('Pass\n'); else error('Fail\n'); end;

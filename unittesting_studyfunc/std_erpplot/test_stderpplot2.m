function test_stderpplot2;

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
        [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'savetrials','on','recompute','on', 'interp', 'on', 'erp','on', 'erpparams', { 'rmbase', rmbase });
        [STUDY erpdataAll erptimes] = std_erpplot(STUDY, ALLEEG, 'channels', { channel }); close;
        erpdata = erpdataAll{posVal1, posVal2};

        if ~isempty(erpdata) && casePos <= size(erpdata,2)

            % get data from file
            % ------------------
            fileData     = load('-mat', [ fileBase '.daterp']);
            chanInd      = strmatch(channel, fileData.labels, 'exact');
            fileData     = getfield(fileData, [ 'chan' int2str(chanInd) ]); 
            if eegnewvers
                 fileData = mean(fileData(:, trialInds{1}),2)';
            else fileData = mean(fileData,2)';
            end;
            erpdata = erpdata(:, casePos);

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
            if ~isempty(rmbase)
                 [tmp timebeg] = min(abs(ALLTMPEEG.times - rmbase(1)));
                 [tmp timeend] = min(abs(ALLTMPEEG.times - rmbase(2)));
                 basePoints = timebeg:timeend;
                 erpdata2  = bsxfun(@minus, mean(ALLTMPEEG.data,3), mean(mean(ALLTMPEEG.data(:,basePoints,:),2),3));
            else erpdata2  = mean(ALLTMPEEG.data,3);
            end;
            erptimes2 = ALLTMPEEG.times;
            tmpchanlocs = ALLTMPEEG.chanlocs;
            chanInd   = strmatch(channel, { tmpchanlocs.labels }, 'exact');
            erpdata2  = erpdata2(chanInd,:);

            % check results
            % -------------
            assert(erptimes, erptimes2, sprintf('Design %d: Time values...', design));
            assert(fileData, erpdata' , sprintf('Design %d: ERP data, file versus std_erpplot output...', design));
            assert(fileData, erpdata2 , sprintf('Design %d: ERP data, file versus recomputed output...', design));
        end;
    end;
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-4), fprintf('Pass\n'); else error('Fail\n'); end; 

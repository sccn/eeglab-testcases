function test_std_erspplot2

eegvers = eeg_getversion;
eegnewvers = str2double(eegvers(1:2)) > 13;
if isnan(eegnewvers) || eegvers(1) == 'd', eegnewvers = 1; end % 'd' is dev version
if eegnewvers
    return;
end;

readsamplestudy2;
allchanlocs = eeg_mergelocs(ALLEEG.chanlocs);
rmbase  = []; %[-1000 -500];
%channel = 'F7'; %allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
channel = allchanlocs(ceil(rand(1)*length(allchanlocs))).labels;
%channel = allchanlocs(1).labels
%channel = allchanlocs(2).labels;
%channel = 'F9';
eegvers = eeg_getversion;

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
        %randCellInd = 4; %ceil(length(STUDY.design(design).cell)*rand(1)); % random cell
        %randCellInd = 1; % works in all cases
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

        % use EEGLAB STUDY functions
        % --------------------------
        STUDY = std_selectdesign(STUDY, ALLEEG, design);
        [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'recompute','on', 'interp', 'on', 'ersp','on', 'erspparams', {'cycles' [3 0.8]  'nfreqs' 10 'ntimesout' 10 'baseline' NaN});
        [STUDY erspdata ersptimes erspfreqs] = std_erspplot(STUDY, ALLEEG, 'channels', { channel }, 'freqrange', [], 'timerange', [], 'subbaseline', 'off', 'topotime', [], 'topofreq', []); close;
        erspdata = erspdata{posVal1, posVal2};

        if ~isempty(erspdata) && casePos <= size(erspdata,2)

            % get data from file
            % ------------------
            fileData     = load('-mat', [ STUDY.design(design).cell(randCellInd).filebase '.datersp']);
            chanInd      = strmatch(channel, fileData.chanlabels, 'exact');
            fileData     = getfield(fileData, [ 'chan' int2str(chanInd) '_ersp']);    
            erspdata = erspdata(:, :, :, casePos);

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

            % check results
            % -------------
            assert(ersptimes, ersptimes2, sprintf('Design %d: Time values...', design));
            assert(erspfreqs, erspfreqs2, sprintf('Design %d: Freq. values...', design));
            assert(fileData, erspdata  , sprintf('Design %d: ERP data, file versus std_erpplot output...', design));
            assert(fileData, erspdata2 , sprintf('Design %d: ERP data, file versus recomputed output...', design));
        end;
    end;
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if all(abs(expression1 - expression2) < 10^-3), fprintf('Pass\n'); else error('Fail\n'); end; 

function test_std_erspplot3

eegvers = eeg_getversion;
eegnewvers = str2double(eegvers(1:2)) > 14;
if isnan(eegnewvers) || eegvers(1) == 'd', eegnewvers = 1; end % 'd' is dev version
if eegnewvers
    return;
end;

readsamplestudy2;
allchanlocs = eeg_mergelocs(ALLEEG.chanlocs);
rmbase  = []; %[-1000 -500];
iClust = ceil(rand(1)*length(STUDY.cluster));
%iClust = 2;
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
        STUDY = std_selectdesign(STUDY, ALLEEG, design);

        %randCellInd = 4; %ceil(length(STUDY.design(design).cell)*rand(1)); % random cell
        randCellInd = ceil(length(STUDY.design(design).cell)*rand(1));
        %randCellInd = 2; %ceil(length(STUDY.design(design).cell)*rand(1)); % random cell

        dataset = STUDY.design(design).cell(randCellInd).dataset;
        setInds = find(STUDY.cluster(iClust).sets(:) == dataset(1));
        if ~isempty(setInds)

            indepVarVal1 = STUDY.design(design).cell(randCellInd).value{1};
            indepVarVal2 = STUDY.design(design).cell(randCellInd).value{2};
            iComp = 0;
            for iCell = 1:randCellInd
                dataset = STUDY.design(design).cell(iCell).dataset;
                if isequal(STUDY.design(design).cell(iCell).value{1}, indepVarVal1) && ...
                     isequal(STUDY.design(design).cell(iCell).value{2}, indepVarVal2)
                    tmpsets = STUDY.cluster(iClust).sets';
                    setInds = find(tmpsets(:) == dataset(1));
                    setInds = mod(setInds-1, size(STUDY.cluster(iClust).sets,2))+1;
                    if ~isempty(setInds)
                        iComp = iComp+length(setInds);
                        sets       = randCellInd*ones(1,length(setInds));
                        components = STUDY.cluster(iClust).comps(setInds);
                    end;
                end;
            end;

            % get positions in the final array
            % --------------------------------
            datInds   = STUDY.design(design).cell(randCellInd).dataset;
            trialInds = STUDY.design(design).cell(randCellInd).trials;
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

            % check allinds and setinds content
            % ---------------------------------
            allinds = STUDY.cluster(iClust).allinds{posVal1, posVal2};
            setinds = STUDY.cluster(iClust).setinds{posVal1, posVal2};
            tmpComponents = allinds(iComp-length(components)+1:iComp);
            tmpSets       = setinds(iComp-length(components)+1:iComp);

            % *******************************************
            % this part test that the indices are correct
            % *******************************************
            assert(tmpComponents, components, sprintf('Design %d: checking components...', design));
            assert(tmpSets,       sets      , sprintf('Design %d: checking sets...', design));

            % select a component to plot
            % --------------------------
            compInd = ceil(rand(1)*length(STUDY.cluster(iClust).allinds{posVal1, posVal2}));
            compID  = STUDY.cluster(iClust).allinds{posVal1, posVal2}(compInd);
            cellInd = STUDY.cluster(iClust).setinds{posVal1, posVal2}(compInd);
            datInds   = STUDY.design(design).cell(cellInd).dataset;
            trialInds = STUDY.design(design).cell(cellInd).trials;

            if ~all(cellfun(@isempty, trialInds))
                % use EEGLAB STUDY functions
                % --------------------------
                [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'recompute','on', 'ersp','on', 'erspparams', {'cycles' [3 0.8]  'nfreqs' 10 'ntimesout' 10 'baseline' NaN});
                [STUDY erspdata ersptimes erspfreqs] = std_erspplot(STUDY, ALLEEG, 'clusters', iClust, 'timerange', [], 'freqrange', [], 'subbaseline', 'off', 'topotime', [], 'topofreq', []); close;
                erspdata = erspdata{posVal1, posVal2}(:, :, compInd);

                % get data from file
                % ------------------
                fileData = load('-mat', [ STUDY.design(design).cell(cellInd).filebase '.icaersp']);
                fileData = getfield(fileData, [ 'comp' int2str(compID) '_ersp' ]);    

                %% get the data directly
                % ---------------------
                ALLTMPEEG = [];
                for tmpInd = 1:length(datInds)
                    TMPEEG = ALLEEG(datInds(tmpInd));
                    TMPEEG.data = eeg_getdatact(TMPEEG, 'component', compID, 'trialindices', trialInds{tmpInd});
                    TMPEEG.trials = size(TMPEEG.data,3);
                    TMPEEG.epoch  = [];
                    if isempty(ALLTMPEEG), ALLTMPEEG = TMPEEG;
                    else                   ALLTMPEEG = pop_mergeset(ALLTMPEEG, TMPEEG);
                    end;
                end;
                [erspdata2,logitc,logbase,ersptimes2,erspfreqs2,logeboot,logiboot,alltfX] ...
                      = newtimef( ALLTMPEEG.data, ALLTMPEEG.pnts, [ALLTMPEEG.xmin ALLTMPEEG.xmax]*1000, ALLTMPEEG.srate, ...
                        [3 0.8],   'freqscale', 'log', 'nfreqs', 10, 'ntimesout', 10, 'baseline', NaN, 'freqs', [3 ALLTMPEEG.srate/2]); close;
                %mormICA  = sqrt(mean(ALLEEG(datInds(1)).icawinv.^2));
                %erspdata2 = mormICA(compID) * erspdata2;
                %erptimes2 = ALLTMPEEG.times;

                % *******************************************
                % this part test that the ERP data is correct
                % *******************************************
                assert(ersptimes, ersptimes2, sprintf('Design %d: Time values...', design));
                assert(erspfreqs, erspfreqs2, sprintf('Design %d: Frequency values...', design));
                assert(fileData,  erspdata  , sprintf('Design %d: ERSP data, file versus std_erspplot output...', design));
                assert(fileData,  erspdata2 , sprintf('Design %d: ERSP data, file versus recomputed output...', design));
            end;
        end;
    end;
end;

% function to assert difference
% -----------------------------
function assert(expression1, expression2, string);
fprintf(string); if max(abs(expression1(:) - expression2(:))./abs(expression1(:))) < 10^-3, fprintf('Pass\n'); else error('Fail\n'); end; 

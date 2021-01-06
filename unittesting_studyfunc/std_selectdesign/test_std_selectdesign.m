function test_std_selectdesign;
readsamplestudy2;

% the script below scan all designs and test
% that components and dataset of each cluster
% which are selected using test_std_selectdesign
% are included in the cluster

% THIS DOES NOT ENSURE THAT DATASET SELECTION IS ACCURATE

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

        if str2num(eegvers(1:2)) <= 13
            for iClust = 1:length(STUDY.cluster)
                for iInds = 1:length(STUDY.cluster(iClust).allinds(:))
                    for iElem = 1:length(STUDY.cluster(iClust).allinds{iInds})
                        comp = STUDY.cluster(iClust).allinds{iInds}(iElem);
                        set  = STUDY.cluster(iClust).setinds{iInds}(iElem);
                        set  = STUDY.design(design).cell(set).dataset;
                        
                        colComp = find(STUDY.cluster(iClust).comps == comp);
                        if ~ismember(set, STUDY.cluster(iClust).sets(:,colComp(:)))
                            error('Clusters corrupted');
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
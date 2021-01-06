function test_std_erpplot;

readsamplestudy2;
% scan all designs

% generate 32 figures
conds = { 'apart' 'together' };
stats = { 'on' 'off' };
stats2 = { 'main' 'marginal' };
plotsubjects = { 'off' 'on' };
tmpchanlocs = ALLEEG(1).chanlocs(3:9);
channels = { { 'AF3' } { tmpchanlocs.labels } };

for iDesign = 8:length(STUDY.design)
    STUDY = std_selectdesign(STUDY, ALLEEG, iDesign);
    
    % skip some designs for EEGLAB 9
    % ------------------------------
    skipdesign = 0;
    if length(STUDY.design(iDesign).variable) < 2
        skipdesign = 1;
    end
    
    if ~skipdesign
        [STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, {},'interp','on','allcomps','on','recompute','on','erp','on');
        
        nCond = fastif(length(STUDY.design(iDesign).variable(2).value) > 1, 2, 1);
        nGrp  = fastif(length(STUDY.design(iDesign).variable(2).value) > 1, 2, 1);
        for chans = 1:2
            for ps = 1:2
                for c1 = 1:nCond
                    for c2 = 1:nCond
                        for s1 = 1:nGrp
                            for s2 = 1:2
                                for s2 = 1:nGrp
                                    { 'channels', channels{chans}, 'plotsubjects', plotsubjects{ps}, 'condstats', stats{s1}, 'effect', stats2{s2}, 'groupstats', stats{s2}, 'plotgroups', conds{c1}, 'plotconditions', conds{c2}, 'threshold', NaN };
                                    
                                    STUDY = std_erpplot(STUDY, ALLEEG, 'channels', channels{chans}, 'plotsubjects', plotsubjects{ps}, 'condstats', stats{s1}, 'groupstats', stats{s2}, 'plotgroups', conds{c1}, 'plotconditions', conds{c2}, 'threshold', NaN);
                                    if (strcmpi(stats{s1}, 'on') || strcmpi(stats{s2}, 'on'))
                                        STUDY = std_erpplot(STUDY, ALLEEG, 'channels', channels{chans}, 'plotsubjects', plotsubjects{ps}, 'effect', stats2{s2}, 'condstats', stats{s1}, 'groupstats', stats{s2}, 'plotgroups', conds{c1}, 'plotconditions', conds{c2}, 'threshold', 0.05);
                                    end
                                    close; close;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

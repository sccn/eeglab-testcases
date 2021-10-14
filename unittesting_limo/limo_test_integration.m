function limotest = limo_test_integration

% Integration test for 1st level and 2nd level analyses
% depends upon Wakeman and Henson dataset https://openneuro.org/datasets/ds002718/versions/1.0.2
% run the 'statndar' preprocessing pipeline then test 1st level integration
% between STUDY and LIMO, followed by 2nd level analyses from 1st level
% outputs
% 
% OUTPUT limotest is a cell array listing the (set of) tests performed as succesfull or failed
%
% tests std_limo with two different models (categorical only or categorical
%                and continuous variables)
%       limo_glm related functions: pop_limo call --> runs models using OLS (cat) 
%                                   and WLS (cat and cont) & compute 1st level contrasts
%       limo random effect related functions: runs 1 sample, 2 samples, and paired t-tests
%                                             regression, 1 way ANOVA, 1 way ANCOVA, 
%                                             Rep. measures ANOVA and contrasts
%                          + test different inputs betas/cons as array or file
%                          + test whole brain, channel 50 & vitual channel (a vector of different channels)
%       boostraps and tfce computed (101 iterations only)
%
% untested 1st level boostrap and tfce
%          1st level factorial
%          basic stats
%          plotting

clear variables
% start EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% call BIDS tool BIDS
studypath       = fullfile(pwd, '..', 'ds002718');
studyName = 'Face_detection';

try
    rmdir(fullfile(studypath, 'derivatives_integration'), 's') 
catch
    lasterror
end

[STUDY, ALLEEG] = pop_importbids(studypath,'bidsevent','on','bidschanloc','on',...
                  'studyName',studyName,'outputdir', fullfile(studypath, 'derivatives_integration'), ...
                  'eventtype', 'trial_type');
ALLEEG          = pop_select( ALLEEG, 'nochannel',{'EEG061','EEG062','EEG063','EEG064'});
CURRENTSTUDY    = 1;
EEG             = ALLEEG;
CURRENTSET      = 1:length(EEG);
root            = fullfile(studypath, 'derivatives');

% Remove bad channels
% EEG = pop_clean_rawdata( EEG,'FlatlineCriterion',5,'ChannelCriterion',0.8,...
%     'LineNoiseCriterion',4,'Highpass',[0.25 0.75] ,...
%     'BurstCriterion','off','WindowCriterion','off','BurstRejection','off',...
%     'Distance','Euclidian','WindowCriterionTolerances','off' );
% 
% % Rereference using average reference
% EEG = pop_reref( EEG,[],'interpchan',[]);
% 
% % Run ICA and flag artifactual components using IClabel
% for s=1:size(EEG,2)
%     EEG(s) = pop_runica(EEG(s), 'icatype','picard','concatcond','on','options',{'pca',EEG(s).nbchan-1});
%     EEG(s) = pop_iclabel(EEG(s),'default');
%     EEG(s) = pop_icflag(EEG(s),[NaN NaN;0.8 1;0.8 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
%     EEG(s) = pop_subcomp(EEG(s), find(EEG(s).reject.gcompreject), 0);
% end
% 
% % clear data using ASR - just the bad epochs
% EEG = pop_clean_rawdata( EEG,'FlatlineCriterion','off','ChannelCriterion','off',...
%     'LineNoiseCriterion','off','Highpass','off','BurstCriterion',20,...
%     'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian',...
%     'WindowCriterionTolerances',[-Inf 7] );

% Extract data epochs (no baseline removed)
EEG    = pop_epoch( EEG,{'famous_new','famous_second_early','famous_second_late', ...
         'scrambled_new','scrambled_second_early','scrambled_second_late','unfamiliar_new', ...
         'unfamiliar_second_early','unfamiliar_second_late'},[-0.5 1] ,'epochinfo','yes');
EEG    = eeg_checkset(EEG);
EEG    = pop_saveset(EEG, 'savemode', 'resave');
ALLEEG = EEG;

% update study & compute single trials
STUDY        = std_checkset(STUDY, ALLEEG);
[STUDY, EEG] = std_precomp(STUDY, EEG, {}, 'savetrials','on','interp','on','recompute','on',...
    'erp','on','erpparams', {'rmbase' [-200 0]}, 'spec','off', 'ersp','off','itc','off');
eeglab redraw

% add 3 groups
[STUDY.datasetinfo(1:6).group]   = deal('1');
[STUDY.datasetinfo(7:13).group]  = deal('2');
[STUDY.datasetinfo(14:18).group] = deal('3');


%% test std_limo and 1st level GLM
studyfullname = fullfile(studypath, 'derivatives_integration', [ studyName '.study' ]);

tic
if exist(studyfullname,'file')
    [root,std_name,ext]=fileparts(studyfullname);
    cd(root); EEG = eeglab;
    %% load STUDY
    [STUDY, ALLEEG] = pop_loadstudy('filename', [std_name ext], 'filepath', root);
    % update to have 3 groups if not present
    [STUDY.datasetinfo(1:6).group ]= deal('1');
    [STUDY.datasetinfo(7:13).group ]= deal('2');
    [STUDY.datasetinfo(14:18).group ]= deal('3');

else
    error('study file nout found')
end

% ------------------------------------------------------------
%       LIMO TESTING STARTS HERE
% ------------------------------------------------------------

%% test std_limo and 1st level GLM

try
    % make categorical design & estimate with OLS
    STUDY = std_makedesign(STUDY, ALLEEG, 1, 'name','FaceRepetition','delfiles','off','defaultdesign','off',...
        'variable1','type','values1',{'famous_new','famous_second_early','famous_second_late','scrambled_new','scrambled_second_early','scrambled_second_late','unfamiliar_new','unfamiliar_second_early','unfamiliar_second_late'},...
        'vartype1','categorical','subjselect',{'sub-002','sub-003','sub-004','sub-005','sub-006','sub-007','sub-008','sub-009','sub-010','sub-011','sub-012','sub-013','sub-014','sub-015','sub-016','sub-017','sub-018','sub-019'});
    [STUDY, EEG] = pop_savestudy( STUDY, EEG, 'savemode','resave');
    
    % cleanup previous version
    [~,limo_rootfiles,~]=fileparts(STUDY.filename);
    limo_rootfiles = fullfile(root,['LIMO_' limo_rootfiles]);
    if exist([limo_rootfiles filesep 'limo_batch_report'],'dir')
        rmdir([limo_rootfiles filesep 'limo_batch_report'],'s')
    end
    for sub = 1:length(STUDY.subject)
        if exist(fullfile(root,[STUDY.subject{1} filesep 'eeg' filesep 'FaceRepetition_GLM_Channels_Time_OLS']),'dir')
            rmdir(fullfile(root,[STUDY.subject{1} filesep 'eeg' filesep 'FaceRepetition_GLM_Channels_Time_OLS']),'s')
        end
    end
    
    % compute 1st model with OLS
    [STUDY, ~, Model1_files] = pop_limo(STUDY, ALLEEG, 'method','OLS','measure','daterp','timelim',[-50 650],'erase','on','splitreg','off','interaction','off');
    contrast.LIMO_files      = Model1_files.mat; 
    contrast.mat             = [1 1 1 -1 -1 -1 0 0 0 0 ; 0 0 0 1 1 1 -1 -1 -1 0];
    confiles                 = limo_batch('contrast only',[],contrast,STUDY); 
    Model1_files.con         = confiles.con;
    clear confiles
    limotest{1} = 'categorical design + contrasts with OLS estimates successful';
catch err
    fprintf('%s\n',err.message)
    limotest{1} = sprintf('categorical design + contrasts with OLS estimates failed \n%s',err.message);
end

try
    % make categorical+continuous design & estimate with WLS
    STUDY = std_makedesign(STUDY, ALLEEG, 2, 'name','Face_time','delfiles','off','defaultdesign','off',...
        'variable1','face_type','values1',{'famous','scrambled','unfamiliar'},'vartype1','categorical',...
        'variable2','time_dist','values2',[],'vartype2','continuous',...
        'subjselect',{'sub-002','sub-003','sub-004','sub-005','sub-006','sub-007','sub-008','sub-009','sub-010','sub-011','sub-012','sub-013','sub-014','sub-015','sub-016','sub-017','sub-018','sub-019'});
    [STUDY, EEG] = pop_savestudy( STUDY, EEG, 'savemode','resave');
    
    % cleanup previous version
    for sub = 1:length(STUDY.subject)
        if exist(fullfile(root,[STUDY.subject{1} filesep 'eeg' filesep 'Face_time_GLM_Channels_Time_WLS']),'dir')
            rmdir(fullfile(root,[STUDY.subject{1} filesep 'eeg' filesep 'Face_time_GLM_Channels_Time_WLS']),'s')
        end
    end
    
    % compute 1st model with WLS
    [STUDY, ~, Model2_files] = pop_limo(STUDY, ALLEEG, 'method','WLS','measure','daterp','timelim',[-50 650],'erase','on','splitreg','on','interaction','off');
    contrast.LIMO_files      = Model2_files.mat; 
    contrast.mat             = [0 0 0 -1 0 1];
    confiles                 = limo_batch('contrast only',[],contrast); % do not pass STUDY argument, should still figure it out
    Model2_files.con         = confiles.con;
    clear confiles
    limotest{2} = 'mixed design with WLS estimates + contrast successful';
catch err
    fprintf('%s\n',err.message)
    limotest{2} = sprintf('mixed design with WLS estimates + contrast failed \n%s',err.message);
end

%% 2nd level analyses
cd(root); mkdir('2nd_level_tests'); cd('2nd_level_tests');
channel_vector = limo_best_electrodes(fullfile(limo_rootfiles, 'LIMO_files_Face_time_GLM_Channels_Time_WLS.txt'));
save('virtual_electrode','channel_vector')

% ---------------------------------------------------------------------
% one sample t-test
try
    % one sample t-test whole brain with a cell array of con files as input
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('one_sample'); cd('one_sample')
    LIMOPath = limo_random_select('one sample t-test',STUDY.limo.chanloc,...
        'LIMOfiles',Model2_files.con,...
        'analysis_type','Full scalp analysis', 'type','Channels','nboot',101,'tfce',1);
    
    % one sample t-test channel 50 file list of con files
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('one_sample50'); cd('one_sample50')
    LIMOPath = limo_random_select('one sample t-test',STUDY.limo.chanloc,...
        'LIMOfiles',[limo_rootfiles filesep 'con_1_files_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt'],...
        'analysis_type','1 channel/component only', 'Channel',50,'type','Channels','nboot',101,'tfce',1);
    
    % one sample t-test virtual channel - array of Betas
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('one_sampleOPT'); cd('one_sampleOPT')
    LIMOPath = limo_random_select('one sample t-test',STUDY.limo.chanloc,...
        'LIMOfiles',Model2_files.Beta, 'analysis_type','1 channel/component only', 'Channel',channel_vector, ...
        'type','Channels','parameter',{[1  3 7]},'nboot',101,'tfce',1);
    limotest{3} = 'one sample t-tests successful';
catch err
    fprintf('%s\n',err.message)
    limotest{3} = sprintf('one sample t-tests failed \n%s',err.message);
end

% ---------------------------------------------------------------------
% regression
try
    % regression (calls similar routines as one sample)
    % regression whole brain with an array of con files as input and a matrix as regressor
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('regression'); cd('regression')
    LIMOPath = limo_random_select('regression',STUDY.limo.chanloc,...
        'LIMOfiles',Model2_files.con,'regressor_file',randi(length(Model2_files.con),length(Model2_files.con),2),...
        'analysis_type','Full scalp analysis', 'type','Channels','zscore','yes','skip design check','yes','nboot',101,'tfce',1);
    
    % regression channel 50 file list of con files as input and a file as regressor
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('regression50'); cd('regression50')
    randomreg = randn(length(Model2_files.con),1); save('reg.mat','randomreg');
    LIMOPath = limo_random_select('regression',STUDY.limo.chanloc,'regressor_file',[pwd filesep 'reg.mat'],...
        'LIMOfiles',[limo_rootfiles filesep 'con_1_files_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt'],...
        'analysis_type','1 channel/component only', 'Channel',50,'type','Channels','zscore','yes','skip design check','yes','nboot',101,'tfce',1);
    
    % regression virtual channel - list of Betas files, select a parameter, load optimized channel file
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('regressionOPT'); cd('regressionOPT')
    LIMOPath = limo_random_select('regression',STUDY.limo.chanloc,...
        'LIMOfiles',[limo_rootfiles filesep 'Beta_files_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt'], ...
        'parameter',3, 'regressor_file',randi(length(Model2_files.con),length(Model2_files.con),2), ...
        'analysis_type','1 channel/component only', 'type','Channels', ...
        'Channel',fullfile(root,['2nd_level_tests' filesep 'virtual_electrode.mat']), ...
        'zscore','yes','skip design check','yes','nboot',101,'tfce',1);
    limotest{4} = 'regressions successful';
catch err
    fprintf('%s\n',err.message)
    limotest{4} = sprintf('regressions failed \n%s',err.message);
end

% ---------------------------------------------------------------------
% paired t-test
try
    % paired t-test whole brain with a cell array of con files as input
    clear data
    for N=length(STUDY.subject):-1:1
        data{1,N} = Model1_files.con{N}(1);
        data{2,N} = Model1_files.con{N}(2);
    end
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('paired_t-test'); cd('paired_t-test')
    LIMOPath = limo_random_select('paired t-test',STUDY.limo.chanloc,...
        'LIMOfiles',data,'analysis_type','Full scalp analysis', 'type','Channels','nboot',101,'tfce',1);
    
    % paired t-test channel 50 with file list of con files
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('paired_t-test50'); cd('paired_t-test50')
    datafiles = {[limo_rootfiles filesep 'con_1_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt'], ...
        [limo_rootfiles filesep 'con_2_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']};
    LIMOPath = limo_random_select('paired t-test',STUDY.limo.chanloc,'LIMOfiles',datafiles,...
         'analysis_type','1 channel/component only', 'Channel',50,'type','Channels','nboot',101,'tfce',1);
    
    % paired t-test virtual channel with file list of Betas
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('paired_t-testOPT'); cd('paired_t-testOPT')
    LIMOPath = limo_random_select('paired t-test',STUDY.limo.chanloc,...
        'LIMOfiles',[limo_rootfiles filesep 'Beta_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt'], ...
        'analysis_type','1 channel/component only', 'Channel',channel_vector, ...
        'type','Channels','parameter',[1 4],'nboot',101,'tfce',1);
    limotest{5} = 'paired t-test successful';
catch err
    fprintf('%s\n',err.message)
    limotest{5} = sprintf('paired t-test failed \n%s',err.message);
end

% ---------------------------------------------------------------------
% two samples t-test
try
    % two-samples t-test whole brain with a cell array of con files as input
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('two-samples_t-test'); cd('two-samples_t-test')
    LIMOPath = limo_random_select('two-samples t-test',STUDY.limo.chanloc,...
        'LIMOfiles',data,'analysis_type','Full scalp analysis', 'type','Channels','nboot',101,'tfce',1);
    
    % two-samples t-test channel 50 with file list of con files
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('two-samples_t-test50'); cd('two-samples_t-test50')
    LIMOPath = limo_random_select('two-samples t-test',STUDY.limo.chanloc,'LIMOfiles',datafiles,...
         'analysis_type','1 channel/component only', 'Channel',50,'type','Channels','nboot',101,'tfce',1);
    
    % two-samples t-test virtual channel with file list of Betas
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('two-samples_t-testOPT'); cd('two-samples_t-testOPT'); clear Bfiles
    Bfiles{1} = [limo_rootfiles filesep 'Beta_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt'];
    Bfiles{2} = [limo_rootfiles filesep 'Beta_files_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt'];
    LIMOPath = limo_random_select('two-samples t-test',STUDY.limo.chanloc,...
        'LIMOfiles',Bfiles, 'analysis_type','1 channel/component only', 'Channel',repmat(channel_vector,[2,1]),...
        'type','Channels','parameter',[1 4],'nboot',101,'tfce',1);
    limotest{6} = 'two samples t-test successful';
catch err
    fprintf('%s\n',err.message)
    limotest{6} = sprintf('two samples t-test failed \n%s',err.message);
end

% ---------------------------------------------------------------------
% 1-way ANOVA + contrast
try
    % N-Ways ANOVA whole brain with a cell array of con files as input with empty cells 
    clear data
    index = find(arrayfun(@(x) contains(x.group,'1'), STUDY.datasetinfo));
    for s=1:length(index); data{1,s} = Model1_files.con{index(s)}(1); end
    index = find(arrayfun(@(x) contains(x.group,'2'), STUDY.datasetinfo));
    for s=1:length(index); data{2,s} = Model1_files.con{index(s)}(1); end
    index = find(arrayfun(@(x) contains(x.group,'3'), STUDY.datasetinfo));
    for s=1:length(index); data{3,s} = Model1_files.con{index(s)}(1); end
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('N-Ways ANOVA'); cd('N-Ways ANOVA')
    LIMOPath = limo_random_select('N-Ways ANOVA',STUDY.limo.chanloc,'LIMOfiles',data',...
        'analysis_type','Full scalp analysis', 'type','Channels','nboot',101,'tfce',1,'skip design check','yes');
    
    % N-Ways ANOVA channel 50 with file list of con files
    % con per group files already exist split according to STUDY
    datafiles = {fullfile(limo_rootfiles, ['con_1_files_Gp1_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']), ...
        fullfile(limo_rootfiles, ['con_1_files_Gp2_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']),...
        fullfile(limo_rootfiles, ['con_1_files_Gp3_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt'])};
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('N-Ways ANOVA50'); cd('N-Ways ANOVA50')
    LIMOPath = limo_random_select('N-Ways ANOVA',STUDY.limo.chanloc,'LIMOfiles',datafiles,...
        'analysis_type','1 channel/component only', 'Channel',50,'type','Channels',...
        'nboot',101,'tfce',1,'skip design check','yes');
    
    % N-Ways ANOVA  virtual channel with file list of Betas and input parameters
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('N-Ways ANOVAOPT'); cd('N-Ways ANOVAOPT')
    for g=3:-1:1
        Bfiles{g} = [limo_rootfiles filesep 'Beta_files_Gp' num2str(g) '_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt'];
    end
    LIMOPath = limo_random_select('N-Ways ANOVA',STUDY.limo.chanloc,...
        'LIMOfiles',Bfiles, 'analysis_type','1 channel/component only', ...
        'Channel',fullfile(root,['2nd_level_tests' filesep 'virtual_electrode.mat']), ...
        'type','Channels','parameter',{[1;1;1]},'nboot',101,'tfce',1,'skip design check','yes');    
    limotest{7} = '1-way ANOVA successful';
catch err
    fprintf('%s\n',err.message)
    limotest{7} = sprintf('1-way ANOVA failed \n%s',err.message);
end

% ---------------------------------------------------------------------
% 1-way ANCOVA + contrast
try
    % N-Ways ANCOVA whole brain with a cell array of con files as input with empty cells 
    clear data
    index = find(arrayfun(@(x) contains(x.group,'1'), STUDY.datasetinfo));
    for s=1:length(index); data{1,s} = Model1_files.con{index(s)}(1); end
    index = find(arrayfun(@(x) contains(x.group,'2'), STUDY.datasetinfo));
    for s=1:length(index); data{2,s} = Model1_files.con{index(s)}(1); end
    index = find(arrayfun(@(x) contains(x.group,'3'), STUDY.datasetinfo));
    for s=1:length(index); data{3,s} = Model1_files.con{index(s)}(1); end
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('ANCOVA'); cd('ANCOVA')
    LIMOPath = limo_random_select('ANCOVA',STUDY.limo.chanloc,'LIMOfiles',data,... % transpose data = wrong but let limo fix it
        'analysis_type','Full scalp analysis', 'type','Channels',...
        'regressor_file', randn(18,2), 'nboot',101,'tfce',1,'skip design check','yes');
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'Betas.mat'], ...
        [pwd filesep 'LIMO.mat'],'T',1,[0 0 0 1 -1 0]); % contrast
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'H0' filesep 'H0_Betas.mat'], ...
        [pwd filesep 'LIMO.mat'],'T',2,[0 0 0 1 -1 0]); % boostrap / tfce

    % N-Ways ANCOVA channel 50 with file list of con files
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('ANCOVA50'); cd('ANCOVA50')
    LIMOPath = limo_random_select('ANCOVA',STUDY.limo.chanloc,'LIMOfiles',datafiles(1:2),...
        'analysis_type','1 channel/component only', 'Channel',50,'type','Channels',...
        'regressor_file', randn(13,2),'nboot',101,'tfce',1,'skip design check','yes');
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'Betas.mat'], ...
        [pwd filesep 'LIMO.mat'],'T',1,[0 0 1 -1 0]); % contrast
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'H0' filesep 'H0_Betas.mat'], ...
        [pwd filesep 'LIMO.mat'],'T',2,[0 0 1 -1 0]); % boostrap / tfce
    
    % N-Ways ANCOVA  virtual channel with file list of Betas and input parameters
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('ANCOVAOPT'); cd('ANCOVAOPT')
    LIMOPath = limo_random_select('ANCOVA',STUDY.limo.chanloc,...
        'LIMOfiles',Bfiles, 'analysis_type','1 channel/component only', 'Channel',repmat(channel_vector,[2,1]),...
        'regressor_file', randn(18,2),'type','Channels','parameter',[1 4 1],'nboot',101,'tfce',1,'skip design check','yes');    
    limotest{8} = 'ANCOVA + contrast successful';
catch err
    fprintf('%s\n',err.message)
    limotest{8} = sprintf('1-way ANCOVA + contrast failed \n%s',err.message);
end

% ---------------------------------------------------------------------
% Repeated measures ANOVA + contrast
try
    % whole brain with Beta files as input
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('Rep-ANOVA'); cd('Rep-ANOVA')
    limo_random_select('Repeated Measures ANOVA',STUDY.limo.chanloc,'LIMOfiles',...
        {[limo_rootfiles filesep 'Beta_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']},...
        'analysis_type','Full scalp analysis','parameters',{[1 2 3],[4 5 6],[7 8 9]},...
        'factor names',{'face','repetition'},'type','Channels','nboot',101,'tfce',1,'skip design check','yes');
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'LIMO.mat'],...
        3,[1 1 1 -2 -2 -2 1 1 1]); % contrast
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'LIMO.mat'],...
        4,[1 1 1 -2 -2 -2 1 1 1]); % boostrap / tfce
    
    % whole brain with Beta files as input split by groups
    cd(fullfile(root,'2nd_level_tests'));
    mkdir('GpRep-ANOVA'); cd('GpRep-ANOVA')
    limo_random_select('Repeated Measures ANOVA',STUDY.limo.chanloc,'LIMOfiles',...
        {[limo_rootfiles filesep 'Beta_files_Gp1_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt'];
        [limo_rootfiles filesep 'Beta_files_Gp2_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt'];
        [limo_rootfiles filesep 'Beta_files_Gp3_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt']},...
        'analysis_type','Full scalp analysis','parameters',{[1 2 3]},... % in theory {[1 2 3];[1 2 3];[1 2 3]} but it's taken care of
        'factor names',{'face'},'type','Channels','nboot',101,'tfce',1,'skip design check','yes');
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'LIMO.mat'],...
        3,[1 -2 1]); % contrast
    limo_contrast([pwd filesep 'Yr.mat'], [pwd filesep 'LIMO.mat'],...
        4,[1 -2 1]); % boostrap / tfce
    
    % channel 50 with con files as input
    cd(fullfile(root,'2nd_level_tests'));
    clear datafiles % spurious design but we need enough subjects to run
    datafiles{1,1} = fullfile(limo_rootfiles, ['con_1_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']); 
    datafiles{1,2} = fullfile(limo_rootfiles, ['con_1_files_' STUDY.design(2).name '_GLM_Channels_Time_WLS.txt']); 
    datafiles{1,3} = fullfile(limo_rootfiles, ['con_2_files_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']);
    mkdir('Rep-ANOVA50'); cd('Rep-ANOVA50')
    limo_random_select('Repeated Measures ANOVA',STUDY.limo.chanloc,'LIMOfiles',datafiles,...
        'analysis_type','1 channel/component only', 'Channel',50, 'factor names',{'face'},...
        'parameters',{[1 1 1]},'type','Channels','nboot',101,'tfce',1,'skip design check','yes');

    % also use gp + con files + optimized channel
    cd(fullfile(root,'2nd_level_tests'));
    clear datafiles; datafiles = cell(3,2);
    datafiles{1,1} = fullfile(limo_rootfiles, ['con_1_files_Gp1_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']); 
    datafiles{1,2} = fullfile(limo_rootfiles, ['con_2_files_Gp1_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']);
    datafiles{2,1} = fullfile(limo_rootfiles, ['con_1_files_Gp2_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']);
    datafiles{2,2} = fullfile(limo_rootfiles, ['con_2_files_Gp2_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']); 
    datafiles{3,1} = fullfile(limo_rootfiles, ['con_1_files_Gp3_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']);
    datafiles{3,2} = fullfile(limo_rootfiles, ['con_2_files_Gp3_' STUDY.design(1).name '_GLM_Channels_Time_OLS.txt']);
    mkdir('GpRep-ANOVAOPT'); cd('GpRep-ANOVAOPT')
    limo_random_select('Repeated Measures ANOVA',STUDY.limo.chanloc,'LIMOfiles',datafiles,...
        'analysis_type','1 channel/component only', 'Channel',channel_vector, 'factor names',{'face'},...
        'parameters',{[1 1];[1 1];[1 1]},'type','Channels','nboot',101,'tfce',1,'skip design check','yes');
    limotest{9} = 'Repeated measures ANOVA + contrast successful';
catch err
    fprintf('%s\n',err.message)
    limotest{9} = sprintf('Repeated measures ANOVA + contrast failed \n%s',err.message);
end

% ---------------------------------------------------------------------
cd(root);toc
limotest'
if all(contains(limotest,'successful'))
    disp('deleting all created files - test successful')
    try mdir('2nd_level_tests','s'); end
    try rmdir(limo_rootfiles,'s'); end
else
    error('test failure - files were not deleted from drive')
end





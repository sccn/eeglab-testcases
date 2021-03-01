% Validation script for the Weighted Least Square minimization method
% developped in LIMO EEG. There is only two thing to do to run the script
% and fully reproduce the analysis:
% 1 - downlad the data @
% 2 - define where are those downloaded data
% from here, it should run until all results are there
clear variables

studypath = fullfile(pwd, '..', 'ds002718');

%%  quick check
if ~isfolder(studypath)
    error('invalid study path')
end

if ~exist('eeglab.m','file')
    error('EEGLAB is not in your path')
end

if ~exist('pop_importbids.m','file')
    error('EEGLAB BIDS import tools are not your path')
end

if ~exist('limo_eeg.m','file')
    error('LIMO tools are not in your path')
end

if ~exist('limo_test_glmboot.m','file')
    error('get/set limo validation tools to check type 1 error')
end

try
    rmdir(fullfile(studypath, 'derivative_IRLS'), 's') 
catch
    lasterror
end

%% get the data
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
[STUDY, ALLEEG] = pop_importbids(studypath, 'bidsevent','on','bidschanloc','on', 'studyName','Face_detection', 'eventtype', 'trial_type', 'outputdir' , fullfile(studypath, 'derivative_IRLS'));
STUDY.studypath = fullfile(studypath, 'derivative_IRLS');
ALLEEG = pop_select( ALLEEG, 'nochannel',{'EEG061','EEG062','EEG063','EEG064'});
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = 1:length(EEG);

%% Preprocessing
% Clean data - just the bad channels
EEG = pop_clean_rawdata( EEG,'FlatlineCriterion',5,'ChannelCriterion',0.8,...
    'LineNoiseCriterion',4,'Highpass',[0.25 0.75] ,...
    'BurstCriterion','off','WindowCriterion','off','BurstRejection','off',...
    'Distance','Euclidian','WindowCriterionTolerances','off' );

% Rereference using average reference
EEG = pop_reref( EEG,[],'interpchan',[]);

% Run ICA and flag artifactual components using IClabel
for s=1:size(EEG,2)
    EEG(s) = pop_runica(EEG(s), 'icatype','picard','concatcond','on','options',{'pca',EEG(s).nbchan-1});
    EEG(s) = pop_iclabel(EEG(s),'default');
    EEG(s) = pop_icflag(EEG(s),[NaN NaN;0.8 1;0.8 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
    EEG(s) = pop_subcomp(EEG(s), find(EEG(s).reject.gcompreject), 0);
end

% clear data using ASR - just the bad epochs
EEG = pop_clean_rawdata( EEG,'FlatlineCriterion','off','ChannelCriterion','off',...
    'LineNoiseCriterion','off','Highpass','off','BurstCriterion',20,...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian',...
    'WindowCriterionTolerances',[-Inf 7] );

% Extract data epochs (no baseline removed)
EEG    = pop_epoch( EEG,{'famous_new','famous_second_early','famous_second_late','scrambled_new','scrambled_second_early','scrambled_second_late','unfamiliar_new','unfamiliar_second_early','unfamiliar_second_late'},...
    [-0.5 1] ,'epochinfo','yes');
EEG    = eeg_checkset(EEG);
EEG    = pop_saveset(EEG, 'savemode', 'resave');
ALLEEG = EEG;

%% Create study design and run the HLM with each method
STUDY  = std_checkset(STUDY, ALLEEG);
STUDY  = std_makedesign(STUDY, EEG, 1, 'name','STUDY.FaceRepetition','delfiles','off','defaultdesign','off','variable1','type','values1',{});
eeglab redraw

% Precompute ERP with baseline correction [-200 0]
[STUDY, EEG] = std_precomp(STUDY, EEG, {}, 'savetrials','on','interp','on','recompute','on',...
    'erp','on','erpparams', {'rmbase' [-200 0]}, 'spec','on',...
    'ersp','on','itc','on', 'specparams',{'specmode','fft','logtrials','off'});
eeglab redraw

% 1st level Analysis
STUDY = pop_limo(STUDY, ALLEEG, 'method','IRLS','measure','daterp','timelim',[-50 650],'erase','on','splitreg','off','interaction','off');
eeglab redraw

%% bootstrap subjects (under the null) to check type 1 error rates
% this takes a very long time 

for s=1:size(STUDY.datasetinfo,2)
    fprintf('running bootstrap on subject %g\n',s)
    LIMO = load(fullfile(STUDY.datasetinfo(s).filepath,['FaceRepetition_GLM_Channels_Time_IRLS' filesep 'LIMO.mat']));
    LIMO = LIMO.LIMO; LIMO.design.bootstrap = 2500; LIMO.design.status = 'to do';
    save(fullfile(LIMO.dir,'LIMO.mat'),'LIMO'); try rmdir([LIMO.dir filesep 'H0'],'s'); end
    H0iw{s} = fullfile(STUDY.datasetinfo(s).filepath,['FaceRepetition_GLM_Channels_Time_IRLS' filesep 'H0']);
    limo_eeg(4,LIMO)
end

% use 1500 for the null and 1000 for testing
[results.errIRLS,results.ci_errIRLS,results.maxIRLS,results.maxci_errIRLS,results.clusterIRLS,results.maxcic_errIRLS] = limo_test_glmboot(chanlocs,H0iw,'step_size',300,'Nboot',1000,'MinSamp',300);
save results results




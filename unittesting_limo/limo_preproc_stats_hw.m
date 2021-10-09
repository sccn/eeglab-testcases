% BIDS Tools / EEGLAB / LIMO EEG 
% data analysis of Wakeman and Henson 2015 data
% tests the full preprocessing pipeline            - bids_import
%                                                  - pop_clean_raw for bad channels
%                                                  - datapop_reref
%                                                  - pop_runica/pop_iclabel/pop_icflag/pop_subcomp
%                                                  - pop_clean_rawdata for bad epochs
%                                                  - pop_epoch
%                                                  - std_precomp
% computes LIMO 1st level GLM with 2nd level ANOVA - std_makedesign/pop_limo/limo_random_select
% test all basic stats & plotting options          - limo_get_files/limo_batch (contrasts only)
%                                                  - limo_central_tendency_and_ci
%                                                  - limo_add_plots
%                                                  - limo_plot_difference
%                                                  - limo_eeg(5,LIMO) = printing results
%                                        
% for full testing of LIMO stats see limo_test_integration.m
% eeglab; plugin_askinstall('bids-matlab-tools', 'pop_importbids', true)

%% Import
% start EEGLAB
clear
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
pop_editoptions( 'option_storedisk', 1);
 
% call BIDS tool BIDS
filepath        = fileparts(which('participants.tsv'));
[STUDY, ALLEEG] = pop_importbids(filepath, 'bidsevent','on','bidschanloc','on', 'studyName','Face_detection','outputdir', fullfile(filepath, 'derivatives2'), 'eventtype', 'trial_type');
ALLEEG = pop_select( ALLEEG, 'nochannel',{'EEG061','EEG062','EEG063','EEG064'});
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];

%% Preprocessing
% Remove bad channels
EEG = pop_clean_rawdata( EEG,'FlatlineCriterion',5,'ChannelCriterion',0.8,...
    'LineNoiseCriterion',2.5,'Highpass',[0.25 0.75] ,...
    'BurstCriterion','off','WindowCriterion','off','BurstRejection','off',...
    'Distance','Euclidian','WindowCriterionTolerances','off');;

% Rereference using average reference
EEG = pop_reref( EEG,[],'interpchan',[]);
 
% Run ICA and flag artifactual components using IClabel
EEG = pop_runica(EEG, 'icatype','runica','concatcond','on','options',{'pca',-1});
EEG = pop_iclabel(EEG,'default');
EEG = pop_icflag(EEG,[NaN NaN;0.8 1;0.8 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
EEG = pop_subcomp(EEG, [], 0); % remove pre-flagged bad components
 
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
 
% update study & compute single trials
STUDY  = std_checkset(STUDY, ALLEEG);
[STUDY, EEG] = std_precomp(STUDY, EEG, {}, 'savetrials','on','interp','on','recompute','on',...
    'erp','on','erpparams', {'rmbase' [-200 0]}, 'spec','off', 'ersp','off','itc','off');
eeglab redraw

%% Statitiscal analysis (same as limo_integration_test except full 1000 boostraps and no tfce)

% two-way ANOVA faces * repetition
% -------------------------------
mode = 'WLS';
% 1st level analysis
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'name','FaceRepetition','delfiles','off','defaultdesign','off',...
    'variable1','type','values1',{'famous_new','famous_second_early','famous_second_late','scrambled_new',...
    'scrambled_second_early','scrambled_second_late','unfamiliar_new','unfamiliar_second_early','unfamiliar_second_late'},...
    'vartype1','categorical','subjselect',{'sub-002','sub-003','sub-004','sub-005','sub-006','sub-007','sub-008',...
    'sub-009','sub-010','sub-011','sub-012','sub-013','sub-014','sub-015','sub-016','sub-017','sub-018','sub-019'});
[STUDY, EEG] = pop_savestudy( STUDY, EEG, 'savemode','resave');
STUDY  = pop_limo(STUDY, ALLEEG, 'method',mode,'measure','daterp','timelim',[-50 650],'erase','on','splitreg','off','interaction','off');

% 2nd level analysis
mkdir([STUDY.filepath filesep '2-ways-ANOVA'])
cd([STUDY.filepath filesep '2-ways-ANOVA'])
chanlocs = [STUDY.filepath filesep 'limo_gp_level_chanlocs.mat'];
limo_random_select('Repeated Measures ANOVA',chanlocs,'LIMOfiles',...
    {[STUDY.filepath filesep 'LIMO_Face_detection' filesep  'Beta_files_FaceRepetition_GLM_Channels_Time_' mode '.txt']},...
    'analysis_type','Full scalp analysis','parameters',{[1 2 3],[4 5 6],[7 8 9]},...
    'factor names',{'face','repetition'},'type','Channels','nboot',1000,'tfce',0,'skip design check','yes');

%% test computing, plotting, printing results

mkdir('ERPs'); cd('ERPs');
% compute unweigted ERPs
Files = [STUDY.filepath filesep 'LIMO_' STUDY.filename(1:end-6) filesep ...
    'LIMO_files_FaceRepetition_GLM_Channels_Time_' mode '.txt'];
parameters = [1 2 3];
savename1  = [pwd filesep 'famous_faces'];
limo_central_tendency_and_ci(Files, parameters, chanlocs, 'Mean', 'Mean', [],savename1)
parameters = [4 5 6];
savename2  = [pwd filesep 'srambled_faces'];
limo_central_tendency_and_ci(Files, parameters, chanlocs, 'Mean', 'Mean', [],savename2)
parameters = [7 8 9];
savename3  = [pwd filesep 'unfamiliar_faces'];
limo_central_tendency_and_ci(Files, parameters, chanlocs, 'Mean', 'Mean', [],savename3)
limo_add_plots({[savename1 '_Mean_of_mean.mat'],[savename2 '_Mean_of_mean.mat'],[savename3 '_Mean_of_mean.mat']},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50); title('Mean Face types at channel 50')

% compute weighted ERPs
parameters = [1 2 3];
savename1  = [pwd filesep 'famous_faces'];
limo_central_tendency_and_ci(Files, parameters, chanlocs, 'Weighted mean', 'Mean', [],savename1)
parameters = [4 5 6];
savename2  = [pwd filesep 'srambled_faces'];
limo_central_tendency_and_ci(Files, parameters, chanlocs, 'Weighted mean', 'Mean', [],savename2)
parameters = [7 8 9];
savename3  = [pwd filesep 'unfamiliar_faces'];
limo_central_tendency_and_ci(Files, parameters, chanlocs, 'Weighted mean', 'Mean', [],savename3)
limo_add_plots({[savename1 '_Mean_of_Weighted mean.mat'],[savename2 '_Mean_of_Weighted mean.mat'],[savename3 '_Mean_of_Weighted mean.mat']},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50); title('Weighted mean Face types at channel 50')

% plot these results again and also subject wise
figure
subplot(1,3,1); 
limo_add_plots({[savename1 '_Mean_of_mean.mat'],[savename1 '_Mean_of_Weighted mean.mat']},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50,'figure','hold'); 
title('mean and weighed mean Famous Faces','Fontsize',12)
subplot(1,3,2); 
limo_add_plots({[savename2 '_Mean_of_mean.mat'],[savename2 '_Mean_of_Weighted mean.mat']},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50,'figure','hold'); 
title('mean and weighed mean srambled Faces','Fontsize',12)
subplot(1,3,3); 
limo_add_plots({[savename3 '_Mean_of_mean.mat'],[savename3 '_Mean_of_Weighted mean.mat']},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50,'figure','hold'); 
title('mean and weighed mean unfamiliar Faces','Fontsize',12)

figure
for subject = 1:18
    subplot(3,6,subject);
    limo_add_plots({[savename1 '_single_subjects_Mean.mat'],[savename1 '_single_subjects_Weighted mean.mat'],...
        [savename2 '_single_subjects_Mean.mat'],[savename2 '_single_subjects_Weighted mean.mat'],...
        [savename3 '_single_subjects_Mean.mat'],[savename3 '_single_subjects_Weighted mean.mat']},...
        [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'variable',subject,'channel',50,'figure','hold');
    title(['subject: ' num2str(subject)],'Fontsize',12)
end

% compute mean Betas via contrast
cd ..
[~,~,Files] = limo_get_files([],[],[],[STUDY.filepath filesep 'LIMO_' STUDY.filename(1:end-6) filesep ...
    'LIMO_files_FaceRepetition_GLM_Channels_Time_' mode '.txt']);
contrast.LIMO_files = Files;
contrast.mat = [1 1 1 0 0 0 0 0 0 0; 0 0 0 1 1 1 0 0 0 0;0 0 0 0 0 0 1 1 1 0]; % average repetition levels
limo_batch('contrast only',[],contrast);

mkdir('famous_faces'); cd('famous_faces')
limo_random_select('one sample t-test',chanlocs,'LIMOfiles',...
    {[STUDY.filepath filesep 'LIMO_' STUDY.filename(1:end-6) filesep 'con_1_files_FaceRepetition_GLM_Channels_Time_' mode '.txt']},...
    'analysis_type','Full scalp analysis','type','Channels','nboot',0,'tfce',0); 
savename1 =  [pwd filesep 'famous_faces']; limo_central_tendency_and_ci([pwd filesep 'Yr.mat'], 'Mean', 50,savename1); cd ..

mkdir('scrambled_faces'); cd('scrambled_faces')
limo_random_select('one sample t-test',chanlocs,'LIMOfiles',...
    {[STUDY.filepath filesep 'LIMO_' STUDY.filename(1:end-6) filesep 'con_2_files_FaceRepetition_GLM_Channels_Time_' mode '.txt']},...
    'analysis_type','Full scalp analysis','type','Channels','nboot',0,'tfce',0); 
savename2 =  [pwd filesep 'scrambled_faces']; limo_central_tendency_and_ci([pwd filesep 'Yr.mat'], 'Mean', 50,savename2); cd ..

mkdir('unfamiliar_faces'); cd('unfamiliar_faces')
limo_random_select('one sample t-test',chanlocs,'LIMOfiles',...
    {[STUDY.filepath filesep 'LIMO_' STUDY.filename(1:end-6) filesep 'con_3_files_FaceRepetition_GLM_Channels_Time_' mode '.txt']},...
    'analysis_type','Full scalp analysis','type','Channels','nboot',0,'tfce',0); 
savename3 =  [pwd filesep 'unfamiliar_faces']; limo_central_tendency_and_ci([pwd filesep 'Yr.mat'], 'Mean', 50,savename3); cd ..

limo_add_plots({[savename1 '_Mean.mat'],[savename2 '_Mean.mat'],[savename3 '_Mean.mat']},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50); title('Means at channel 50')

% compute the difference faces vs scrambled from the betas
limo_plot_difference(fullfile(pwd,['famous_faces' filesep 'Yr.mat']),...
    fullfile(pwd,['scrambled_faces' filesep 'Yr.mat']), 'LIMO',fullfile(pwd,'LIMO.mat'),...
    'type','paired','percent', 20, 'alpha', 0.05, 'fig', 'on', 'name',fullfile(pwd,'diff_to_famous'));
limo_plot_difference(fullfile(pwd,['unfamiliar_faces' filesep 'Yr.mat']),...
    fullfile(pwd,['scrambled_faces' filesep 'Yr.mat']), 'LIMO',fullfile(pwd,'LIMO.mat'),...
    'type','paired','percent', 20, 'alpha', 0.05, 'fig', 'on', 'name',fullfile(pwd,'diff_to_unfamiliar'));

% re-plot this together
limo_add_plots({fullfile(pwd,'diff_to_famous'),fullfile(pwd,'diff_to_unfamiliar')},...
    [STUDY.filepath filesep '2-ways-ANOVA' filesep 'LIMO.mat'],'channel',50); title('Mean differences at channel 50')

% print main results
limo_eeg(5,fullfile(pwd,'LIMO.mat'))


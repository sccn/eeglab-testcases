% test_pop_chancenter.m
% 2010/03/23 roy
% case1...case10

function test_pop_chancenter
readcontsamplefile;
eeglab_p = fileparts(which('eeglab.m'));
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
EEG.chanlocs=pop_chanedit(EEG.chanlocs, 'load',{ fileloc, 'filetype',''}, 'shrink',-0.1);

% % case1: pop window
% chanlocs = pop_chancenter(EEG.chanlocs);
% close;

%case2: without input 'omitchan', 'center' = [] 
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, []);

% case3: without input 'omitchan', 'center' = [0 0 0]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [0 0 0]);

% case4: without input 'omitchan', 'center' = [1 1 1]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [1 1 1]);

% case5: without input 'omitchan', 'center' = [-1 0 1]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [-1 0 1]);

% case6: without input 'omitchan', 'center' = [100000 -1000000 100]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [100000 -1000000 100]);

% case7: 'center' = [1 1 1], 'omitchan' = [1]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [1 1 1], [1]);

% case8: 'center' = [1 1 1], 'omitchan' = [1:EEG.nbchan]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [1 1 1], [1:EEG.nbchan]);

% case9: 'center' = [1 1 1], 'omitchan' = [1]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [1 1 1], [0]);

% case10: 'center' = [1 1 1], 'omitchan' = [1:EEG.nbchan+1]
[chanlocs centerloc] = pop_chancenter(EEG.chanlocs, [1 1 1], [1:EEG.nbchan+1]);
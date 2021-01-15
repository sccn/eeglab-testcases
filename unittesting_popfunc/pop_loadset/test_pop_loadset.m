% test_pop_loadset
% 04/15/2010 roy
% case 1..3 passed!
% case 4 failed -- Bug 835 reported
% bug 835 fixed

function test_pop_loadset
eeglab_p = fileparts(which('eeglab.m'));
filepath = fullfile(eeglab_p, 'sample_data');
%% case 1
EEG = pop_loadset('filename','eeglab_data_epochs_ica.set','filepath', filepath );
%% case 2
EEG = pop_loadset('filename','eeglab_data_epochs_ica.set','filepath', filepath , 'loadmode', 'info');
%% case 3
EEG = pop_loadset('filename','eeglab_data_epochs_ica.set','filepath', filepath , 'loadmode', 10);
%% case 4
readepochsamplefile;
EEG = pop_loadset('filename','', 'filepath','', 'eeg', EEG);


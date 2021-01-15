% test_pop_fileio
% 04/02/2010 roy
% case1...3
% ?? optional inputs do not work?
% ? need some other file format!

% Where is readheader()?

function test_pop_fileio
eeglab_p = fileparts(which('eeglab.m'));
filename = fullfile(eeglab_p, 'sample_data', 'eeglab_data_epochs_ica.set');
OUTEEG = pop_fileio(filename);
OUTEEG = pop_fileio(filename, 'channels', [1:32], 'samples', [1 384]);
OUTEEG = pop_fileio(filename, 'channels', [1:16], 'trials', [2 50]);
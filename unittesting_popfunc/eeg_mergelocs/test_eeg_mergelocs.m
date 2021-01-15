% test_eeg_mergelocs
% 05/14/2010 roy
% case 1 2 3 pass

function test_eeg_mergelocs
eeglab_p = fileparts(which('eeglab.m'));

fileloc33 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');

%% case 1
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
locs = pop_readlocs(fileloc);
mergeloscs = eeg_mergelocs(locs(1),locs(2));

%% case 2
fileloc = fullfile(eeglab_p, 'sample_locs', 'GSN64v2_0.sfp');
locs = pop_readlocs(fileloc);
mergeloscs = eeg_mergelocs(locs(1:10),locs(5:15));

%% case 3
fileloc33 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
fileloc25 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-20-Cap25.locs');
locs1 = pop_readlocs(fileloc33);
locs2 = pop_readlocs(fileloc25, 'filetype', 'loc');
mergeloscs = eeg_mergelocs(locs1,locs2);
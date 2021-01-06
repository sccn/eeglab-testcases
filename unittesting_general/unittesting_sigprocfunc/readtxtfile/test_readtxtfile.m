% test_readtxtfile
% 05/20/2010 roy

function test_readtxtfile
eeglab_p = fileparts(which('eeglab.m'));
fileloc33 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.ced');
fileloc25 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-20-Cap25.locs');
fileloc32 = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');

str = readtxtfile(fileloc33);

str = readtxtfile(fileloc25);

str = readtxtfile(fileloc32);

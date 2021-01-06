% test_pop_readlocs
% 04/28/2010 roy
% case 1...4 pass
% ? more cases about optional inputs --- see test_readlocs()

function test_pop_readlocs
tmpp = fileparts(which('eeglab.m'));
locs = pop_readlocs(fullfile(tmpp, 'sample_data','eeglab_chan32.locs'));
locs = pop_readlocs(fullfile(tmpp, 'sample_locs','GSN64v2_0.sfp'));
locs = pop_readlocs(fullfile(tmpp, 'sample_locs','Standard-10-10-Cap33.ced'));
locs = pop_readlocs(fullfile(tmpp, 'sample_locs','Standard-10-20-Cap25.locs'));

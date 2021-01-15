% test_pop_writelocs
% 04/30/2010 roy
% ? more test cases for optional inputs --- see test_wirtelocs

function test_pop_writelocs

readepochsamplefile;
EEG;
pop_writelocs(EEG.chanlocs, 'testwirtelocs.locs');
delete testwirtelocs.locs;
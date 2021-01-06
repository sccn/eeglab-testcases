% test_pop_snapread
% 04/08/2010
% case1..3 pass!

function test_pop_snapread()
EEG = pop_snapread(fullfile(binarytestlocation, 'SMA/TEST.SMA'));
EEG = pop_snapread(fullfile(binarytestlocation, 'SMA/TEST.SMA'), 400);
EEG = pop_snapread(fullfile(binarytestlocation, 'SMA/TEST.SMA'), 1);
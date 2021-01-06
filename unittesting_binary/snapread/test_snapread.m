% test_snapread
% 05/24/2010

function test_snapread()
EEG = snapread(fullfile(binarytestlocation, 'SMA/TEST.SMA'));
EEG = snapread(fullfile(binarytestlocation, 'SMA/TEST.SMA'), 400);
EEG = snapread(fullfile(binarytestlocation, 'SMA/TEST.SMA'), 1);
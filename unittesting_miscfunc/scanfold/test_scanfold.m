% test_scanfold
% 05/19/2010 roy
% ?? cannot get the all the functions in eeglab
% bug fixed

function test_scanfold
eeglab_p = fileparts(which('eeglab.m'));
[cellres textres] = scanfold(eeglab_p);

[cellres textres] = scanfold(eeglab_p, {'plugins'}, 100);

[cellres textres] = scanfold(eeglab_p, {'plugins'}, 1);
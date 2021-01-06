% test_pop_runica
% 04/30/2010 roy
% ? need more completed test cases for optinal inputsfunction
% test_runicalowmem - See the test cases for runica() in test_suite

function test_pop_runica
readcontsamplefile;
EEGOUT = pop_runica(EEG,'icatype','runica', 'extended',1, 'pca', 4);

%EEGOUT = pop_runica(EEG,'icatype','binica', 'pca', 4);
%delete binica*;
%delete bias_*;

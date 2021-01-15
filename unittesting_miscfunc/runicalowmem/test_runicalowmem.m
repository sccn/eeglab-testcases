% test_runicalowmem
% 05/19/2010 roy
% case 1 2 pass
% ? need more completed test cases for optinal inputsfunction
% test_runicalowmem - See the test cases for runica() in test_suite
function test_runicalowmem()
readcontsamplefile;
[weights,sphere] = runicalowmem(EEG.data, 'extended',1);
[weights,sphere] = runicalowmem(EEG.data);
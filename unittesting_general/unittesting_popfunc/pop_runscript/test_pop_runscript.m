% test_pop_runscript
% 04/30/2010 roy
% case 1 3 pass
% ?? case 2, not base envirenmemnt? 

function test_pop_runscript
filename = which('readcontsamplefile.m');
pop_runscript(filename);
close;
clear global;
% pop_runscript('test_pop_chansel.m');
pop_runscript('notexist.mm');

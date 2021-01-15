% test_pop_rejmenu
% 05/17/2010 roy
% pass

function test_pop_rejmenu
readepochsamplefile;
pop_rejmenu(EEG,0);
close;

pop_rejmenu(EEG,1);
close;
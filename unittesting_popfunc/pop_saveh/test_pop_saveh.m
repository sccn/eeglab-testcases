function test_pop_saveh

ALLCOM = {'command 1;'; 'command 2;'; 'command 3;'; 'command 4;'};
pop_saveh(ALLCOM, 'eeglabhist.m', pwd);
delete eeglabhist.m


readepochsamplefile;
pop_saveh(EEG.history, 'eeglabhist.m', pwd);
delete eeglabhist.m
function test_pop_select;

readepochsamplefile;

EEG = pop_select( EEG, 'time',[0.5 1] , 'notrial',[2:4] , 'nochannel',31);
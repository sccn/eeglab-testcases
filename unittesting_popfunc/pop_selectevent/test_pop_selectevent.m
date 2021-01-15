function test_pop_selectevent;

readepochsamplefile;

EEG = pop_selectevent( EEG,  'position',1, 'deleteevents', 'off', 'deleteepochs', 'on');
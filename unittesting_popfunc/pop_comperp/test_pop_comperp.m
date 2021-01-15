function test_pop_comperp;

readepochsamplefile;
EEG1 = pop_selectevent( EEG,  'position',1, 'deleteevents', 'off', 'deleteepochs', 'on');

readepochsamplefile;
EEG2 = pop_selectevent( EEG,  'position',2, 'deleteevents', 'off', 'deleteepochs', 'on');

pop_comperp( [EEG1 EEG2], 1, [1:2] ,[], 'alpha',0.05, 'std', 'on', 'allerps', 'on'); close;
pop_comperp( [EEG1 EEG2], 0, [1:2] ,[], 'alpha',0.05, 'std', 'on', 'allerps', 'on'); close;
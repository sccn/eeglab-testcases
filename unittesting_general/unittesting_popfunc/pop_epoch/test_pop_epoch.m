function test_pop_epoch;

readcontsamplefile;
EEG = pop_epoch( EEG, {  'square'  }, [-1  2], 'newname', 'ee114 continuous (h.p. 1Hz) epochs', 'epochinfo', 'yes');

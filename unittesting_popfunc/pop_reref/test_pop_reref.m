function test_pop_reref;

readcontsamplefile;
EEG = pop_reref( EEG, []);

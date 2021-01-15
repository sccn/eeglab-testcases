function test_pop_eegfilt;

readcontsamplefile;

EEG = pop_eegfilt( EEG, 1, 0, [], [0]);
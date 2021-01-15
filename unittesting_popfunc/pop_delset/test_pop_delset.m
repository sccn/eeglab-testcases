function test_pop_delset;

readcontsamplefile;
[ALLEEG EEG CURRENTSET] = eeg_store([], EEG);

ALLEEG = pop_delset( ALLEEG, [1] );

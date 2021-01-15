function test_pop_eegplot;

readcontsamplefile;
pop_eegplot( EEG, 1, 0, 0); close;

readepochsamplefile;
pop_eegplot( EEG, 0, 0, 0); close;

function test_pop_subcomp;

readepochsamplefile;
EEG = pop_subcomp( EEG, [3], 0);

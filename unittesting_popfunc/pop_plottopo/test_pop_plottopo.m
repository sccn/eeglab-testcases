function test_pop_plottopo;

readepochsamplefile;
figure; pop_plottopo(EEG, [1:32], 'ee114 continuous (h.p. 1Hz) epochs', 0); close;

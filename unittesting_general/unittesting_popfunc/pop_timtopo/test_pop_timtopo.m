function test_pop_timtopo;

readepochsamplefile;
figure; pop_timtopo(EEG, [-999.9316      1992.0513], [NaN], 'ERP data and scalp maps of ee114 continuous (h.p. 1Hz) epochs');
close;

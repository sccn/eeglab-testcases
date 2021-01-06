function test_pop_read_erpss;

EEG = pop_read_erpss(fullfile(binarytestlocation,'ERPSS/ERPSSTESTCOMP.RAW'), 500.000000);
EEG = pop_read_erpss(fullfile(binarytestlocation,'ERPSS/ERPSSCOMPRESSED.RAW'), 500.000000);

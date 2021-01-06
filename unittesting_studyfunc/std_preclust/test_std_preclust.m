function test_std_preclust;

readsamplestudy;
[STUDY ALLEEG] = std_preclust(STUDY, ALLEEG, 1,{'spec' 'npca' 10 'norm' 1 'weight' 1 'freqrange' [3 25] },{'erp' 'npca' 10 'norm' 1 'weight' 1 'timewindow' []},{'scalp' 'npca' 10 'norm' 1 'weight' 1 'abso' 1},{'dipoles' 'norm' 1 'weight' 10},{'ersp' 'npca' 10 'freqrange' [] 'timewindow' [] 'norm' 1 'weight' 1},{'itc' 'npca' 10 'freqrange' [] 'timewindow' [] 'norm' 1 'weight' 1},{'finaldim' 'npca' 10});

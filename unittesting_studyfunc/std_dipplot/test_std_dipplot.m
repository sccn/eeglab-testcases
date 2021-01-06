function test_std_dipplot

readsamplestudy;
std_dipplot(STUDY, ALLEEG, 'clusters', 'all', 'mode', 'joined'); close;
std_dipplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'centroid'); close;
return
std_dipplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'comps'); close;
std_dipplot(STUDY, ALLEEG, 'clusters', 3, 'comps', 4); close;
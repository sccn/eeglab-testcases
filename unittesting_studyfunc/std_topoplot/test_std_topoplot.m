function test_std_topoplot;

readsamplestudy;
std_topoplot(STUDY, ALLEEG, 'clusters', 'all', 'mode', 'centroid'); close;
std_topoplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'centroid'); close;
std_topoplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'comps'); close;
std_topoplot(STUDY, ALLEEG, 'clusters', 3, 'comps', 4); close;

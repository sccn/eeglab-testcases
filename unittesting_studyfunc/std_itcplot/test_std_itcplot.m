function test_std_itcplot;

readsamplestudy;
[STUDY] = std_selectdesign(STUDY, ALLEEG, 1);
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'recompute','on', 'interp', 'on', 'itc','on', 'erspparams', {'cycles' [3 0.8]  'nfreqs' 10 'ntimesout' 10 'baseline' NaN 'verbose' 'off' });
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'recompute','on', 'interp', 'on', 'itc','on', 'erspparams', {'cycles' [3 0.8]  'nfreqs' 10 'ntimesout' 10 'baseline' NaN  'verbose' 'off' });
std_itcplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'centroid'); close;
std_itcplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'comps'); close;
std_itcplot(STUDY, ALLEEG, 'clusters', 3, 'comps', 4); close;
std_itcplot(STUDY, ALLEEG, 'channels', { 'Cz' }); close;
std_itcplot(STUDY, ALLEEG, 'channels', { 'Cz' }, 'plotsubjects', 'on'); close;
std_itcplot(STUDY, ALLEEG, 'channels', { 'Cz' }, 'subject', 'S02' ); close;

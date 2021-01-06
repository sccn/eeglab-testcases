function test_std_specplot(closefig);

if nargin < 1
    closefig = 1;
end;

readsamplestudy;
chan = { ALLEEG(1).chanlocs(16).labels };
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'savetrials','on','recompute','on', 'interp', 'on', 'spec','on', 'specparams', {'specmode', 'fft' });
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'savetrials','on','recompute','on', 'spec','on',  'specparams', {'specmode', 'fft'});
std_specplot(STUDY, ALLEEG, 'clusters',[2   3   4   5]); if closefig, close; end;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'centroid'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'mode', 'comps'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'comps', 1); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'condstats', 'on'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'condstats', 'on', 'plotconditions', 'together'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'condstats', 'on', 'plotconditions', 'together', 'threshold', 0.05); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'clusters', 3, 'condstats', 'on', 'plotconditions', 'together', 'threshold', 0.05, 'mcorrect', 'fdr'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'channels', chan); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'channels', chan, 'plotsubjects', 'on'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'channels', chan, 'subject', STUDY.subject{1}, 'plotconditions', 'together' ); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'channels', chan, 'condstats', 'on'); if closefig, close; end;;
tmpchanlocs = ALLEEG(1).chanlocs;
STUDY = std_specplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }); if closefig, close; end;;
STUDY = std_specplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }, 'plotconditions', 'together', 'condstats', 'on'); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }, 'topofreq', 5); if closefig, close; end;;
std_specplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }, 'condstats', 'on', 'topofreq', 5); if closefig, close; end;;

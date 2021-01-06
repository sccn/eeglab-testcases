function test_std_erspplot(closefig);

if nargin < 1
    closefig = 1;
end;
readsamplestudy;

tmpchanlocs = ALLEEG(1).chanlocs;
chan = { tmpchanlocs(16).labels };
chans = { tmpchanlocs(1:4).labels };
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'savetrials','on','recompute','on', 'interp', 'on', 'ersp','on', 'itc','on', 'erspparams', {'ntimesout', 12, 'nfreqs', 10  'verbose' 'off'});
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'savetrials','on','recompute','on', 'interp', 'on', 'ersp','on', 'itc','on', 'erspparams', {'ntimesout', 12, 'nfreqs', 10  'verbose' 'off'});
STUDY = std_erspplot(STUDY,ALLEEG,'clusters',[2   3   4]); if closefig, close; end;
STUDY = std_erspplot(STUDY,ALLEEG,'channels',chans); if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'clusters', 2, 'mode', 'centroid'); if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'clusters', 2, 'mode', 'comps');  if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'clusters', 2, 'comps', 1); if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'channels', chan);  if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'channels', chan, 'subject', STUDY.subject{1} );  if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'channels', chan, 'plotsubjects', 'on'); if closefig, close; end;

STUDY = std_erspplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }, 'topofreq', 5, 'topotime', 100);  if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }, 'condstats', 'on', 'topofreq', 5, 'topotime', 100);  if closefig, close; end;
std_erspplot(STUDY, ALLEEG, 'channels', { tmpchanlocs.labels }, 'subject', STUDY.subject{1}, 'topofreq', 5, 'topotime', 100, 'caxis', [-3 3]);  if closefig, close; end;

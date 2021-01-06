function test_std_precomp;

readsamplestudy
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components','recompute','on','erp','on','scalp','on','spec','on', ...
         'specparams',{'specmode' 'fft'},'ersp','on','erspparams',{'verbose' 'off' 'cycles' [3 0.8]  'nfreqs' 2 'timesout' 30},'itc','on');
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels','recompute','on','erp','on','spec','on', ...
    'specparams',{'specmode' 'fft'},'ersp','on','erspparams',{'cycles' [3 0.8] 'verbose' 'off' 'nfreqs' 2 'timesout' 30},'itc','on');

readsamplestudy
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'variable1','condition','variable2','','name','STUDY.design 1','values1',{'non-synonyms' 'synonyms'},'subjselect',{'S02' 'S07' 'S08' 'S10'});
STUDY = std_makedesign(STUDY, ALLEEG, 2, 'variable1','condition','variable2','','name','Design 2 test','values1',{'non-synonyms' {'non-synonyms','synonyms'}},'subjselect',{'S02'});
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];
STUDY.currentdesign = 2;
STUDY = std_selectdesign(STUDY, ALLEEG, 2);

[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components','recompute','on','erp','on','scalp','on','spec','on', ...
         'specparams',{'specmode' 'fft'},'ersp','on','erspparams',{'cycles' [3 0.8]  'nfreqs' 2 'timesout' 30},'itc','on');
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels','recompute','on','erp','on','spec','on', ...
    'specparams',{'specmode' 'fft'},'ersp','on','erspparams',{'cycles' [3 0.8]  'nfreqs' 2 'timesout' 30},'itc','on');


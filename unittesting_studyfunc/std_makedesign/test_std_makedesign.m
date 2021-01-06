function test_std_makedesign;

readsamplestudy
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'variable1','condition','variable2','','name','STUDY.design 1','values1',{'non-synonyms','synonyms'},'subjselect',{'S02' 'S07' 'S08' 'S10'});
STUDY = std_makedesign(STUDY, ALLEEG, 2, 'variable1','condition','variable2','','name','Design 2 test','values1',{'non-synonyms' {'non-synonyms','synonyms'}},'subjselect',{'S02' 'S07' 'S08' 'S10'});
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];

if isfield(STUDY.design, 'cell') && (length(STUDY.design(1).cell) ~= 8 || length(STUDY.design(2).cell) ~= 8)
    error('Wrong number of cell in design');
end;


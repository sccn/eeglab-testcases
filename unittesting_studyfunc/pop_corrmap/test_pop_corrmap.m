function test_pop_corrmap;

tmpvers = eeg_getversion;
if str2num(tmpvers(1:2)) > 9
    readsamplestudy;
    pop_corrmap(STUDY,ALLEEG,1, 1,'chanlocs','','th','auto','ics',1,'title','Cluster test2','clname','test2','badcomps','no', 'resetclusters','off');
end;

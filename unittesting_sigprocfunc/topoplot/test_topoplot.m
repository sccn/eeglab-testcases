function test_topoplot;

readepochsamplefile;
[hfig grid plotrad Xi Yi] = topoplot( EEG.icawinv(:,1), EEG.chanlocs(EEG.icachansind), 'verbose', 'off', 'electrodes', 'on' ,'style','both','plotrad',0.55,'intrad',0.55,'noplot', 'on', 'chaninfo', EEG.chaninfo);

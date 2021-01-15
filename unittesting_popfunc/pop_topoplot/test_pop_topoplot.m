function test_pop_topoplot;

readepochsamplefile;

pop_topoplot(EEG,1, [0:100:500] , 'ee114 continuous (h.p. 1Hz) epochs ERP',[2:3]  ,'electrodes', 'off'); close;
figure; topoplot([],EEG.chanlocs, 'style', 'blank', 'electrodes', 'labelpoint'); close;
pop_topoplot(EEG,0, [1:12] , 'Continuous EEG Data epochs ERP',[3:4]  ,'electrodes', 'off'); close;


% Testing only on version >= 15

[eegvers, vnum] = eeg_getversion;
if strcmp(eegvers, 'development head') || vnum > 15
    EEGtmp = EEG;
    EEGtmp.chanmatrix = [11 12 0 1; 13 14 15 -2];
    pop_topoplot(EEGtmp, 1, [100 200 300 400] ,'EEG Data epochs',[2 2] ,0); close
    
    EEGtmp = EEG;
    EEGtmp.chanlocs = [];
    EEGtmp.chanmatrix = [11 12 0 1; 13 14 15 -2];
    pop_topoplot(EEGtmp,1, [0:100:500] , 'ee114 continuous (h.p. 1Hz) epochs ERP',[2:3]  ,'electrodes', 'off'); close;
    
    EEGtmp = EEG;
    EEGtmp.chanlocs = [];
    EEGtmp.chanmatrix = [];
    pop_topoplot(EEGtmp,1, [0:100:500] , 'ee114 continuous (h.p. 1Hz) epochs ERP',[2:3]  ,'electrodes', 'off'); close;
end


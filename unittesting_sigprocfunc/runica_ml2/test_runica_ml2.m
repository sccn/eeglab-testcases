function test_runica_ml2
readcontsamplefile;
EEG.pnts = 10000;
EEG.data = EEG.data(:,1:EEG.pnts);
EEG = eeg_checkset(EEG);
[weights,sphere] = runica(EEG.data);
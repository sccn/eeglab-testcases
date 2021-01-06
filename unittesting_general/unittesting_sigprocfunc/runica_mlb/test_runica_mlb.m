function test_runica_mlb
readcontsamplefile;
EEG.pnts = 10000;
EEG.data = EEG.data(:,1:EEG.pnts);
EEG = eeg_checkset(EEG);
[weights,sphere] = runica_mlb(EEG.data);
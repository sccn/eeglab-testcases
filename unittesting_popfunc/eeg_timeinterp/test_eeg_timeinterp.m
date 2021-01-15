function test_eeg_timeinterp
readcontsamplefile;
EEG.data(1,100:1000) = zeros(1,901);
EEGOUT = eeg_timeinterp(EEG, [100:1000]);
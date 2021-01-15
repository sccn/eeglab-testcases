% test_eeg_getica
% 05/14/2010 roy
% case 1 2 3 pass

function test_eeg_getica

readepochsamplefile;
mergelocs = eeg_getica(EEG);
mergelocs = eeg_getica(EEG, 1);
mergelocs = eeg_getica(EEG, [5 26]);

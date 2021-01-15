% test_eeg_decodechan
% 05/04/2010 roy
% case 1 2 pass

function test_eeg_decodechan
readepochsamplefile;

[inds labels] = eeg_decodechan(EEG.chanlocs, { 'cz' 'pz' 'fz' });

[inds labels] = eeg_decodechan(EEG.chanlocs, 'cz pz fz' );
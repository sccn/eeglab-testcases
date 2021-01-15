% test_pop_resample
% 04/28/2010 roy
% case 1...4 pass

function test_pop_resample
readepochsamplefile;
EEGOUT = pop_resample(EEG, 10);
EEGOUT = pop_resample(EEG, 1000);

readcontsamplefile;
EEGOUT = pop_resample(EEG, 10);
EEGOUT = pop_resample(EEG, 1000);

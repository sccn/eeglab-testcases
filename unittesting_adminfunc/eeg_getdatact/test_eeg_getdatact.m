% test_eeg_getdatact
% 05/17/2010 roy
% case 1...8 pass
% case 9 failed
% ?? the relationship between 'channel', 'component' and 'rmcomps'?
% ?? verbose mode?

function test_eeg_getdatact

readcontsamplefile;

signal = eeg_getdatact(EEG);

signal = eeg_getdatact(EEG, 'channel', [1 10 32], 'trialindices', 1, 'verbose', 'on');

signal = eeg_getdatact(EEG, 'channel', [1 10 32], 'trialindices', 1, 'verbose', 'off');


readepochsamplefile;

signal = eeg_getdatact(EEG);

signal = eeg_getdatact(EEG, 'channel', [1 10 32], 'trialindices', 1, 'verbose', 'on');

signal = eeg_getdatact(EEG, 'channel', [1 10 32], 'trialindices', [1:30], 'verbose', 'on');

signal = eeg_getdatact(EEG, 'component', [5 8 20], 'trialindices', 1, 'verbose', 'on');

signal = eeg_getdatact(EEG, 'rmcomps', [1:20], 'trialindices', 1, 'verbose', 'on');

% signal = eeg_getdatact(EEG, 'component', [1:10], 'rmcomps', [5], 'verbose', 'on');
% can not use 'component' and 'rmcomp' at the same time.
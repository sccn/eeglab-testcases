% test_eeg_checkchanlocs

function test_eeg_checkchanlocs

readcontsamplefile;

signal = eeg_checkchanlocs(EEG);

EEG.chanlocs(end+1).labels = 'test';
EEG.chanlocs(end+1).labels = 'test';

signal = eeg_checkchanlocs(EEG);

readepochsamplefile;

signal = eeg_checkchanlocs(EEG);

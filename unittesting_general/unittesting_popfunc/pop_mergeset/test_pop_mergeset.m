% test_pop_mergeset
% 04/10/2010 roy
% case 1...4 passed

function test_pop_mergeset
readcontsamplefile;
ALLEEG(1) = EEG;
ALLEEG(2) = EEG;
ALLEEG(3) = EEG;

ALLEEG = eeg_checkset(ALLEEG, 'loaddata');
EEGOUT = pop_mergeset(ALLEEG, [1 2], 0);
EEGOUT = pop_mergeset(ALLEEG, [1 2], 1);
EEGOUT = pop_mergeset(ALLEEG(1), ALLEEG(2), 0);
EEGOUT = pop_mergeset(ALLEEG, [1:3], 0);

readepochsamplefile;
ALLEEG(1) = EEG;
ALLEEG(2) = EEG;
ALLEEG(3) = EEG;

ALLEEG = eeg_checkset(ALLEEG, 'loaddata');
EEGOUT = pop_mergeset(ALLEEG, [1 2], 0);
EEGOUT = pop_mergeset(ALLEEG, [1 2], 1);
EEGOUT = pop_mergeset(ALLEEG(1), ALLEEG(2), 0);
EEGOUT = pop_mergeset(ALLEEG, [1:3], 0);


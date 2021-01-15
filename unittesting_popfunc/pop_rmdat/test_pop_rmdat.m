% test_pop_rmdat
% 04/30/2010 roy
% case 1...5 pass (a bug in line 130 is fixed)

function test_pop_rmdat
readcontsamplefile;
EEGOUT = pop_rmdat(EEG, {'rt'}, [-1, 2], 0);
EEGOUT = pop_rmdat(EEG, {'rt'}, [-1, 2], 1);
EEGOUT = pop_rmdat(EEG, {'square'}, [-1, 2], 0);
EEGOUT = pop_rmdat(EEG, {'rt'}, [-10, 200], 0);
EEGOUT = pop_rmdat(EEG, {'rt', 'square'}, [-1, 2], 0);
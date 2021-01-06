% test_pop_rejchan
% 04/28/2010 roy
% case 1...7 pass
% case 8 -- bug 841 reported
% bug 841 fixed

function test_pop_rejchan
readepochsamplefile;

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [2 4 5], 'threshold', [5], 'measure', 'kurt', 'norm', 'off');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [1:32], 'threshold', [5], 'measure', 'kurt', 'norm', 'off');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [2 4 5], 'threshold', [5 5 5], 'measure', 'kurt', 'norm', 'off');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [2 4 5], 'threshold', [5], 'measure', 'prob', 'norm', 'off');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [1:32], 'threshold', [5], 'measure', 'kurt', 'norm', 'on');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [1:32], 'threshold', [5], 'measure', 'prob', 'norm', 'off');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [1:32], 'threshold', [5 1], 'measure', 'kurt', 'norm', 'off');

[OUTEEG, locthresh, globthresh, nrej] = pop_rejchan(EEG, 'elec', [1:4], 'threshold', [5], 'measure', 'kurt', 'norm', 'on');
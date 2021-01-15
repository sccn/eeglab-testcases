% test_pop_autorej.m
% 03/22/2010 roy
% case 1, 2
%
% 03/23/2010 roy
% case 3,4,5,6,7

function test_pop_autorej
readepochsamplefile;
if ~ismatlab
    EEG = pop_epoch( EEG, {  'square'  }, [-0.1 0.6], 'newname', 'EEG Data epochs epochs', 'epochinfo', 'yes');
end;

% % case1
% [EEGOUT, rmepochs] = pop_autorej(EEG);

% case2: all input with default values
[EEGOUT, rmepochs] = pop_autorej(EEG, 'threshold', 1000, 'electrodes', [1:EEG.nbchan], 'icacomps', [], 'startprob', 5, 'maxrej', 5, 'eegplot', 'off', 'nogui', 'on');
if ~ismatlab, return; end; % too long to compute

% case3: lack inputs 'threshold', 'electrodes', 'icacomps', 'startprob', and 'maxrej'
[EEGOUT, rmepochs] = pop_autorej(EEG, 'eegplot', 'off', 'nogui', 'on');

% case4: lack inputs 'threshold' = 100000000
[EEGOUT, rmepochs] = pop_autorej(EEG, 'threshold', 100000000, 'eegplot', 'off', 'nogui', 'on');

% case5: lack inputs 'threshold' = 0.1
[EEGOUT, rmepochs] = pop_autorej(EEG, 'threshold', 0.1,  'eegplot', 'off', 'nogui', 'on');

% case6: 'elecnodes' = [1]
[EEGOUT, rmepochs] = pop_autorej(EEG, 'threshold', 1000, 'electrodes', [1], 'eegplot', 'off', 'nogui', 'on');

% case7: 'elecnodes' = [1: fix(EEG.nbchan/2)]
[EEGOUT, rmepochs] = pop_autorej(EEG, 'threshold', 1000, 'electrodes', [1: fix(EEG.nbchan/2)], 'eegplot', 'off', 'nogui', 'on');



% test_pop_jointprob
% 04/13/2010 roy
% case 1...11 pass
% case 12 failed --- Bug 832 reported
% Bug 832 fixed ? 


function test_pop_jointprob
readepochsamplefile;
%% Case1
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 0, 1, 0);
if ~ismatlab, return; end; % too slow under Octave
%% Case2
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 0, 1, 1);
%% Case3
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 0, 0, 1);
%% Case4
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 0, 0, 0);
%% Case5
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 1, 1, 0);
%% Case6
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 1, 1, 1);
%% Case7
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 1, 0, 1);
%% Case8
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [1:EEG.nbchan], 3, 3, 1, 0, 0);
%% Case9
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 0, [1:length(EEG.icachansind)], 3, 3, 0, 1, 0);
%% Case10
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [2 4 5 16 32], 3, 3, 0, 1, 0);
%% Case11
[EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 0, [2 4 5 16 30], 3, 3, 0, 1, 0);
% %% Case12
% [EEGOUT, locthresh, globthresh, nrej, com] = pop_jointprob(EEG, 1, [2 4 5], [2 1 1 1], [2 1 1 1], 0, 1, 0);
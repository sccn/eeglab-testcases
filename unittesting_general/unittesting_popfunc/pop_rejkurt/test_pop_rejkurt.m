% test_pop_rejkurt
% 04/28/2010 roy
% case 1..9 case 11..19 pass
% ? case 10 and cas 20 --- see bug 832
% bug 832 fixed

function test_pop_rejkurt
readepochsamplefile;
%% case 1
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 0, 1, 0);
%% case 2
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 0, 1, 1);
%% case 3
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 0, 0, 0);
%% case 4
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 0, 0, 1);
%% case 5
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 1, 1, 0);
%% case 6
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 1, 1, 1);
%% case 7
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 1, 0, 0);
%% case 8
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [1:32], 3, 3, 1, 0, 1);

%% case 9
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [2 4 5], 3, 3, 0, 1, 0);
% %% case 10
% [OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 1, [2 4 5], [2 2 2.5], [2.1 2 2], 0, 1, 0);

%% case 11
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 0, 1, 0);
%% case 12
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 0, 1, 1);
%% case 13
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 0, 0, 0);
%% case 14
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 0, 0, 1);
%% case 15
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 1, 1, 0);
%% case 16
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 1, 1, 1);
%% case 17
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 1, 0, 0);
%% case 18
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [1:30], 3, 3, 1, 0, 1);

%% case 19
[OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [2 4 5], 3, 3, 0, 1, 0);
% %% case 20
% [OUTEEG, locthresh, globthresh, nrej] = pop_rejkurt( EEG, 0, [2 4 5], [2 2 2.5], [2.1 2 2], 0, 1, 0);
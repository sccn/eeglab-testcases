% test_pop_eventstat
% 04/02/2010 roy
% Case 1..case 20

% Where is signalstat()?

function test_pop_eventstat
readcontsamplefile;
%% Case 1
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', '');close;
%% Case 2
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt');close;
%% Case 3
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', '', [], 5);close;
%% Case 4
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', [], 5);close;
%% Case 5
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin EEG.xmax], 5);close;
%% Case 6
Shift = (EEG.xmax-EEG.xmin)/10;
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin+Shift EEG.xmax-2*Shift], 5);close;
%% Case 7
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', '', [], 80);close;
%% Case 8
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', [], 80);close;
%% Case 9
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin EEG.xmax], 80);close;
%% Case 10
Shift = (EEG.xmax-EEG.xmin)/10;
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin+Shift EEG.xmax-2*Shift], 80);close;


readepochsamplefile;
%% Case 11
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', '');close;
%% Case 12
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt');close;
%% Case 13
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', '', [], 5);close;
%% Case 14
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', [], 5);close;
%% Case 15
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin EEG.xmax], 5);close;
%% Case 16
Shift = (EEG.xmax-EEG.xmin)/10;
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin+Shift EEG.xmax-2*Shift], 5);close;
%% Case 17
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', '', [], 80);close;
%% Case 18
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', [], 80);close;
%% Case 19
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin EEG.xmax], 80);close;
%% Case 20
Shift = (EEG.xmax-EEG.xmin)/10;
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_eventstat(EEG,'latency', 'rt', 1000*[EEG.xmin+Shift EEG.xmax-2*Shift], 80);close;

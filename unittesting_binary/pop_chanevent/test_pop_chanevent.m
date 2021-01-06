% test_pop_chanevent
% 03/30/2010 roy
% load sample data
% 03/31/2010
% case1...case31
% ?

function test_pop_chanevent
%% Load sample data
EXPEEG = pop_readegi(fullfile(binarytestlocation, 'EGI/2epoc1flt.raw'));
[head, TrialData, EventData, SegmentCatIndex] = readegi(fullfile(binarytestlocation, 'EGI/2epoc1flt.raw'));
EEG = eeg_emptyset;
EEG.data = [TrialData; EventData];
eventchan = size(TrialData,1) + 1;

%% Case 1
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 2
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 3
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 4
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 5
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 6
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 7
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'on', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 8
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'on', 'delchan', 'on', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 9
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 10
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 11
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 12
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 13
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 14
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 15
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'on', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 16
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'on', 'delchan', 'off', 'delevent', 'on', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 17
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 18
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 19
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 20
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 21
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 22
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 23
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'on', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 24
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'on', 'delchan', 'on', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 25
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 26
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 27
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 1, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 28
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'both', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 29
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 30
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'trailing', 'edgelen', 10, 'oper', '', 'duration', 'off', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 31
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 1, 'oper', '', 'duration', 'on', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 32
OUTEEG = pop_chanevent(EEG,eventchan,'edge', 'leading', 'edgelen', 10, 'oper', '', 'duration', 'on', 'delchan', 'off', 'delevent', 'off', 'nbtype', NaN, 'typename', head.eventcode(1,:));

%% Case 33(Default)
OUTEEG = pop_chanevent(EEG,eventchan);

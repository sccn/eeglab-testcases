% test_pop_importevent
% 04/08/2010 roy
% case1...21
% the origenal test event file is 'tutorial_eventtable.txt'
% the input EEG data is made up following the induction in tutorial A02

function test_pop_imoprtevent
%% Make up a data set (see tutorial A02)
eeglab_p = fileparts(which('eeglab.m'));
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
Chanlocs = readlocs(fileloc);
Data = rand(32, 256*100); % 32 channels of random activity (100 s sampled at 256 Hz)
Data(33,[10:256:256*100]) = 1; % simulating a stimulus onset every second
Data(33,[100:256:256*100]+round(rand*128)) = 2; % simulating reaction times about 500 ms after stimulus onsets 
EEG = pop_importdata('setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'chanlocs', Chanlocs, 'nbchan', 32, 'pnts',...
    256*100, 'srate', 256, 'comments', 'Test Passes!');
EEG = pop_chanevent(EEG,33,'edge', 'leading', 'edgelen', 1, 'duration', 'off', 'delchan', 'on', 'delevent', 'on');

%% Case 1
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'align', NaN);
%% Case 2
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', NaN, 'optimalign', 'on');
%% Case 3
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', NaN, 'optimalign', 'off');
%% Case 4
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', 0, 'optimalign', 'on');
%% Case 5
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', 0, 'optimalign', 'off');
%% Case 6
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', 199, 'optimalign', 'on');
%% Case 7
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', 199, 'optimalign', 'off');
%% Case 8
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', -99, 'optimalign', 'on');
%% Case 9
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'align', -99, 'optimalign', 'off');
%% Case 10
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', NaN, 'optimalign', 'on');
%% Case 11
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', NaN, 'optimalign', 'off');
%% Case 12
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', 0, 'optimalign', 'on');
%% Case 13
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', 0, 'optimalign', 'off');
%% Case 14
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', 199, 'optimalign', 'on');
%% Case 15
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', 199, 'optimalign', 'off');
%% Case 16
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', -99, 'optimalign', 'on');
%% Case 17
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'yes', 'align', -99, 'optimalign', 'off');

%% Case 18
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'indices', [1:100], 'align', NaN, 'optimalign', 'on');
%% Case 19
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'append', 'no', 'indices', [], 'align', NaN, 'optimalign', 'on');
%% Case 20
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1e-3, 'append', 'no', 'align', NaN, 'optimalign', 'on');
%% Case 21
EEGOUT = pop_importevent(EEG, 'event', 'eventinfo_comma.txt', 'fields', {'latency','type','position'}, 'skipline', 1, 'timeunit', 1, 'delim', ',', 'align', NaN);
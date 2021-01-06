% test_eeg_eegrej
% 05/05/2010
% case 1..3 test suite
% case 4 arno

function test_eeg_eegrej

%% case 1
EEG = eeg_emptyset;
EEG.nbchan = 3; % channels
EEG.pnts = 4;   % data
EEG.trials = 1; % epochs
EEG.srate = 1;
EEG.xmin = 0;
EEG.xmax = 3;
%                channels, data
EEG.data = zeros(    3,      4);

%            <--    data    -->
EEG.data = [ [  1  2  3  4  5 ]; ... % <--
    [  6  7  8  9 10 ]; ... % <-- channels
    [ 11 12 13 14 15 ] ];   % <--

regions = [ [ ] ];

cdata = [ [  1  2  3  4  5 ]; ...
    [  6  7  8  9 10 ]; ...
    [ 11 12 13 14 15 ] ];
cevent = [];

rEEG = eeg_eegrej( EEG, regions );

if ~(near(cdata, rEEG.data) && near(cevent, rEEG.event))
    error('EEGLAB:unittesting', 'Error in eeg_eegrej(): Incorrect output');
end;

%% case 2
EEG = eeg_emptyset;
EEG.nbchan = 3; % channels
EEG.pnts = 5;   % data
EEG.trials = 1; % epochs
EEG.srate = 1;
EEG.xmin = 0;
EEG.xmax = 3;
%                channels, data
EEG.data = zeros(    3,      5);

%            <--    data    -->
EEG.data = [ [  1  2  3  4  5 ]; ... % <--
    [  6  7  8  9 10 ]; ... % <-- channels
    [ 11 12 13 14 15 ] ];   % <--

regions = [ [ 2 3 ] ];
cdata = [ [  1  4  5 ]; ...
    [  6  9 10 ]; ...
    [ 11 14 15 ] ];
cevent.type = 'boundary';
cevent.duration = 2;
cevent.latency = 1.5;

rEEG = eeg_eegrej( EEG, regions );

if ~(near(cdata, rEEG.data) && near(cevent, rEEG.event))
    error('EEGLAB:unittesting', 'Error in eeg_eegrej(): Incorrect output')
end;


%% case 3
%EEG = tc_emptyset; <-- EEG.event created here
EEG.nbchan = 3; % channels
EEG.pnts = 4;   % data
EEG.trials = 1; % epochs
EEG.srate = 1;
EEG.xmin = 0;
EEG.xmax = 3;
%                channels, data
EEG.data = zeros(    3,      4);

%            <--    data    -->
EEG.data = [ [  1  2  3  4  5 ]; ... % <--
    [  6  7  8  9 10 ]; ... % <-- channels
    [ 11 12 13 14 15 ] ];   % <--

regions = [ [ 2 3 ] ];
cdata = [ [  1  4  5 ]; ...
    [  6  9 10 ]; ...
    [ 11 14 15 ] ];
cevent.type = 'boundary';
cevent.duration = 2;
cevent.latency = 1.5;

rEEG = eeg_eegrej( EEG, regions );
if ~(near(cdata, rEEG.data) && near(cevent, rEEG.event))
    error('EEGLAB:unittesting', 'Error in eeg_eegrej(): Incorrect output')
end;

%% case 4
readcontsamplefile;
EEG = eeg_eegrej( EEG, [223:349:572;1:139:140]);
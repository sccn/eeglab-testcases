% test_pop_importepoch
% 04/06/2010
% ?? how should the input file be organized? - organized as EEG.epoch. Go
% to check load_file_or_array() at the bottom of pop_importepoch.m
% Information is contained in the tutorial
% 04/07/2010 roy
% case1..4 pass

function test_pop_importepoch
%% Make up a data set
eeglab_p = fileparts(which('eeglab.m'));
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
Chanlocs = readlocs(fileloc);
Pnts = 256;
Nbchan = length(Chanlocs);
Epoch = 10;
Data = rand(Nbchan, Pnts, Epoch);
Icaweights = rand(Nbchan, Nbchan);
Icasphere = rand(Nbchan, Nbchan);
EEG = pop_importdata('setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'chanlocs', Chanlocs, 'nbchan', Nbchan, 'pnts',...
    Pnts, 'srate', 256, 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
EEG.trials = 10;

%% Case 1 
EEGOUT = pop_importepoch(EEG, 'epochinfo.txt', {'epoch','response','rt'}, 'latencyfields', {'rt'}, 'timeunit', 0.001, 'headerlines', [1]);

%% Case 2 
EEGOUT = pop_importepoch(EEG, 'epochinfo.txt', {'epoch','response','rt'}, 'typefield', 'response', 'timeunit', 1e-3,...
    'latencyfields', {'rt'},  'headerlines', [1],'clearevents', 'on');

%% Case 3
epochinfo = {1, 'Correct', 502; 2 'Correct', 477; 3 'Correct', 453; 4, 'Correct', 612; 5 'Correct', 430;...
    6, 'Wrong',	 525; 7, 'Correct', 498; 8, 'Correct', 601; 9, 'Correct', 398; 10, 'Correct', 573};
EEGOUT = pop_importepoch(EEG, epochinfo, {'epoch','response','rt'}, 'typefield', 'response', 'timeunit', 1e-3,...
    'latencyfields', {'rt'},  'headerlines', [0],'clearevents', 'on');

%% Case 4
epochinfo = {1, 'Correct', 502, 1; 2 'Correct', 477, 1; 3 'Correct', 453, 1; 4, 'Correct', 612, 1; 5 'Correct', 430, 1;...
    6, 'Wrong',	 525, 1; 7, 'Correct', 498, 1; 8, 'Correct', 601, 1; 9, 'Correct', 398, 1; 10, 'Correct', 573, 1};
EEGOUT = pop_importepoch(EEG, epochinfo, {'epoch','response','rt','dr'}, 'typefield', 'response', 'durationfields', {'dr'}, 'timeunit', 1e-3,...
    'latencyfields', {'rt'},  'headerlines', [0],'clearevents', 'on');
% test_eeg_amplitudearea
% 05/04/2010 roy
% case 1 2 copy from test_suite  pass

function test_eeg_amplitudearea

%% case 1
EEG = eeg_emptyset;
        EEG.nbchan = 2; % channels
        EEG.pnts = 3;   % data
        EEG.trials = 4; % epochs
        EEG.srate = 1;
        EEG.xmin = 0;
        EEG.xmax = 2;
        %                channels, data, epochs
        EEG.data = zeros(   2,       3,    4);

        % channel 1         <-- epochs -->
        EEG.data(1,:,:) = [ [ 1 1 2 2 ]; ... % <--
                            [ 1 1 2 2 ]; ... % <-- data
                            [ 1 1 2 2 ] ];   % <--
        % channel 2         <-- epochs -->
        EEG.data(2,:,:) = [ [ 2 2 2 2 ]; ... % <--
                            [ 1 1 1 1 ]; ... % <-- data
                            [ 1 1 1 1 ] ];   % <--
EEG = eeg_checkset(EEG);

[channels, amplitude] = eeg_amplitudearea(EEG, [1 2], 1, 0, 3);

%% case 2
EEG = eeg_emptyset;
        EEG.nbchan = 2; % channels
        EEG.pnts = 3;   % data
        EEG.trials = 4; % epochs
        EEG.srate = 1;
        EEG.xmin = 0;
        EEG.xmax = 2;
        %                channels, data, epochs
        EEG.data = zeros(   2,       3,    4);

       % channel 1         <-- epochs -->
       EEG.data(1,:,:) = [ [  1  4 13 16 ]; ... % <--
                           [  2  5 14 17 ]; ... % <-- data
                           [  3  6 15 18 ] ];   % <--
       % channel 2         <-- epochs -->
       EEG.data(2,:,:) = [ [  7 10 19 22 ]; ... % <--
                           [  8 11 20 23 ]; ... % <-- data
                           [  9 12 21 24 ] ];   % <--

EEG = eeg_checkset(EEG);

[channels, amplitude] = eeg_amplitudearea(EEG, [1 2], 1, 0, 3);
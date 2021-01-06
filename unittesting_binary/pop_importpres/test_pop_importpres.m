% test_pop_importpres
% 04/08/2010 roy
% case1 .. case5 pass!

% case 4 5 failed on svn version - In finputcheck(): removedup(): verbose?
function test_pop_importpres
EEG = pop_snapread(fullfile(binarytestlocation, '/SMA/TEST.SMA'), 400);

%% Case 1
EEGOUT = pop_importpres( EEG, fullfile(binarytestlocation, 'SMA/TEST.LOG'));
%% Case 2
EEGOUT = pop_importpres( EEG, fullfile(binarytestlocation, 'SMA/TEST.LOG'), 'Event Type', 'Time', 'None');
%% Case 3
EEGOUT = pop_importpres( EEG, fullfile(binarytestlocation, 'SMA/TEST.LOG'), 'Event Type', 'Time', 'Duration');

%% Case 4
EEGOUT = pop_importpres( EEG, fullfile(binarytestlocation, 'SMA/TEST.LOG'), 'Event Type', 'Time', 'None', 0, ...
    'timeunit', 1, 'append', 'no', 'indices', [], 'align', 0, 'optimalign', 'on');

%% Case 5
EEGOUT = pop_importpres( EEG, fullfile(binarytestlocation, 'SMA/TEST.LOG'), 'Event Type', 'Time', 'None', 0, ...
    'skipline', 5, 'timeunit', 1, 'append', 'no', 'indices', [], 'align', 0, 'optimalign', 'on');


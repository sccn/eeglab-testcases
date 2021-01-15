% test_eeg_eventtypes
% 05/12/2010 roy
% case 1 from test suite
% case 1 2 3 4 pass

function test_eeg_eventtypes

%% case 1
EEG = eeg_emptyset;
EEG.event(1).type = 'square';
EEG.event(2).type = 'triangle';
EEG.event(3).type = 'circle';
EEG.event(4).type = 'square';
EEG.event(5).type = 'not really a triangle';
EEG.event(6).type = 'triangle';
EEG.event(7).type = 'square';
EEG.event(8).type = 'point';

ctypes = {'circle'; ...
    'not really a triangle'; ...
    'point'; ...
    'square'; ...
    'triangle'};
cnumbers = [ 1; 1; 1; 3; 2 ];

[rtypes, rnumbers] = eeg_eventtypes(EEG);

if near(ctypes, rtypes) && near(cnumbers, rnumbers)
    ME = MException('EEGLAB:Unit test', 'Incorrect result');
    throw(ME);
end;

%% case 2 
readcontsamplefile;
[rtypes, rnumbers] = eeg_eventtypes(EEG);


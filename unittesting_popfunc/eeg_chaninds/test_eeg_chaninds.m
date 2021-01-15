% test_eeg_chaninds
% 05/04/2010 roy
% case 1 2 3 pass
% case 4 should fail, and need to be move to test suite in the future

function test_eeg_chaninds

readepochsamplefile;
EEG;
inds = eeg_chaninds(EEG, {'P7'});

inds = eeg_chaninds(EEG, {'FPz', 'EOG1', 'F3', 'Fz',  'F4', 'EOG2', 'FC5', 'FC1', 'FC2', 'FC6', 'T7','C3', 'C4', 'Cz',...
    'T8', 'CP5', 'CP1', 'CP2', 'CP6', 'P7', 'P3', 'Pz', 'P4', 'P8', 'PO7', 'PO3', 'POz', 'PO4', 'PO8', 'O1', 'Oz', 'O2'});

inds = eeg_chaninds(EEG, { 'T8', 'CP5', 'CP1',  'P3', 'Pz', 'P4', 'P8', 'O1', 'Oz', 'O2','FPz', 'EOG1', 'F3', 'Fz',  'F4', 'EOG2', 'FC5', 'FC1', 'FC6', 'Cz'});

% inds = eeg_chaninds(EEG, {'MyChannel'});
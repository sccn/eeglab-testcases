% test_readegilocs
% 05/20/2010 roy

function test_readegilocs
EEG = eeg_emptyset;

EEG.nbchan = 32;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 32)
    error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 33;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 33)
    error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 64;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 64)
    error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 65;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 65)
   error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 128;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 128)
    error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 129;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 129)
    error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 256;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 256)
   error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;

EEG.nbchan = 257;
EEG = readegilocs(EEG);
if ~near(length(EEG.chanlocs), 257)
   error('EEGLAB:unitttesting', 'Error in readegilocs(): Incorrect result.');
end;
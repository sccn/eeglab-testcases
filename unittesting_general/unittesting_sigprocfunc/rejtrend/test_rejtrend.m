% test_rejtrend
% 05/21/2010 roy

function test_rejtrend
readepochsamplefile;
EEGOUT = rejtrend(EEG.data, 384, 0.5, 0.3);
EEGOUT = rejtrend(EEG.data, 384, 0.5, 1);
EEGOUT = rejtrend(EEG.data, 384, 0.5, 0);
EEGOUT = rejtrend(EEG.data, 384, 10, 0.3);
EEGOUT = rejtrend(EEG.data, 1000, 0.5, 0.3);

EEGOUT = rejtrend(EEG.data, 384, 0.5, 0.3, 2);
EEGOUT = rejtrend(EEG.data, 384, 0.5, 1, 3);
EEGOUT = rejtrend(EEG.data, 384, 0.5, 0, 10);
EEGOUT = rejtrend(EEG.data, 384, 10, 0.3, 100);
EEGOUT = rejtrend(EEG.data, 1000, 0.5, 0.3, 1);


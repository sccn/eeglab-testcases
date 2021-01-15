% test_rmbase
% 05/21/2010 roy
% epoch cases - bug 853
% bug 853 fixed

function test_rmbase
readepochsamplefile;
[dataout datamean] = rmbase(EEG.data);
if ~near(size(dataout), size(EEG.data))
    ME = MException('MATLAB:nargchk:notEnoughInputs', 'Incorrect dimension in result data');
    throw(ME);
end;
[dataout datamean] = rmbase(EEG.data, 384);
[dataout datamean] = rmbase(EEG.data, 192);
[dataout datamean] = rmbase(EEG.data, 384, 1:128);

readcontsamplefile;
[dataout datamean] = rmbase(EEG.data);
[dataout datamean] = rmbase(EEG.data, 30504);
[dataout datamean] = rmbase(EEG.data, 3813);
if ~near(size(datamean), [32 8])
    error('EEGLAB:unittesting', 'Error in rmbase: Not correct epoched.');
end;
[dataout datamean] = rmbase(EEG.data, 3813, 1:1000);
if ~near(size(datamean), [32 8])
    error('EEGLAB:unittesting', 'Error in rmbase: Not correct epoched.');
end;
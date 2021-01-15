% check if the interpolation does not mix original channels: 
% EEG2 should be the same as dataset EEG1 but with interpolation.

function checkinterp(EEG1, EEG2);

if nargin < 2
    return;
end;

tmpchanlocs = EEG1.chanlocs;
loc1 = { tmpchanlocs.labels }';

tmpchanlocs = EEG2.chanlocs;
loc2 = { tmpchanlocs.labels }';

if length(loc1) > length(loc2)
    checkinterp(EEG2, EEG1);
    return;
end;

for index = 1:length(loc1)
    iLoc = strmatch(loc1{index}, loc2, 'exact');
    
    if ~isempty(iLoc)
        % fprintf('Checking channel %s\n', loc1{index});
        if EEG1.data(index,1) ~= EEG2.data(iLoc,1)
            error('Interpolation failed');
        end;
    end;
end;

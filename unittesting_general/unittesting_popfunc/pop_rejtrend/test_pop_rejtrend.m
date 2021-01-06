% test_pop_rejtrend
% 04/28/2010 roy
% case 1...18 pass

function test_pop_rejtrend

readepochsamplefile;
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 0.5, 0.3, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 0.5, 0.3, 0, 0, 0);
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 0.5, 0.3, 1, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 0.5, 0.3, 1, 0, 0);

EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 0.5, 1, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 0.5, 0, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 384, 10, 0.3, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 1, 1:32, 1000, 0.5, 0.3, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 1, [2 4 5], 384, 0.5, 0.3, 0, 1, 0);

EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 0.5, 0.3, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 0.5, 0.3, 0, 0, 0);
EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 0.5, 0.3, 1, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 0.5, 0.3, 1, 0, 0);

EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 0.5, 1, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 0.5, 0, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 384, 10, 0.3, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 0, 1:30, 1000, 0.5, 0.3, 0, 1, 0);
EEGOUT = mypop_rejtrend(EEG, 0, [2 4 5], 384, 0.5, 0.3, 0, 1, 0);

function [EEG, Indexes] = mypop_rejtrend(varargin)

try
    [EEG, Indexes] = pop_rejtrend(varargin{:});
catch
    if isempty(findstr(lasterr, 'Error: dataset is empty'))
        error(lasterr);
    end
    EEG = [];
    Indexes = [];
end


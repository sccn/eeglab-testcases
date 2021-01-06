% test_pop_rejspec
% 04/28/2010 roy
% case 1...5 pass
% case 6...10 --- bug 842 reported

function test_pop_rejspec
readepochsamplefile;

tmpvers = eeg_getversion;
if str2num(tmpvers(1:2)) > 9
    [OUTEEG, Indexes] = pop_rejspec(EEG, 1, 'elecrange', [1:32], 'threshold', [-30 30], 'freqlimits', [15 30], 'eegplotplotallrej', 0, 'eegplotreject', 1, 'method', 'fft'); 
end;

if license('test', 'signal_toolbox') && ...
    license('checkout', 'signal_toolbox') && exist('psd') % requires the signal processing toolbox for PMTM function
        [OUTEEG, Indexes] = mypop_rejspec(EEG, 1, [1:32], -30, 30, 15, 30, 0, 0); 
        [OUTEEG, Indexes] = mypop_rejspec(EEG, 1, [1:32], -30, 30, 15, 30, 1, 1); 
        [OUTEEG, Indexes] = mypop_rejspec(EEG, 1, [1:32], -30, 30, 15, 30, 1, 0); 

        [OUTEEG, Indexes] = mypop_rejspec(EEG, 1, [2 4 5], -1, 100, 2, 15, 0, 1);

        [OUTEEG, Indexes] = mypop_rejspec(EEG, 0, [1:length(EEG.icachansind)], -30, 30, 15, 30, 0, 1); 
        [OUTEEG, Indexes] = mypop_rejspec(EEG, 0, [1:length(EEG.icachansind)], -30, 30, 15, 30, 0, 0); 
        [OUTEEG, Indexes] = mypop_rejspec(EEG, 0, [1:length(EEG.icachansind)], -30, 30, 15, 30, 1, 1); 
        [OUTEEG, Indexes] = mypop_rejspec(EEG, 0, [1:length(EEG.icachansind)], -30, 30, 15, 30, 1, 0); 

        % [OUTEEG, Indexes] = pop_rejspec(EEG, 0, [2 4 5], -1, 100, 2, 15, 0, 1);
end

function [EEG Indexes] = mypop_rejspec(varargin)

try
    [EEG Indexes] = pop_rejspec(varargin{:});
catch
    if isempty(findstr(lasterr, 'Error: dataset is empty'))
        error(lasterr);
    end
    EEG = [];
    Indexes = [];
end

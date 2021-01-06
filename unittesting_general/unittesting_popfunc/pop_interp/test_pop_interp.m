function test_pop_interp
readcontsamplefile;
eeglab_p = fileparts(which('eeglab.m'));
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
EEG.chanlocs=pop_chanedit(EEG.chanlocs, 'load',{ fileloc, 'filetype',''}, 'shrink',-0.1);
% EEG.chanlocs = readlocs('sample_data/eeglab_chan32.locs');
EEG.pnts = 1000;
EEG.data = EEG.data(:,1:EEG.pnts);
EEG = eeg_checkset(EEG);
EEGOUT = pop_interp(EEG,[1:16],'spherical');
EEGOUT = pop_interp(EEG,[],'spherical');

vers = version;
if ismatlab % not implemented in Octave
    EEGOUT = pop_interp(EEG,[1:16],'invdist');
    EEGOUT = pop_interp(EEG,[],'invdist');
else % crashes for Matlab?
    EEGOUT = pop_interp(EEG,[1:16],'linear');
    EEGOUT = pop_interp(EEG,[],'linear');
end;
% EEGOUT = pop_interp(EEG,[1:16],'spacetime');
% EEGOUT = pop_interp(EEG,[],'spacetime');
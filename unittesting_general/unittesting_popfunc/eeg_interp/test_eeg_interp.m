function test_eeg_interp;

readcontsamplefile;
eeglab_p = fileparts(which('eeglab.m'));
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
EEG.chanlocs = pop_chanedit(EEG.chanlocs, 'load',{ fileloc, 'filetype',''}, 'shrink',-0.1);
EEG.pnts = 1000;
EEG.data = EEG.data(:,1:EEG.pnts);
EEG = eeg_checkset(EEG);
EEGOUT = eeg_interp(EEG,[1:16],'spherical');
EEGOUT = eeg_interp(EEG,[],'spherical');
if ismatlab
    EEGOUT = eeg_interp(EEG,[1:16],'invdist'); % same as v4 method
    EEGOUT = eeg_interp(EEG,[],'invdist'); % same as v4 method
else
    EEGOUT = eeg_interp(EEG,[1:16],'linear');
    EEGOUT = eeg_interp(EEG,[],'linear');
end;
% EEGOUT = eeg_interp(EEG,[1:16],'spacetime');
% EEGOUT = eeg_interp(EEG,[],'spacetime');

chanlocs = EEG.chanlocs;
EEG = pop_select(EEG, 'nochannel', [1:4:EEG.nbchan]);
TMP = eeg_interp(EEG, chanlocs);
checkinterp(EEG(1), TMP);

TMP = eeg_interp(EEG, shuffle(chanlocs));
checkinterp(EEG(1), TMP);



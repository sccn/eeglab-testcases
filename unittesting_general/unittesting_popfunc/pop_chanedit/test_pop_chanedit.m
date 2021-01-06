function test_pop_chanedit;

readcontsamplefile;

eeglab_p = fileparts(which('eeglab.m'));
fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
EEG.chanlocs=pop_chanedit(EEG.chanlocs, 'load',{ fileloc, 'filetype',''}, 'shrink',-0.1);


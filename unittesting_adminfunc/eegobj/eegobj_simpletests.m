% simple dataset tests
pop_editoptions('option_eegobject', 1);

try
    p = fileparts(which('eeglab'));
    EEG = pop_loadset('filename','eeglab_data_epochs_ica.set','filepath',fullfile(p, 'sample_data'));
    EEG.pnts = 3;

    if length(EEG) ~= 1, error; end;

    EEG(2) = EEG;
    if length(EEG) ~= 2, error; end;

    EEG(4) = EEG(1);
    if length(EEG) ~= 4, error; end;

    EEG(1:3) = [];
    if length(EEG) ~= 1, error; end;

    EEG(3) = EEG;
    EEG(4:5) = EEG(2:3);
    if length(EEG) ~= 5, error; end;

    EEG(2).filename = 'test';
    EEG(1).chanlocs(1).labels = 'E1';
    EEG(end) = EEG(1);
    EEG(end) = [];
    if length(EEG) ~= 4, error; end;
    pop_editoptions('option_eegobject', 0);

catch
    pop_editoptions('option_eegobject', 0);
    error(lasterror);
end
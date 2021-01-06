% if in global envoronment, start EEGLAB
% --------------------------------------
evalin('base', 'TESTISGLOBAL = 1;');
if exist('TESTISGLOBAL')
    tmpfig_eeglab = findobj('tag', 'EEGLAB');
    if isempty(tmpfig_eeglab);
        eeglab;
    end;
end;
        
% find the file
% -------------
eeglab_p = fileparts(which('eeglab.m'));
filecont = fullfile(eeglab_p, 'sample_data', 'eeglab_data_epochs_ica.set');
EEG = pop_loadset(filecont);

% if in global envoronment redraw
% -------------------------------
if exist('TESTISGLOBAL')
    [ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
    eeglab redraw;
end;
evalin('base', 'clear TESTISGLOBAL;');
clear filecont eeglab_p tmpfig_eeglab;

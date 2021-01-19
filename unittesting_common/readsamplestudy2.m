
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
p = fileparts(which('readsamplestudy'));
[STUDY ALLEEG] = pop_loadstudy('filename', 'stern2s.study', 'filepath', fullfile(p, '..', 'unittesting_studyfunc', 'teststudy2'));
%[STUDY ALLEEG] = pop_loadstudy('filename', 'n400clustedit_missingdat.study', 'filepath', '/data/common4/arno/5subjects');
STUDY = std_checkset(STUDY, ALLEEG);
CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(ALLEEG)];

% if in global envoronment redraw
% -------------------------------
if exist('TESTISGLOBAL')
    eeglab redraw;
end;
evalin('base', 'clear TESTISGLOBAL;');
clear filecont eeglab_p tmpfig_eeglab;

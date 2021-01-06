% test_pop_saveset
% 04/30/2010 roy
% case 1...4 pass

function test_pop_saveset

readepochsamplefile;
EEGOUT = pop_saveset(EEG, 'filename','testsaveset.set', 'filepath', pwd, 'check', 'off', 'savemode', 'onefile');
EEGOUT = pop_loadset('filename','testsaveset.set','filepath', pwd);
delete(fullfile(pwd, 'testsaveset.set'))

EEGOUT = pop_saveset(EEG, 'filename','testsaveset.set', 'filepath', pwd, 'check', 'on', 'savemode', 'onefile');
EEGOUT = pop_loadset('filename','testsaveset.set','filepath', pwd);
delete(fullfile(pwd, 'testsaveset.set'))

EEGOUT = pop_saveset(EEG, 'filename','testsaveset.set', 'filepath', pwd, 'check', 'off', 'savemode', 'onefile');
%EEGOUT = pop_saveset(EEG, 'filename','check', 'off', 'savemode', 'resave'); % permission problem
EEGOUT = pop_loadset('filename','testsaveset.set','filepath', pwd);
delete(fullfile(pwd, 'testsaveset.set'))

EEGOUT = pop_saveset(EEG, 'filename','testsaveset.set', 'filepath', pwd, 'check', 'off', 'savemode', 'twofiles');
EEGOUT = pop_loadset('filename','testsaveset.set','filepath', pwd);
delete(fullfile(pwd, 'testsaveset.set'))
delete(fullfile(pwd, 'testsaveset.fdt'))

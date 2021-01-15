% test_pop_export
% 04/02/2010 roy
% case 1...case 33

function test_pop_export
readepochsamplefile;
%% Case 1
com = pop_export(EEG,'testexport.mat');
pass = exist('testexport.mat','file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 2
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat','file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 3
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat','file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 4
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat','file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 5
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat','file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 6
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 7
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 8
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 9
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');;
end;
delete testexport.mat
%% Case 10
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 11
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 12
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 13
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 14
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 15
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 16
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 17
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'off', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');;
end;
delete testexport.mat
%% Case 18
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
   error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 19
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 20
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 21
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');;
end;
delete testexport.mat
%% Case 22
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 23
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 24
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 25
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'off', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
   error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 26
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 27
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 28
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 29
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'on', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 30
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 31
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'on', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 32
com = pop_export(EEG,'testexport.mat','ica', 'off', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
   error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
%% Case 33
com = pop_export(EEG,'testexport.mat','ica', 'on', 'time', 'off', 'timeunit', 0.001, 'elec', 'off', 'transpose', 'on', 'erp', 'on', 'expr', '', 'precision',4);
pass = exist('testexport.mat', 'file');
if ~pass
    error('EEGLAB:unittesting','Error in pop_export(): EEG dataset not successfully exported!');
end;
delete testexport.mat
% test_pop_editset
% 04/01/2010 roy
% case 1...case6
% case 6 failed!
% ?? can not use a filename as the input 'data'?
% -  Yes, it can, only if 'dataformat' gives the correct corresponding
% format.
% 04/06/2010 roy
% case 6 passed, correct case4 & 5
% case 7..9

function test_pop_editset
% 
% readcontsamplefile;
% EEGEMPT = eeg_emptyset;
% eeglab_p = fileparts(which('eeglab.m'));
% fileloc32 = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
% fileloc33 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
% 
% % EEGOUT = pop_editset(EEG);
% % EEGIN = EEG;
% % varname = 'MyTest.m';
% % a = (exist(varname,'file')==1);
% % res = evalin('base', ['exist(' varname ') == 1']);
% 
% %% Case 1
% EEGOUT = pop_editset(EEG,'setname', EEG.setname, 'data', EEG.data, 'dataformat', 'array', 'subject', EEG.subject, 'condition', EEG.condition, 'group', EEG.group,...
%     'session', EEG.session, 'chanlocs', EEG.chanlocs, 'nbchan', EEG.nbchan, 'xmin', EEG.xmin, 'pnts', EEG.pnts, 'srate', EEG.srate, 'ref', EEG.ref,...
%     'icaweights', EEG.icaweights, 'icasphere', EEG.icasphere, 'comments', EEG.comments);
% %% Case 2
% EEGOUT = pop_editset(EEGEMPT,'setname', EEG.setname, 'data', EEG.data, 'dataformat', 'array', 'subject', EEG.subject, 'condition', EEG.condition, 'group', EEG.group,...
%     'session', EEG.session, 'chanlocs', EEG.chanlocs, 'nbchan', EEG.nbchan, 'xmin', EEG.xmin, 'pnts', EEG.pnts, 'srate', EEG.srate, 'ref', EEG.ref,...
%     'icaweights', EEG.icaweights, 'icasphere', EEG.icasphere, 'comments', EEG.comments);
% %% Case 3 (make up a data set that gaurantees the invarients)
% Chanlocs = readlocs(fileloc32);
% Pnts = 1000;
% Nbchan = length(Chanlocs);
% Data = rand(Nbchan,Pnts);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 1, 'chanlocs', Chanlocs, 'nbchan', Nbchan, 'xmin', 0, 'pnts', Pnts, 'srate', 200, 'ref', 'arno',...
%     'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% %% Case 4 (make up a data set that doesn't gaurantee some invarients)
% Chanlocs = readlocs(fileloc32);
% Pnts = 1000;
% Nbchan = length(Chanlocs);
% Data = rand(Pnts, Nbchan);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 'unit test', 'chanlocs', Chanlocs, 'nbchan', Nbchan/2, 'xmin', -1, 'pnts', Pnts, 'srate', -1000, 'ref', 'arno',...
%     'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% %% Case 5 use filename as 'chanlocs'
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan, Pnts);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 1, 'chanlocs', fileloc33, 'nbchan', fix(Nbchan/2),...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% %% Case 6 use filename as 'data' --- .mat
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan, Pnts);
% save Data.mat Data
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'data', 'Data.mat', 'dataformat', 'matlab', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 1, 'chanlocs', fileloc33, 'nbchan', Nbchan,...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.mat;
% %% Case 7 use filename as 'data' --- float32le
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan,Pnts);
% fid = fopen('Data.bin','w');
% fwrite(fid,Data,'float32','ieee-le');
% fclose(fid);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'nbchan', Nbchan, 'data', 'Data.bin', 'dataformat', 'float32le', 'subject', 'roy',...
%     'condition', 'testing', 'group', 'roy', 'session', 1, 'chanlocs', fileloc33, ...
%     'xmin', 1, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.bin;
% %% Case 8 use filename as 'data' --- float32le
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan,Pnts);
% fid = fopen('Data.bin','w');
% fwrite(fid,Data,'float32','ieee-be');
% fclose(fid);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'nbchan', Nbchan, 'data', 'Data.bin', 'dataformat', 'float32be', 'subject', 'roy',...
%     'condition', 'testing', 'group', 'roy','session', 1, 'chanlocs', fileloc33, ...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.bin;
% %% Case 9 use filename as 'data' --- ASCII
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan,Pnts);
% Data = num2str(Data);
% fid = fopen('Data.txt','w');
% for i = 1:size(Data,1)
%     fprintf(fid,'%s\n',Data(i,:));
% end;
% fclose(fid);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_editset(EEGEMPT,'setname', 'UnitTesting', 'nbchan', Nbchan, 'data', 'Data.txt', 'dataformat', 'ascii', 'subject', 'roy',...
%     'condition', 'testing', 'group', 'roy', 'session', 1, 'chanlocs', fileloc33, ...
%     'xmin', -1, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.txt;

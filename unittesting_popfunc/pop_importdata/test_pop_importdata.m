% % test_pop_editset
% % 04/06/2010 roy
% % case 1...case7
% % ?? bug 826
% function test_pop_importdata
% eeglab_p = fileparts(which('eeglab.m'));
% 
% %% Case 1 (make up a data set that gaurantees the invarients)
% fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
% % Chanlocs = pop_chanedit(Chanlocs, 'load',{ fileloc, 'filetype',''}, 'shrink',-0.1);
% Chanlocs = readlocs(fileloc);
% Pnts = 1000;
% Nbchan = length(Chanlocs);
% Data = rand(Nbchan,Pnts);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 'unit test', 'chanlocs', Chanlocs, 'nbchan', Nbchan, 'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno',...
%     'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% %% Case 2 (make up a data set that doesn't gaurantee some invarients)
% fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
% % Chanlocs = pop_chanedit(Chanlocs, 'load',{ fileloc, 'filetype',''}, 'shrink',-0.1);
% Chanlocs = readlocs(fileloc);
% Pnts = 1000;
% Nbchan = length(Chanlocs);
% Data = rand(Pnts, Nbchan);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 'unit test', 'chanlocs', Chanlocs, 'nbchan', Nbchan/2, 'xmin', -1, 'pnts', Pnts, 'srate', -1000, 'ref', 'arno',...
%     'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% %% Case 3 use filename as 'chanlocs'
% fileloc = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan, Pnts);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'data', Data, 'dataformat', 'array', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 'unit test', 'chanlocs', fileloc, 'nbchan', Nbchan/2,...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% %% Case 4 use filename as 'data'--- .mat 
% fileloc = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan, Pnts);
% save Data.mat Data
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'data', 'Data.mat', ...
%     'dataformat', 'matlab', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 'unit test', 'chanlocs', fileloc, 'nbchan', Nbchan/2,...
%     'xmin', 0, 'pnts', Pnts, 'srate', 256, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.mat;
% %% Case 5 use filename as 'data' --- float32le
% fileloc = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan, Pnts);
% fid = fopen('Data.bin','w');
% fwrite(fid,Data,'float32','ieee-le');
% fclose(fid);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'nbchan', Nbchan, 'data', 'Data.bin', ...
%     'dataformat', 'float32le', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 1, 'chanlocs', fileloc, ...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.bin;
% %% Case 6 use filename as 'data' --- float32le
% fileloc = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
% Pnts = 1000;
% Nbchan = 33;
% Data = rand(Nbchan,Pnts);
% fid = fopen('Data.bin','w');
% fwrite(fid,Data,'float32','ieee-be');
% fclose(fid);
% Icaweights = rand(Nbchan, Nbchan);
% Icasphere = rand(Nbchan, Nbchan);
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'nbchan', Nbchan, 'data', 'Data.bin', ...
%     'dataformat', 'float32be', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 1, 'chanlocs', fileloc, ...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.bin;
% %% Case 6 use filename as 'data' --- ASCII
% fileloc = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.locs');
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
% EEGOUT = pop_importdata('setname', 'UnitTesting', 'nbchan', Nbchan, 'data', 'Data.txt', ...
%     'dataformat', 'ascii', 'subject', 'roy', 'condition', 'testing', 'group', 'roy',...
%     'session', 1, 'chanlocs', fileloc, ...
%     'xmin', 0, 'pnts', Pnts, 'srate', 1000, 'ref', 'arno', 'icaweights', Icaweights, 'icasphere', Icasphere, 'comments', 'Test Passes!');
% delete Data.txt;

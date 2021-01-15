% test_eeg_eventhist
% 05/12/2010 roy
% cases are copied from test suite
% case 1 2 4 pass
% case 3 fail --- near() can not compare 'inf'
% case 5 fail --- eeg_eventhist can not deal with structure field yet


function test_eeg_eventhist

%% case 1
EEG = eeg_emptyset;
%### events ###%
EEG.event(1).type = 'square';
EEG.event(2).type = 'square';
EEG.event(3).type = 'rt';
EEG.event(4).type = 'square';
EEG.event(5).type = 'rt';

cvals = {'square'; 'square'; 'rt'; 'square'; 'rt'};
chistNs = [ 2, 3 ];
cbins = {'rt'; 'square'};

[rvals,rhistNs,rbins] = eeg_eventhist(EEG.event,'type');

if ~(near(cvals, rvals) && near(chistNs, rhistNs) && near(cbins, rbins))
    error('EEGLAB:unittesting', 'Error in eeg_eventhist(): incorrect output');
end;

%% case 2
figure; 
eeg_eventhist(EEG.event,'type',2);
close;

%% case 3
EEG = eeg_emptyset;
%### events ###%
EEG.event(1).latency = 0;
EEG.event(2).latency = 0;
EEG.event(3).latency = 0.3;
EEG.event(4).latency = 0;
EEG.event(5).latency = 0.4;

cvals = [0; 0; 0.3; 0; 0.4];
chistNs = [ 3; 1; 1 ];
cbins = [-inf; 0.14; 0.3349; inf];

% [rvals,rhistNs,rbins] = eeg_eventhist(EEG.event,'latency', 3);
% 
% if ~(near(cvals, rvals) && near(chistNs, rhistNs) && near(cbins, rbins))
%     ME = MException('MATLAB:nargchk:notEnoughInputs', 'Incorrect result');
%     throw(ME);
% end;

%% case 4
figure;
eeg_eventhist(EEG.event,'latency',3);
close;

%% case 5
% EEG = eeg_emptyset;
% %### events ###%
% EEG.event(1).test.a = 'square';
% EEG.event(2).test.a = 'square';
% EEG.event(3).test.a = 'rt';
% EEG.event(4).test.a = 'square';
% EEG.event(5).test.a = 'rt';
% 
% cvals = {'square'; 'square'; 'rt'; 'square'; 'rt'};
% chistNs = [ 2, 3 ];
% cbins = {'rt'; 'square'};
% 
% [rvals,rhistNs,rbins] = eeg_eventhist(EEG.event,'test')
% 
% if ~(near(cvals, rvals) && near(chistNs, rhistNs) && near(cbins, rbins))
%     ME = MException('MATLAB:nargchk:notEnoughInputs', 'Incorrect result');
%     throw(ME);
% end;
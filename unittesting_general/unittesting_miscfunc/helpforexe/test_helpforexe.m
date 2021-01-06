% test_helpforexe
% 05/18/2010 roy
% case 1 2 pass
% case 3 -- bug 847
function test_helpforexe

warning('WarnTests:convertTest','Start to test helpforexe!');

%% case 1
helpforexe({'eeglab.m'}, pwd);
delete help_eeglab.m;
msg = lastwarn;
if strcmp(msg, 'File ''help_eeglab.m'' not found.')
    ME = MException('MATLAB:nargchk:notEnoughInputs', 'Help file is not correctly generated');
    throw(ME);
end;

%% case 2
helpforexe({'helpforexe.m'}, pwd);
delete help_helpforexe.m;
msg = lastwarn;
if strcmp(msg, 'File ''help_helpforexe.m'' not found.')
    ME = MException('MATLAB:nargchk:notEnoughInputs', 'Help file is not correctly generated');
    throw(ME);
end;

% %% case 3
% helpforexe({'eeglab'}, pwd);
% delete help_eeglab.m;
% msg = lastwarn;
% if strcmp(msg, 'File ''help_eeglab.m'' not found.')
%     ME = MException('MATLAB:nargchk:notEnoughInputs', 'Help file is not correctly generated');
%     throw(ME);
% end;

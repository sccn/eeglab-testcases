% test_pop_chancoresp.m
% 03/23/2010 roy
% case 11...case 17, case 21...case 24, case 31...case 34
%
% 03/24/2010 roy
% case 18...case 113, case 25...case 213, case 35...case 313
function test_pop_chancoresp

%% load channel locations

% 32 channels
bvafold = fullfile(binarytestlocation, 'BVA');
EEG = pop_loadbv(bvafold, 'brainvision_genericdataformat_binarymultiplexed_int16.vhdr');
chanlocs1 = EEG.chanlocs;
% 32 channels
EEG = pop_loadbv(bvafold, 'EEGLAB_export.vhdr');
chanlocs2 = EEG.chanlocs;
% 68 channels
EEG = pop_loadbv(bvafold, 'BVA_withchanlocs.vhdr');
chanlocs3 = EEG.chanlocs;

%% Exactly same chanlocs structures
% case 11: turn off gui, and no other optional inputs
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off');
% case 12: no auto select
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'none');
% case 13: auto select all
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'all');
% case 14: auto select fiducials 
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'fiducials');
% case 15: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 16: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 17: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);
% case 18: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 19: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 110: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);
% case 111: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 112: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 113: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs1, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);


%% Different chanlocs structures with same # of channels
% case 21: turn off gui, and no other optional inputs
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off');
% case 22: no auto select
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'none');
% case 23: auto select all
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'all');
% case 24: auto select fiducials 
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'fiducials');
% case 25: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 26: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 27: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);
% case 28: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 29: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 210: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);
% case 211: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 212: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 213: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs2, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);

%% Different chanlocs structures with different # of channels
% case 31: turn off gui, and no other optional inputs
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off');
% case 32: no auto select
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'none');
% case 33: auto select all
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'all');
% case 34: auto select fiducials 
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'fiducials');
% case 35: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 36: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 37: auto select none, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'none', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);
% case 38: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 39: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 310: auto select all, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'all', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);
% case 311: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1:16], 'chanlist2',[1:16]);
% case 312: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1:16], 'chanlist2',[17:32]);
% case 313: auto select fiducials, and input chanlist1 and chanlist2
[chanlist1 chanlist2] = pop_chancoresp(chanlocs1, chanlocs3, 'gui', 'off', 'autoselect', 'fiducials', 'chanlist1', [1 2 3 4 5], 'chanlist2',[17 6 1 30 5]);

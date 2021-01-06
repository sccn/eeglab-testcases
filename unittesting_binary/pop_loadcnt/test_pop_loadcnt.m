% test_pop_loadcnt
% 04/12/2010 roy
% case1..8(case1 is copied from arno's test case) pass!
% ?? 'blockread'

function test_pop_loadcnt
%% Case1
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'dataformat', 'int32');
%% Case2
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'dataformat', 'int32',...
    't1', 0, 'lddur', 301);
%% Case3
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'dataformat', 'int32',...
    't1', 0, 'sample1', 0, 'lddur', '301', 'ldnsamples', 1000);
%% Case4
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16');
%% Case5
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16', 'memmapfile', 'map.fdt');
delete map.fdt;
%% Case6
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16',...
    't1', 0, 'lddur', 227);
%% Case7
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16',...
    't1', 0, 'sample1', 0, 'lddur', '227', 'ldnsamples', 1000);

%% Case8
EEG = pop_loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'keystroke', 'on', 'dataformat', 'int32');
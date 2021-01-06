% test_loadcnt
% 04/12/2010 roy
% case1..7 pass!
% ?? 'blockread'
function test_loadcnt
%% Case1
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'dataformat', 'int32');
%% Case2
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'dataformat', 'int32',...
    't1', 0, 'lddur', 301);
%% Case3
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'dataformat', 'int32',...
    't1', 0, 'sample1', 0, 'lddur', '301', 'ldnsamples', 1000);
%% Case4
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16');
%% Case5
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16', 'memmapfile', 'map.fdt');
delete map.fdt;
%% Case6
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16',...
    't1', 0, 'lddur', 227);
%% Case7
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST.CNT'), 'dataformat', 'int16',...
    't1', 0, 'sample1', 0, 'lddur', '227', 'ldnsamples', 1000);

%% Case8
CNT = loadcnt(fullfile(binarytestlocation, 'neuroscan/TEST32BIT_WITHEVENT.CNT'), 'keystroke', 'on', 'dataformat', 'int32');

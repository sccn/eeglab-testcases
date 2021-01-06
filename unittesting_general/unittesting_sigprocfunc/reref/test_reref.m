function test_reref
readcontsamplefile;

%% case 1 - defualt use average reference
DATAOUT1 = reref(EEG.data, [], 'keepref', 'on');
DATAOUT2 = reref(EEG.data, [1:32], 'keepref', 'on');
if ~near(DATAOUT1, DATAOUT2)
    error('EEGLAB:unittesting', 'Error in reref(): Default is not average reference?');

end;

%% case 2 - do not keep ref
DATAOUT = reref(EEG.data, [2 5 26], 'keepref', 'off');
if ~near(size(DATAOUT), [29, size(EEG.data, 2)])
    error('EEGLAB:unittesting', 'Error in reref(): Ref channels are still keeped');
end;

%% case 3 - keep ref
ref = 5;
DATAOUT = reref(EEG.data, ref, 'keepref', 'on');
if ~near(size(DATAOUT), size(EEG.data)) || ~near(DATAOUT(ref, :), zeros(1, size(EEG.data,2)))
    error('EEGLAB:unittesting', 'Error in reref(): Unseccessfully keep ref channel');

end;

%% case 4 - exclude some channels
ref = [2 5 26];
exclude = [1 32];
DATAOUT = reref(EEG.data, ref, 'exclude', exclude, 'keepref', 'off');
if ~near(size(DATAOUT), [29, size(EEG.data, 2)]) || ~near(DATAOUT([1 29], :), EEG.data(exclude,:))
    error('EEGLAB:unittesting', 'Error in reref(): Incorrect excluding channels');
end;


%%
readepochsamplefile;
%% case 5 - 3D - defualt use average reference
DATAOUT1 = reref(EEG.data, [], 'keepref', 'on');
DATAOUT2 = reref(EEG.data, [1:32], 'keepref', 'on');
if ~near(DATAOUT1, DATAOUT2)
    error('EEGLAB:unittesting', 'Error in reref(): Default is not average reference?');
end;

%% case 6 - 3D - do not keep ref
DATAOUT = reref(EEG.data, [2 5 26], 'keepref', 'off');
if ~near(size(DATAOUT), [29 EEG.pnts EEG.trials])
    error('EEGLAB:unittesting', 'Error in reref(): Ref channels are still keeped');
end;

%% case 7 - 3D - keep ref
ref = 5;
DATAOUT = reref(EEG.data, ref, 'keepref', 'on');
if ~near(size(DATAOUT), size(EEG.data)) || ~near(DATAOUT(ref, :, :), zeros(1, EEG.pnts, EEG.trials))
    error('EEGLAB:unittesting', 'Error in reref(): Unseccessfully keep ref channel');
end;

%% case 8 - 3D - exclude some channels
ref = [2 5 26];
exclude = [1 32];
DATAOUT = reref(EEG.data, ref, 'exclude', exclude, 'keepref', 'off');
if ~near(size(DATAOUT), [29 EEG.pnts EEG.trials]) || ~near(DATAOUT([1 29], :, :), EEG.data(exclude,:, :))
    error('EEGLAB:unittesting', 'Error in reref(): Incorrect excluding channels');
end;

%% case 9 - 3D - channel locs
ref = [2 5 26];
exclude = [1 32];
DATAOUT = reref(EEG.data, ref, 'exclude', exclude, 'keepref', 'off', 'elocs', EEG.chanlocs);
if ~near(size(DATAOUT), [29 EEG.pnts EEG.trials]) || ~near(DATAOUT([1 29], :, :), EEG.data(exclude,:, :))
    error('EEGLAB:unittesting', 'Error in reref(): Incorrect excluding channels');
end;

%% case 9 - 3D - channel locs
ref = [2 5 26];
exclude = [1 32];
DATAOUT = reref(EEG.data, ref, 'exclude', exclude, 'keepref', 'off', 'elocs', EEG.chanlocs, 'refloc', EEG.chanlocs(2));
if ~near(size(DATAOUT), [30 EEG.pnts*EEG.trials])
    error('EEGLAB:unittesting', 'Error in reref(): Incorrect excluding channels');
end;



% test_plotcurve
% 05/20/2010 roy

function test_plotcurve
x = 1:0.01:10;
data(1,:) = x; 
data(2,:) = randn(1,901);
data(3,:) = exp(x)./exp(10);
data(4,:) = cos(x);
data(5,:) = sin(x);
times = [-4:0.01:5];

%% case 1
plotcurve(times, data);
close;

%% case 2
plotcurve(times, data);
close;

%% case 3
plotcurve(times, data, 'xlabel', 'Time point /ms', 'ylabel', 'EP', 'legend', {'linear', 'random', 'exponential', 'cos', 'sin'},...
    'title', 'Unit testing', 'vert', [-3, -1.6, 2.2345], 'linewidth', 1);
close;

%% case 4
plotcurve(times, data, 'maskarray', [-0.001, 0.001]);
close;

%% case 5
plotcurve(times, data, 'val2mask', 0.5);
close;

%% case 6
plotcurve(times, data, 'plotmean', 'on');
close;

%%
readcontsamplefile;
eeglab_p = fileparts(which('eeglab.m'));
fileloc32 = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
locs = pop_readlocs(fileloc32);

%% case 7
times = [EEG.xmin:(EEG.xmax-EEG.xmin)/30503:EEG.xmax];
plotcurve(times, EEG.data(2,:), 'maskarray', [-0.5, 0.5], 'highlightmode', 'background');
close;

%% case 8
plotcurve(times, EEG.data, 'chanlocs', locs);
close;

% %% case 9
% plotcurve(times, EEG.data, 'chanlocs', locs, 'plottopo', [1:32]);
% close;

function test_envtopo

% Read sample data file. All the following test run based on this sample
% data set
readepochsamplefile;

% test case 1
figure;
envtopo(mean(EEG.data(EEG.icachansind,:,:),3), EEG.icaweights*EEG.icasphere,'chanlocs',EEG.chanlocs);
close;

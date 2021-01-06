function test_timtopo

% Read sample data file. All the following test run based on this sample
% data set
readepochsamplefile;
testcasefolder = fileparts(which('eeglab.m'));

% Test case (sample 1)
figure;
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [EEG.xmin EEG.xmax]*1000, 'plottimes', [NaN], 'title', 'ERP data and scalp maps of EEG Data epochs');
close;

figure;
timtopo(mean(EEG.data,3), fullfile(testcasefolder, 'sample_data', 'eeglab_chan32.locs'), 'limits', [-1000 1992.1875], 'plottimes', [NaN], 'title', 'ERP data and scalp maps of EEG Data epochs');
close;

figure;
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [EEG.xmin*1000 EEG.xmax*1000 -10 10], 'plottimes', [NaN], 'title', 'ERP data and scalp maps of EEG Data epochs');
close;

figure;
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [EEG.xmin*1000 EEG.xmax*1000 -10 10], 'plottimes', [100 200 300 400], 'title', 'ERP data and scalp maps of EEG Data epochs');
close;

figure;
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [EEG.xmin*1000 EEG.xmax*1000], 'plottimes', [100 200 300 400], 'title', 'ERP data and scalp maps of EEG Data epochs');
close;

figure;
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [EEG.xmin*1000 EEG.xmax*1000], 'plottimes', [100 200 300 400], 'title', 'ERP data and scalp maps of EEG Data epochs', 'voffsets', 10);
close;

% Test case (sample 1)
figure; 
title('Testcase','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'plottimes', [0 100 200 300], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 1
figure; 
title('Testcase 1','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'plottimes', [0 100 200 300]);
close

% Test case 2
figure; 
title('Testcase 2','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 3
figure; 
title('Testcase 3','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'plottimes', [0 100 200 300], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 4
figure; 
title('Testcase 4','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs);
close

% Test case 5
figure; 
title('Testcase 5','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-2000 3000], 'plottimes', [NaN], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 6
figure; 
title('Testcase 6','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'plottimes', [-1001], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 7
figure;
title('Testcase 7','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'plottimes', [2001], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 8
figure;
title('Testcase 8','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'plottimes', [-1001 0 100], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 9
figure;
title('Testcase 9','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [0 1000], 'plottimes', [-100], 'title', 'ERP data and scalp maps of EEG Data epochs');
close

% Test case 10
figure;
title('Testcase 10','FontSize',14);
timtopo(mean(EEG.data,3), EEG.chanlocs, 'limits', [-1000 1992.1875], 'plottimes', [-1000:10:1500], 'title', 'ERP data and scalp maps of EEG Data epochs');
close


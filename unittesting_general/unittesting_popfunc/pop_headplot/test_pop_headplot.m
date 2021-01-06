function test_pop_headplot;

readepochsamplefile;

EEG = pop_headplot(EEG, 1, [0:100:500] , 'ERP scalp maps of dataset:EEG Data epochs', [2  3],  'setup',{ 'eeglab_data_epochs_ica.spl', 'meshfile', 'mheadnew.mat', 'transform',[-0.31937 -5.9693 13.1812 0.050931 0.017213 -1.5501 1.0822 1.0004 0.92352] }); close;
delete('eeglab_data_epochs_ica.spl');

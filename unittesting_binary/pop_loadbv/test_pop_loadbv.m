function test_pop_loadbv;

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'brainvision_genericdataformat_binarymultiplexed_int16.vhdr', 1, [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32]);

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'BVA_withchanlocs.vhdr');

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'brainvision_genericdataformat_binarymultiplexed_ieee32.vhdr');

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'brainvision_genericdataformat_binarymultiplexed_int16.vhdr');

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'brainvision_genericdataformat_binaryvectorized_ieee.vhdr');

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'brainvision_genericdataformat_binaryvectorized_int16.vhdr');

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'brainvision_recorder_acquisitiondataformat.vhdr');

EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'EEGLAB_export.vhdr');

% EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA','fwdtroubleimportingdatafrombva2'), '16VSave.vhdr');
% 
% EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'CleramOBvisuel1_BaselineCorrection.vhdr');
% 
% EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'sujet02_g_0.vhdr');
% 
% EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'temp.vhdr');
% 
% EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'testdata.vhdr');
% 
% EEG = pop_loadbv(fullfile(binarytestlocation, 'BVA'), 'testoutputfrombdftobva.vhdr');

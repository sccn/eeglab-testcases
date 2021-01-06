function test_pop_biosig;

EEG = pop_biosig(fullfile(binarytestlocation, 'BDF/jo1_3.bdf'),  'blockrange',[1 10] );

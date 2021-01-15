function test_pop_editeventfield;

readcontsamplefile;
EEG = pop_editeventfield( EEG, 'indices',  '1:154', 'positioninfo', strvcat( ' Position of the target', 'Can be 1 or 2          '));

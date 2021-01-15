function test_pop_editeventvals;

readcontsamplefile;

EEG = pop_editeventvals( EEG, 'changefield', { [1], 'latency', [1.1] } , 'changefield', { [1], 'position', [2] } );

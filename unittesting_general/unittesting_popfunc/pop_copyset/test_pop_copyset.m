% test_pop_copyset
% 04/01/2010 roy

function test_pop_copyset
readcontsamplefile;
ALLEEG(1) = EEG;
ALLEEG(2) = EEG;
[ ALLEEG EEG CURRENTSET ] = pop_copyset(ALLEEG,1,2);
[ ALLEEG EEG CURRENTSET ] = pop_copyset(ALLEEG,1,1);

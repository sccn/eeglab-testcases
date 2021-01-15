% test_pop_newset
% 04/27/2010 roy
% case 1...5 pass!
function test_pop_newset
readepochsamplefile;
ALLEEG(1:8) = EEG;
CURRENTSET = 1;
cur = CURRENTSET;
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'origin', 'comments', 'no change', 'overwrite', 'on');

CURRENTSET = 8;
EEG = ALLEEG(8);
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'new', 'comments', 'change', 'overwrite', 'off');

CURRENTSET = 8;
EEG = ALLEEG(8);
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'new', 'comments', 'change', 'overwrite', 'on');

CURRENTSET = 2;
EEG = ALLEEG(2);
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'new', 'comments', 'change', 'overwrite', 'on', 'saveold', 'old.set', 'savenew', 'new.set');
delete old.set;
delete old.fdt;
delete new.set;
delete new.fdt;

CURRENTSET = 3;
EEG = ALLEEG(3);
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'new', 'comments', 'change', 'overwrite', 'on', 'retrieve', cur);
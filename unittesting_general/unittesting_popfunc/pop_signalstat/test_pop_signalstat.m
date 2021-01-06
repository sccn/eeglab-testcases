% test_pop_signalstat
% 04/30/2010 roy
% case 1...4 pass

% Where is signalstat() ?

function test_pop_signalstat

readepochsamplefile;
[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_signalstat( EEG, 1, 5 );
close;

[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_signalstat( EEG, 0, 5 );
close;

[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_signalstat( EEG, 1, 5, 50 );
close;

[M,SD,sk,k,med,zlow,zhi,tM,tSD,tndx,ksh] = pop_signalstat( EEG, 0, 5, 0.5 );
close;
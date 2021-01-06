% test_pop_prop
% 04/28/2010 roy
% case 1...6 pass
% ? more cases for different value of last argument -- see test_spectopo()

function test_pop_prop

icadefs; % retreiveing MATLAB version

readcontsamplefile;
pop_prop(EEG,1,1,0,{'freqrange', [2 50]}); close;
pop_prop(EEG,1,[2 7],0,{'freqrange', [2 50]}); close; close;

if VERS < 8.04
    pop_prop(EEG,1,1,1,{'freqrange', [2 50]}); close;
elseif VERS >= 8.04
    h= figure;
    pop_prop(EEG,1,1,h,{'freqrange', [2 50]}); close;
    close(h);
end

% pop_prop(EEG,0,1,0,{'freqrange', [2 50]}); close;
% pop_prop(EEG,0,1,1,{'freqrange', [2 50]}); close;
% pop_prop(EEG,0,[2 7],0,{'freqrange', [2 50]}); close;close;

readepochsamplefile;
pop_prop(EEG,1,1,0,{'freqrange', [2 50]}); close;
pop_prop(EEG,1,[2 7],0,{'freqrange', [2 50]}); close; close;
pop_prop(EEG,0,1,0,{'freqrange', [2 50]}); close;
pop_prop(EEG,0,[2 7],0,{'freqrange', [2 50]}); close; close;

if VERS < 8.04
    pop_prop(EEG,1,1,1,{'freqrange', [2 50]}); close;
    pop_prop(EEG,0,1,1,{'freqrange', [2 50]}); close;
elseif VERS >= 8.04
    h= figure;
    pop_prop(EEG,1,1,h,{'freqrange', [2 50]}); close;
    pop_prop(EEG,0,1,h,{'freqrange', [2 50]}); close;
    close(h)
end
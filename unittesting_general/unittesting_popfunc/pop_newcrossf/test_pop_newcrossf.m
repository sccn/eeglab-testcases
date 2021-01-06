% test_pop_newcrossf
% 04/10/2010 roy
% case 1...3 passed
% ?? 'cycle'?

function test_pop_newcrossf
%% Case 1
readepochsamplefile;
figure; pop_newcrossf( EEG, 1, 1, 2, [-1000  1992], [3         0.5] ,'type', 'phasecoher', 'topovec', [1  2], 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'title','Channel FPz-EOG1 Phase Coherence','padratio', 1);
close;
figure; pop_newcrossf( EEG, 0, 1, 2, [-1000  1992], [3         0.5] ,'type', 'phasecoher', 'topovec', EEG.icawinv(:, [1  2])', 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'title','Component 1-2 Phase Coherence','padratio', 1);
close;
%% Case 2
readcontsamplefile;
figure; pop_newcrossf( EEG, 1, 1, 2, [0  238305], [3 0.5] , 'freqs' , [1:50], 'type', 'phasecoher', 'title','Channel 1-2 Phase Coherence','padratio', 1);
close;

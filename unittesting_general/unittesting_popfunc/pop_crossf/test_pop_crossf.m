function test_pop_crossf

readepochsamplefile;
figure; pop_crossf( EEG, 0, 4, 9, [-1000  2000], [3 0.5] ,'type', 'phasecoher', 'topovec', EEG.icawinv(:, [4  9])', 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'title','Component 4-9 Phase Coherence', 'alpha',0.01,'padratio', 4); close;
figure; pop_crossf( EEG, 1, 4, 9, [-1000  2000], [3 0.5] ,'type', 'phasecoher'); close;

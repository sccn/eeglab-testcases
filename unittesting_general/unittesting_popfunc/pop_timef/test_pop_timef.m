function test_pop_timef;

readepochsamplefile;

figure; pop_timef( EEG, 1, 14, [-1000  2000], [3 0.5] ,'type', 'phasecoher', 'topovec', 14, 'elocs', EEG.chanlocs, 'title','Channel Cz power and inter-trial phase coherence (Epoched from "ee114 continuous" dataset)', 'alpha',0.01,'padratio', 4, 'plotphase', 'off'); close;
figure; pop_timef( EEG, 0, 1, [-1000  2000], [0] ,'type', 'phasecoher', 'topovec', EEG.icawinv(:,1), 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'title','Component 1 power and inter-trial phase coherence (Epoched from "ee114 continuous" dataset)','padratio', 4, 'plotphase', 'off', 'maxfreq', 30); close;

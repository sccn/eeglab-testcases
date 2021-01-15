function test_pop_envtopo;

readepochsamplefile;
figure; pop_envtopo(EEG, [-1000 1999.7949] ,'limcontrib',  [-1000 1999.7949],'compnums', -7,'title', 'Largest ERP components of Epoched from "ee114 continuous" dataset','electrodes','off'); close;
figure; pop_envtopo(EEG, [-1000 1999.7949] ,'limcontrib',  [200 500],'compnums', -7,'title', 'Largest ERP components of Epoched from "ee114 continuous" dataset','electrodes','off'); close;

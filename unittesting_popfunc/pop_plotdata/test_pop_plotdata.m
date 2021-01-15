% test_pop_plotdata
% 04/28/2010 roy
% case 1 2 3 5 6 ..12 pass
% case 7 bug 839
function test_pop_plotdata
readepochsamplefile;
avg = pop_plotdata(EEG, 1, [1:32], [1:80], '', 0, 1, [0 0]);

avg = pop_plotdata(EEG, 0, [1:30], [1:80], '', 0, 1, [0 0]);

avg = pop_plotdata(EEG, 1, [1:1], [55:67], '', 0, 1, [0 0]);

avg = pop_plotdata(EEG, 0, [2:7], [1:80], '', 0, 1, [0 0]);

avg = pop_plotdata(EEG, 0, [1:30], [1:80], 'test', 0, 1, [0 0]);

avg = pop_plotdata(EEG, 1, [1:32], [2 5 7], '', 1, 1, [0 0]);

avg = pop_plotdata(EEG, 0, [1:30], [2 5 7], '', 1, 1, [0 0]);

avg = pop_plotdata(EEG, 1, [1:32], [1:80], '', 0, -1, [0 0]);

avg = pop_plotdata(EEG, 0, [1:30], [1:80], '', 0, -1, [0 0]);

avg = pop_plotdata(EEG, 1, [1:32], [1:80], '', 0, 1, [-250 350]);

avg = pop_plotdata(EEG, 0, [1:30], [1:80], '', 0, 1, [-250 350]);
close all;
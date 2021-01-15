% test_hist2
% 05/17/2010 roy

function test_hist2

bins = -4:0.1:4;
data1 = randn(10000,1);
data2 = rand(10000,1);
hist2(data1,data2,bins);
close;
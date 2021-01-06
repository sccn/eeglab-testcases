% test_concatdata
% 05/20/2010 roy

function test_concatdata

data1 = rand(32, 100);
data2 = rand(32, 1000);
DATA = {data1, data2};
[dataarray len dims] = concatdata(DATA);

if ~near(size(dataarray), [32 1100]) || ~near(dataarray(:,1:100), data1) || ~near(dataarray(:, 101:1100), data2) || ~near(len, [0 100 1100])
    error('EEGLAB:unittesting', 'Error in concatdata(): incorrect result');
end;
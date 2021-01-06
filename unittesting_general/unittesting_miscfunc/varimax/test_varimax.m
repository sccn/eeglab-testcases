% test_varimax
% 05/20/2010 roy

function test_varimax

data = rand(32, 100);
V = varimax(data);

[V,rotdata] = varimax(data, 1e-2, 1);

[V,rotdata] = varimax(data, 1e-2, 'reorder');
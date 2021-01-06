% test_kmeanscluster
% 05/20/2010 roy

function test_kmeanscluster
m = [ 1 1; 2 1; 4 3; 5 4];                       
k = 2;           
[g, c, tmp, m]=kmeanscluster(m,k);

if ~near(g, [1;1;2;2])
    error('EEGLAB:unittesting', 'Error in kmeanscluster(): incorrect result.');
end;

m = randn(100, 20);                       
k = 5;           
[g, c, tmp, m]=kmeanscluster(m,k);
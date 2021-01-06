% test_kmeans_st
% 05/18/2010 roy

function test_kmeans_st

X1 = randn(100,2);
X2 = rand(100,2);
X = X1 + X2;
k = 2;
[centr,clst,sse] = kmeans_st(X,k);

[centr,clst,sse] = kmeans_st(X, k, 100);

k = 20;
[centr,clst,sse] = kmeans_st(X, k, 10);
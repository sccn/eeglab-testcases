% test_fdr
% 05/20/2010 roy

function test_fdr

x = randn(30,4);     % Uncorrelated data
x(:,4) = sum(x,2);   % Introduce correlation.
if ismatlab
    [r p] = corrcoef(x);   % Compute sample correlation and p-values.
else
    p =[1.0000    0.2385    0.4182    0.0611;
        0.2385    1.0000    0.4502    0.0049;
        0.4182    0.4502    1.0000    0.0001;
        0.0611    0.0049    0.0001    1.0000 ];
end;

[p_fdr, p_masked] = fdr(p);

[p_fdr, p_masked] = fdr(p, 0.8);

[p_fdr, p_masked] = fdr(p, 0.05);

[p_fdr, p_masked] = fdr(p, 0.5);

[p_fdr, p_masked] = fdr(p, 0.5, 'nonParametric');
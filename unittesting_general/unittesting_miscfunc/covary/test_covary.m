% test_covary
% 05/17/2010 roy
% pass

function test_covary
x = [1 4 1];
rvar = covary(x);
if near(rvar,2)
    error('EEGLAB:unittesting', 'Error in covary(): Not unbiased estimation.');
end;

if ~near(rvar,3) && ~near(rvar, 2)
    error('EEGLAB:unittesting', 'Error in covary(): Incorrect output.');
end;
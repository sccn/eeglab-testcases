function [test] = checkmmo_sub7(tmp);
if nargin < 1, return; end;

floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt', size(tmp), true, false, true);

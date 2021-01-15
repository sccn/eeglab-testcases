function le = checkmmo_sub1(arg);
if nargin < 1, return; end;

le = checkcopies(arg);
arg(3) = 2;

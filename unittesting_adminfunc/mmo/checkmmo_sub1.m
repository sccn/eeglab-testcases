function le = checkmmo_sub1(arg);
if nargin < 1, return; end;

le = tmp3(arg);

function le = tmp3(arg);
test = arg;
test(4) = 5;
le = checkcopies(arg);

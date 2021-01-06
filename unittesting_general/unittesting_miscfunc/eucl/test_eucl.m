% test_eucl
% 05/17/2010 roy
% case 1..6 pass

function test_eucl
n = 100;
%% case 1 2d
pnts1 = rand(n,2);
pnts2 = rand(n,2);
D = eucl(pnts1,pnts2);

%% case 2 2d long dist
pnts1 = exp(rand(n,2)*100);
pnts2 = rand(n,2);
D = eucl(pnts1,pnts2);

%% case 3 md
m = 5;
pnts1 = rand(n,m);
pnts2 = rand(n,m);
D = eucl(pnts1,pnts2);

%% case 4 point 1 is the ref
m = 5;
pnts1 = rand(1,m);
pnts2 = rand(n,m);
D = eucl(pnts1,pnts2);

%% case 5 point 2 is the ref
m = 5;
pnts1 = rand(n,m);
pnts2 = rand(1,m);
D = eucl(pnts1,pnts2);

%% case 6 symmetry
pnts1 = rand(n,m);
pnts2 = rand(n,m);
D1 = eucl(pnts1, pnts2);
D2 = eucl(pnts2, pnts1);
if ~near(D1,D2')
    ME = MException('MATLAB:nargchk:notEnoughInputs', 'The function does not hold symmetry.');
    throw(ME)
end;
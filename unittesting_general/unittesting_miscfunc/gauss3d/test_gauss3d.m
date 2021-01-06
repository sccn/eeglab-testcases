% test_gauss3d
% 05/17/2010 roy
% case 1..3 pass
% case 4 - bug 846
% fixed in svn version

function test_gauss3d

gaussmatrix = gauss3d(3,3,3);

gaussmatrix = gauss3d(2,5,7);

gaussmatrix = gauss3d( 3, 3, 3, 0.5, 0.1, 0.04, 1, 2, 3);

gaussmatrix = gauss3d( 3, 3, 3, 0.6, 0.6, 0.6, 2, 2, 2, 0.5);
% test_mapcorr
% 05/19/2010 roy
% case 1 failed -- should the number of rows of x equal to the number of
% channels in ch1? -- See bug 849
% bug 849 fixed

function test_mapcorr
eeglab_p = fileparts(which('eeglab.m'));
fileloc33 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-10-Cap33.ced');
fileloc25 = fullfile(eeglab_p, 'sample_locs', 'Standard-10-20-Cap25.locs');
loc1 = pop_readlocs(fileloc33);
loc2 = pop_readlocs(fileloc25);
data1 = rand(33,100);
data2 = rand(33,100);
[corr,indx,indy,corrs] = mapcorr(data1',data2',loc1,loc1);
[corr,indx,indy,corrs] = mapcorr(data1',data2',loc1,loc1,0,0,0);
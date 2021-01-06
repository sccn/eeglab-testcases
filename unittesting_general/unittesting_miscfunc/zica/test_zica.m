% test_zica
% 05/20/2010 roy

function test_zica
data = rand(32, 100);
[weights,sphere,compvars,bias,signs,lrates,activations] = runica(data);
[zact,basesd,maz,mazc,mazf] = zica(activations,0,0)

readcontsamplefile;
[weights,sphere,compvars,bias,signs,lrates,activations] = runica(EEG.data);
[zact,basesd,maz,mazc,mazf] = zica(activations,3813,1000:2000);
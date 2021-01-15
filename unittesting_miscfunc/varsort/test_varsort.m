% test_varsort
% 05/20/2010 roy

function test_varsort
data = rand(32, 100);

[weights,sphere,compvars,bias,signs,lrates,activations] = runica(data);
[windex,meanvar] = varsort(activations,weights,sphere);

readcontsamplefile;
ind = randperm(32);
data = EEG.data(ind,:);
[weights,sphere,compvars,bias,signs,lrates,activations] = runica(data);
[windex,meanvar] = varsort(activations,weights,sphere);

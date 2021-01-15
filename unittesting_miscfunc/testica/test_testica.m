% test_testica
% 05/19/2010 roy

function test_testica
result = testica(32,100);
close;
close;

result = testica(32,100, 64);
close;
close;

result = testica(20,1000, 64, -0.05, 1.2);
close;
close;
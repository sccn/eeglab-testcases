% test_getipsph
% 05/17/2010 roy

function test_getipsph
%% case 1
x = randn(10,1000); 
S = getipsph(x,8);  
d = S*x;

%% case 2
x = randn(10,1000); 
S = getipsph(x,10);  
d = S*x;

%% case 3
x = randn(10,1000); 
S = getipsph(x,1);  
d = S*x;

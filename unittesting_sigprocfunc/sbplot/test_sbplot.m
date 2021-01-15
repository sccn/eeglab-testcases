% test_sbplot
% 05/24/2010 roy

function test_sbplot
sbplot(3,3,6);
plot(rand(1,10),'g');
sbplot(3,3,[7 2]);
plot(rand(1,10),'r');
sbplot(8,7,47);
plot(rand(1,10),'b'); 
close;

sbplot(3,3,3,'Color','r');
hold on;
plot(rand(1, 10));
close;

h = axes('position',[.1  .1  .8  .6]);
sbplot(3,3,3, 'ax', h);
hold on;
plot(rand(1, 10));
close;
% test_slider
% 05/24/2010 roy

function test_slider
plot(rand(1, 10));
slider(gcf, 0, 0);
close;

plot(rand(1, 10));
slider(gcf, 0, 1);
close;

plot(rand(1, 10));
slider(gcf, 1, 0);
close;

plot(rand(1, 10));
slider(gcf, 1, 1, 1.2, 1.2, 0);
close;
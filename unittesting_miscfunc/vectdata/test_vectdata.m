% test_vectdata
% 05/20/2010 roy

function test_vectdata

matlabflag = 1;
try matlabflag = ismatlab; catch, end;

array = sin(-20:0.5:20);
[interparray timesout] = vectdata( array, [-20:0.5:20], 'timesout', [-20:0.01:20], 'method', 'linear');
axis([-20 20 -2 2]);
hold on;
plot([-20:0.5:20], array);
hold on;
plot([-20:0.01:20], interparray+0.5, 'r');
close;

if matlabflag
    array = sin(-20:0.5:20);
    [interparray timesout] = vectdata( array, [-20:0.5:20], 'timesout', [-20:0.01:20], 'method', 'cubic');
    axis([-20 20 -2 2]);
    hold on;
    plot([-20:0.5:20], array);
    hold on;
    plot([-20:0.01:20], interparray+0.5, 'r');
    close;

    array = sin(-20:0.5:20);
    [interparray timesout] = vectdata( array, [-20:0.5:20], 'timesout', [-20:0.01:20], 'method', 'v4');
    axis([-20 20 -2 2]);
    hold on;
    plot([-20:0.5:20], array);
    hold on;
    plot([-20:0.01:20], interparray+0.5, 'r');
    close;
end;

array = sin(-20:0.5:20);
[interparray timesout] = vectdata( array, [-20:0.5:20], 'timesout', [-20:0.01:20], 'method', 'nearest');
axis([-20 20 -2 2]);
hold on;
plot([-20:0.5:20], array);
hold on;
plot([-20:0.01:20], interparray+0.5, 'r');
close;

array = sin(-20:0.5:20);
[interparray timesout] = vectdata( array, [-20:0.5:20], 'timesout', [-20:0.01:20], 'method', 'linear', 'avgtype', 'gauss');
axis([-20 20 -2 2]);
hold on;
plot([-20:0.5:20], array);
hold on;
plot([-20:0.01:20], interparray+0.5, 'r');
close;

array = sin(-20:0.5:20);
[interparray timesout] = vectdata( array, [-20:0.5:20], 'timesout', [-20:0.01:20], 'method', 'linear', 'avgtype', 'gauss', 'border', 'on');
axis([-20 20 -2 2]);
hold on;
plot([-20:0.5:20], array);
hold on;
plot([-20:0.01:20], interparray+0.5, 'r');
close;
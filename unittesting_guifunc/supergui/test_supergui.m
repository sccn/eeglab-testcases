% test_supergui
% 05/17/2010 roy
% case 1..3 pass

function test_supergui 
%% case 1
supergui('geomhoriz', { 1 1 }, 'uilist', { ...
       { 'style', 'radiobutton', 'string', 'radio' }, ...
       { 'style', 'pushbutton' , 'string', 'push' } } );
close;

%% case 2
[handlers, width, height ] =  supergui('geom', {{1,1 [0.1 0.1], [0.2 0.2]},{1,1 [0.1 0.4], [0.4 0.5]}}, 'uilist', {{ 'style', 'radiobutton', 'string', 'radio' }, { 'style', 'pushbutton' , 'string', 'push' }}, ...
    'title', 'MyGUI', 'userdata', [],'geomvert', [1 2], 'horizontalalignment', 'left', 'minwidth', 10, 'borders', [0.05 0.04 0.07 0.06], 'spacing', [0.02 0.01], ...
    'inseth', 0.02, 'insetv', 0.02);
close;

%% case 3
[handlers, width, height ] =  supergui('geomhoriz', { 1 1 }, 'uilist', {{ 'style', 'radiobutton', 'string', 'radio' }, { 'style', 'pushbutton' , 'string', 'push' }}, ...
    'title', 'MyGUI', 'userdata', [],'geomvert', [3 2], 'horizontalalignment', 'center', 'minwidth', 10, 'borders', [0.1 0.08 0.14 0.12], 'spacing', [0.02 0.01], ...
    'inseth', 0.02, 'insetv', 0.02);
close;
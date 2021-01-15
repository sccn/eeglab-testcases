% test_eeg_context
% 05/04/2010 roy
% case 1...6 from test suite -- pass
% 

function test_eeg_context

%% case 1 
EEG = eeg_emptyset;

%### events ###%
EEG.event(1).type = 'square';
EEG.event(1).position = 2;
EEG.event(1).latency = 5;
EEG.event(1).urevent = 1;
%EEG.event(1).epoch = 1;

EEG.event(2).type = 'square';
EEG.event(2).position = 2;
EEG.event(2).latency = 8;
EEG.event(2).urevent = 2;
%EEG.event(2).epoch = 1;

EEG.event(3).type = 'rt';
EEG.event(3).position = [];
EEG.event(3).latency = 8.5;
EEG.event(3).urevent = 3;
%EEG.event(3).epoch = 1;

EEG.event(4).type = 'square';
EEG.event(4).position = 2;
EEG.event(4).latency = 12;
EEG.event(4).urevent = 4;
%EEG.event(4).epoch = 1;

EEG.event(5).type = 'rt';
EEG.event(5).position = [];
EEG.event(5).latency = 12.4;
EEG.event(5).urevent = 5;
%EEG.event(5).epoch = 1;

%### urevents ###%
EEG.urevent(1).type = 'square';
EEG.urevent(1).position = 2;
EEG.urevent(1).latency = 5;
%EEG.urevent(1).epoch = 1;

EEG.urevent(2).type = 'square';
EEG.urevent(2).position = 2;
EEG.urevent(2).latency = 8;
%EEG.urevent(2).epoch = 1;

EEG.urevent(3).type = 'rt';
EEG.urevent(3).position = [];
EEG.urevent(3).latency = 8.5;
%EEG.urevent(3).epoch = 1;

EEG.urevent(4).type = 'square';
EEG.urevent(4).position = 2;
EEG.urevent(4).latency = 12;
%EEG.urevent(4).epoch = 1;

EEG.urevent(5).type = 'rt';
EEG.urevent(5).position = [];
EEG.urevent(5).latency =12.4;
%EEG.urevent(5).epoch = 1;

ctrgs = [ [ 1 1 NaN 1 ]; ...
    [ 2 2 NaN 1 ]; ...
    [ 4 4 NaN 1 ] ];
curnbrs = [ [2]; [3]; [5] ];
curnbrtypes = [ [1]; [2]; [2] ];
cdelays = [ [3000]; [500]; [400] ];
ctflds = { 'square'; 'square'; 'square' };
curnflds = { 'square'; 'rt'; 'rt' };

[trgs,urnbrs,urnbrtypes,delays,tflds,urnflds] = ...
    eeg_context(EEG, 'square', {'square', 'rt'}, [1], 'type', 'all');

if ~( near(ctrgs, trgs) && near(curnbrs, urnbrs) ...
        && near(curnbrtypes, urnbrtypes) && near(cdelays, delays) ...
        && near(ctflds, tflds) && near(curnflds, urnflds))
   error('EEGLAB:unittesting', 'Error in eeg_context.')
end;


%% case 2

[trgs,urnbrs,urnbrtypes,delays,tflds,urnflds] = ...
    eeg_context(EEG, 'square', {'square', 'rt'}, [1], 'type');

if ~( near(ctrgs, trgs) && near(curnbrs, urnbrs) ...
        && near(curnbrtypes, urnbrtypes) && near(cdelays, delays) ...
        && near(ctflds, tflds) && near(curnflds, urnflds))
    error('EEGLAB:unittesting', 'Error in eeg_context.')
end;


%% case 3
EEG = eeg_emptyset;

%### events ###%
EEG.event(1).type = 'square';
EEG.event(1).position = 2;
EEG.event(1).latency = 0;
EEG.event(1).urevent = 1;
EEG.event(1).epoch = 1;

EEG.event(2).type = 'square';
EEG.event(2).position = 2;
EEG.event(2).latency = 0;
EEG.event(2).urevent = 2;
EEG.event(2).epoch = 2;

EEG.event(3).type = 'rt';
EEG.event(3).position = [];
EEG.event(3).latency = 0.3;
EEG.event(3).urevent = 3;
EEG.event(3).epoch = 2;

EEG.event(4).type = 'square';
EEG.event(4).position = 2;
EEG.event(4).latency = 0;
EEG.event(4).urevent = 4;
EEG.event(4).epoch = 3;

EEG.event(5).type = 'rt';
EEG.event(5).position = [];
EEG.event(5).latency = 0.4;
EEG.event(5).urevent = 5;
EEG.event(5).epoch = 3;

%### epoch ###%
EEG.epoch(1).event = [1];
EEG.epoch(1).eventlatency = {[0]};
EEG.epoch(1).eventposition = {[2]};
EEG.epoch(1).eventtype = {'square'};
EEG.epoch(1).eventurevent = {[1]};

EEG.epoch(2).event = [2, 3];
EEG.epoch(2).eventlatency = {[0], [0.3]};
EEG.epoch(2).eventposition = {[2], []};
EEG.epoch(2).eventtype = {'square', 'rt'};
EEG.epoch(2).eventurevent = {[2], [3]};

EEG.epoch(3).event = [4, 5];
EEG.epoch(3).eventlatency = {[0], [0.4]};
EEG.epoch(3).eventposition = {[2], []};
EEG.epoch(3).eventtype = {'square', 'rt'};
EEG.epoch(3).eventurevent = {[4], [5]};

%### urevents ###%
EEG.urevent(1).type = 'square';
EEG.urevent(1).position = 2;
EEG.urevent(1).latency = 0;
EEG.urevent(1).epoch = 1;

EEG.urevent(2).type = 'square';
EEG.urevent(2).position = 2;
EEG.urevent(2).latency = 0;
EEG.urevent(2).epoch = 2;

EEG.urevent(3).type = 'rt';
EEG.urevent(3).position = [];
EEG.urevent(3).latency = 0.3;
EEG.urevent(3).epoch = 2;

EEG.urevent(4).type = 'square';
EEG.urevent(4).position = 2;
EEG.urevent(4).latency = 0;
EEG.urevent(4).epoch = 3;

EEG.urevent(5).type = 'rt';
EEG.urevent(5).position = [];
EEG.urevent(5).latency =0.4;
EEG.urevent(5).epoch = 3;

ctrgs = [ [ 1 1 1 1 ]; ...
    [ 2 2 2 1 ]; ...
    [ 4 4 3 1 ] ];
curnbrs = [ [2]; [3]; [5] ];
curnbrtypes = [ [1]; [2]; [2] ];
cdelays = [ [0]; [300]; [400] ];
ctflds = { 'square'; 'square'; 'square' };
curnflds = { 'square'; 'rt'; 'rt' };

[trgs,urnbrs,urnbrtypes,delays,tflds,urnflds] = ...
    eeg_context(EEG, 'square', {'square', 'rt'}, [1], 'type');

if ~( near(ctrgs, trgs) && near(curnbrs, urnbrs) ...
        && near(curnbrtypes, urnbrtypes) && near(cdelays, delays) ...
        && near(ctflds, tflds) && near(curnflds, urnflds))
   error('EEGLAB:unittesting', 'Error in eeg_context.')
end;


%% case 4
EEG = eeg_emptyset;

%### events ###%
EEG.event(1).type = 'square';
EEG.event(1).position = 2;
EEG.event(1).latency = 5;
EEG.event(1).urevent = 1;
%EEG.event(1).epoch = 1;

EEG.event(2).type = 'square';
EEG.event(2).position = 2;
EEG.event(2).latency = 8;
EEG.event(2).urevent = 2;
%EEG.event(2).epoch = 1;

EEG.event(3).type = 'rt';
EEG.event(3).position = [];
EEG.event(3).latency = 8.5;
EEG.event(3).urevent = 3;
%EEG.event(3).epoch = 1;

EEG.event(4).type = 'square';
EEG.event(4).position = 2;
EEG.event(4).latency = 12;
EEG.event(4).urevent = 4;
%EEG.event(4).epoch = 1;

EEG.event(5).type = 'rt';
EEG.event(5).position = [];
EEG.event(5).latency = 12.4;
EEG.event(5).urevent = 5;
%EEG.event(5).epoch = 1;

%### urevents ###%
EEG.urevent(1).type = 'square';
EEG.urevent(1).position = 2;
EEG.urevent(1).latency = 5;
%EEG.urevent(1).epoch = 1;

EEG.urevent(2).type = 'square';
EEG.urevent(2).position = 2;
EEG.urevent(2).latency = 8;
%EEG.urevent(2).epoch = 1;

EEG.urevent(3).type = 'rt';
EEG.urevent(3).position = [];
EEG.urevent(3).latency = 8.5;
%EEG.urevent(3).epoch = 1;

EEG.urevent(4).type = 'square';
EEG.urevent(4).position = 2;
EEG.urevent(4).latency = 12;
%EEG.urevent(4).epoch = 1;

EEG.urevent(5).type = 'rt';
EEG.urevent(5).position = [];
EEG.urevent(5).latency =12.4;
%EEG.urevent(5).epoch = 1;


ctrgs = [ [ 1 1 NaN 1 ]; ...
    [ 2 2 NaN 1 ]; ...
    [ 4 4 NaN 1 ] ];
curnbrs = [ [2 3]; ...
    [3 4]; ...
    [5 NaN] ];
curnbrtypes = [ [1 2]; ...
    [2 1]; ...
    [2 NaN] ];
cdelays = [ [3000 3500]; ...
    [500 4000]; ...
    [400 NaN] ];
ctflds = { 'square'; ...
    'square'; ...
    'square' };
curnflds = { 'square' 'rt'; ...
    'rt'     'square'; ...
    'rt'     [] };

[trgs,urnbrs,urnbrtypes,delays,tflds,urnflds] = ...
    eeg_context(EEG, 'square', {'square', 'rt'}, [1 2], 'type');

if ~( near(ctrgs, trgs) && near(curnbrs, urnbrs) ...
        && near(curnbrtypes, urnbrtypes) && near(cdelays, delays) ...
        && near(ctflds, tflds) && near(curnflds, urnflds))
    error('EEGLAB:unittesting', 'Error in eeg_context.')
end;


%% case 5
EEG = eeg_emptyset;

%### events ###%
EEG.event(1).type = 'square';
EEG.event(1).position = 2;
EEG.event(1).latency = 5;
EEG.event(1).urevent = 1;
%EEG.event(1).epoch = 1;

EEG.event(2).type = 'square';
EEG.event(2).position = 2;
EEG.event(2).latency = 8;
EEG.event(2).urevent = 2;
%EEG.event(2).epoch = 1;

EEG.event(3).type = 'rt';
EEG.event(3).position = [];
EEG.event(3).latency = 8.5;
EEG.event(3).urevent = 3;
%EEG.event(3).epoch = 1;

EEG.event(4).type = 'square';
EEG.event(4).position = 2;
EEG.event(4).latency = 12;
EEG.event(4).urevent = 4;
%EEG.event(4).epoch = 1;

EEG.event(5).type = 'rt';
EEG.event(5).position = [];
EEG.event(5).latency = 12.4;
EEG.event(5).urevent = 5;
%EEG.event(5).epoch = 1;

%### urevents ###%
EEG.urevent(1).type = 'square';
EEG.urevent(1).position = 2;
EEG.urevent(1).latency = 5;
%EEG.urevent(1).epoch = 1;

EEG.urevent(2).type = 'square';
EEG.urevent(2).position = 2;
EEG.urevent(2).latency = 8;
%EEG.urevent(2).epoch = 1;

EEG.urevent(3).type = 'rt';
EEG.urevent(3).position = [];
EEG.urevent(3).latency = 8.5;
%EEG.urevent(3).epoch = 1;

EEG.urevent(4).type = 'square';
EEG.urevent(4).position = 2;
EEG.urevent(4).latency = 12;
%EEG.urevent(4).epoch = 1;

EEG.urevent(5).type = 'rt';
EEG.urevent(5).position = [];
EEG.urevent(5).latency =12.4;
%EEG.urevent(5).epoch = 1;


ctrgs = [ [ 1 1 NaN 1 ]; ...
    [ 2 2 NaN 1 ]; ...
    [ 4 4 NaN 1 ] ];
curnbrs = [ [NaN 2]; ...
    [NaN 3]; ...
    [2 5] ];
curnbrtypes = [ [NaN 1]; ...
    [NaN 2]; ...
    [1 2] ];
cdelays = [ [NaN 3000]; ...
    [NaN 500]; ...
    [-4000 400] ];
ctflds = { 'square'; ...
    'square'; ...
    'square' };
curnflds = { []       'square'; ...
    []       'rt'; ...
    'square' 'rt' };

[trgs,urnbrs,urnbrtypes,delays,tflds,urnflds] = ...
    eeg_context(EEG, 'square', {'square', 'rt'}, [-2 1], 'type');

if ~( near(ctrgs, trgs) && near(curnbrs, urnbrs) ...
        && near(curnbrtypes, urnbrtypes) && near(cdelays, delays) ...
        && near(ctflds, tflds) && near(curnflds, urnflds))
    error('EEGLAB:unittesting', 'Error in eeg_context.')
end;


%% case 6
EEG = eeg_emptyset;

%### events ###%
EEG.event(1).type = 'square';
EEG.event(1).position = 2;
EEG.event(1).latency = 5;
EEG.event(1).urevent = 1;
%EEG.event(1).epoch = 1;

EEG.event(2).type = 'square';
EEG.event(2).position = 2;
EEG.event(2).latency = 8;
EEG.event(2).urevent = 2;
%EEG.event(2).epoch = 1;

EEG.event(3).type = 'rt';
EEG.event(3).position = [];
EEG.event(3).latency = 8.5;
EEG.event(3).urevent = 3;
%EEG.event(3).epoch = 1;

EEG.event(4).type = 'square';
EEG.event(4).position = 2;
EEG.event(4).latency = 12;
EEG.event(4).urevent = 4;
%EEG.event(4).epoch = 1;

EEG.event(5).type = 'rt';
EEG.event(5).position = [];
EEG.event(5).latency = 12.4;
EEG.event(5).urevent = 5;
%EEG.event(5).epoch = 1;

%### urevents ###%
EEG.urevent(1).type = 'square';
EEG.urevent(1).position = 2;
EEG.urevent(1).latency = 5;
%EEG.urevent(1).epoch = 1;

EEG.urevent(2).type = 'square';
EEG.urevent(2).position = 2;
EEG.urevent(2).latency = 8;
%EEG.urevent(2).epoch = 1;

EEG.urevent(3).type = 'rt';
EEG.urevent(3).position = [];
EEG.urevent(3).latency = 8.5;
%EEG.urevent(3).epoch = 1;

EEG.urevent(4).type = 'square';
EEG.urevent(4).position = 2;
EEG.urevent(4).latency = 12;
%EEG.urevent(4).epoch = 1;

EEG.urevent(5).type = 'rt';
EEG.urevent(5).position = [];
EEG.urevent(5).latency =12.4;
%EEG.urevent(5).epoch = 1;


ctrgs = [ [ 1 1 NaN 1 ]; ...
    [ 2 2 NaN 1 ]; ...
    [ 3 3 NaN 1 ]; ...
    [ 4 4 NaN 1 ]; ...
    [ 5 5 NaN 1 ] ];
curnbrs = [ [2]; [3]; [4]; [5]; [NaN] ];
curnbrtypes = [ [1]; [1]; [1]; [1]; [NaN] ];
cdelays = [ [3000]; [500]; [3500]; [400]; [NaN] ];
ctflds = [];
curnflds = [];

[trgs,urnbrs,urnbrtypes,delays,tflds,urnflds] = ...
    eeg_context(EEG);

if ~( near(ctrgs, trgs) && near(curnbrs, urnbrs) ...
        && near(curnbrtypes, urnbrtypes) && near(cdelays, delays) ...
        && near(ctflds, tflds) && near(curnflds, urnflds))
    error('EEGLAB:unittesting', 'Error in eeg_context.')
end;
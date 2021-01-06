function passboundary

EEG = pop_importdata('dataformat','array','nbchan',1,'data',rand(1,2000),'srate',100,'pnts',0,'xmin',0);

boundlocori = [
           1          200
           1000        1200];
EEG1 = eeg_eegrej(EEG, ceil(boundlocori));

boundloc = [ EEG1.event.latency ];
dur      = [ EEG1.event.duration ];
cumdur   = cumsum(dur);
boundloc = boundloc + [0 cumdur(1:end-1) ];
boundloc = ceil([ boundloc; boundloc+dur-1]');

if ~isequal(boundloc, boundlocori)
    error('EEGLAB Boundary event discrepency');
end

boundlocori = [
           100          150
           200          250
           300          350
           400          500
           1000        1200];
EEG1 = eeg_eegrej(EEG, ceil(boundlocori));

boundloc = [ EEG1.event.latency ];
dur      = [ EEG1.event.duration ];
cumdur   = cumsum(dur);
boundloc = boundloc + [0 cumdur(1:end-1) ];
boundloc = ceil([ boundloc; boundloc+dur-1]');

if ~isequal(boundloc, boundlocori)
    error('EEGLAB Boundary event discrepency');
end


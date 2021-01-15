% Cannot run without user control
function test_pop_chansel
% %% Load sample channels
% eeglab_p = fileparts(which('eeglab.m'));
% fileloc = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
% eloc = readlocs(fileloc);
% nbchan = length(eloc);
% for index = 1:nbchan
%     chans{index} = eloc(index).labels;
% end;
% 
% %% Case 1
% [chanlist strchannames cellchannames] = pop_chansel(chans, 'withindex', 'on', 'select', [1], 'selectionmode', 'single');
% close;
% 
% %% Case 2
% [chanlist strchannames cellchannames] = pop_chansel(chans, 'withindex', 'off', 'select', [1], 'selectionmode', 'single');
% close;
% 
% %% Case 3
% [chanlist strchannames cellchannames] = pop_chansel(chans, 'withindex', 'on', 'select', [1:nbchan], 'selectionmode', 'multiple');
% close;
% 
% %% Case 4
% [chanlist strchannames cellchannames] = pop_chansel(chans, 'withindex', 'off', 'select', [1:nbchan], 'selectionmode', 'multiple');
% close;


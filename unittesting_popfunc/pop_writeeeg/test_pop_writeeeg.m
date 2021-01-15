% test_pop_writeeeg
% 04/30/2010 roy
% case 1 2 3 pass
% ? case 4 5 --- format not supported yet?

function test_pop_writeeeg

readcontsamplefile;

filename = [pwd '/testwriteeeg.edf'];
pop_writeeeg(EEG, filename);
delete testwriteeeg.edf

filename = [pwd '/testwriteeeg.gdf'];
pop_writeeeg(EEG, filename, 'TYPE', 'GDF');
delete testwriteeeg.gdf

if ~ismatlab, return; end; % BDF writting currently crashes under Octave

filename = [pwd '/testwriteeeg.bdf'];
pop_writeeeg(EEG, filename, 'TYPE', 'BDF');
delete testwriteeeg.bdf
% 
% filename = [pwd '/testwriteeeg.cfwb'];
% pop_writeeeg(EEG, filename, 'TYPE', 'CFWB');
% delete testwriteeeg.cfwb
% 
% filename = [pwd '/testwriteeeg.cnt'];
% pop_writeeeg(EEG, filename, 'TYPE', 'CNT');
% delete testwriteeeg.cnt
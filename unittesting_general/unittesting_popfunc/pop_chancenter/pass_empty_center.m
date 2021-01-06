% Testcases for EEGLab
% Copyright (C) 2007 Andreas Romeyke & Maxim Duester
% Max-Planck-Institute for Human Cognitive and Brain Sciences Leipzig, Germany
% romeyke@cbs.mpg.de, art1@andreas-romeyke.de
%
% based on EEGLab-toolbox
% http://www.sccn.ucsd.edu/eeglab/
% Copyright (C) 1996 Scott Makeig et al, SCCN/INC/UCSD, scott@sccn.ucsd.edu
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

function pass_empty_center()

chanloc1.X = 0;
chanloc1.Y = 1.95;
chanloc1.Z = 0;
chanloc1.theta = 0;
chanloc1.radius = 0;
chanloc1.labels = '';

chanloc2.X = 2;
chanloc2.Y = 0;
chanloc2.Z = 0;
chanloc2.theta = 0;
chanloc2.radius = 0;
chanloc2.labels = '';

chanloc3.X = 0;
chanloc3.Y = 0;
chanloc3.Z = 2;
chanloc3.theta = 0;
chanloc3.radius = 0;
chanloc3.labels = '';
chanlocs = [chanloc1 chanloc2 chanloc3];
center = [];

[newchanlocs newcenter com] = pop_chancenter(chanlocs,center);
dev = 0.11; % rough guess (changed from 0.05 for Octave compabitility)
if ~(abs(newcenter(1))<dev) || ~(abs(newcenter(2))<dev) || ~(abs(newcenter(3))<dev)
    error('EEGLAB:unittesting', 'Error in pop_chancenter(): incorrect output.');
end;

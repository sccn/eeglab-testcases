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

function pass_no_omitchans()

chanloc1.X = 0;
chanloc1.Y = 0;
chanloc1.Z = 0;
chanloc1.theta = 0;
chanloc1.radius = 0;
chanloc1.labels = '';

chanloc2.X = 1;
chanloc2.Y = 0;
chanloc2.Z = 0;
chanloc2.theta = 0;
chanloc2.radius = 0;
chanloc2.labels = '';

chanloc3.X = 0;
chanloc3.Y = 1;
chanloc3.Z = 1;
chanloc3.theta = 0;
chanloc3.radius = 0;
chanloc3.labels = '';
chanlocs = [chanloc1 chanloc2 chanloc3];
center = [1 -1 0];

[newchanlocs newcenter com] = pop_chancenter(chanlocs,center);
for i = 1:3
    chanlocs(i).X = chanlocs(i).X - center(1);
    chanlocs(i).Y = chanlocs(i).Y - center(2);
    chanlocs(i).Z = chanlocs(i).Z - center(3);
end;
if ~near(newchanlocs, convertlocs(chanlocs,'cart2all')) ...
        || ~near(center, newcenter)
    error('EEGLAB:unittesting', 'Error in pop_chancenter(): incorrect output.');
end;

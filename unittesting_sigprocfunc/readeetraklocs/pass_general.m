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

% bug --- See loadtxt

function pass_general()

% file = 'test.elc';
% labels = {'Nr1' 'Nr2' 'Nr3' 'Ch4'};
% coord = [[ 1   -2    3  ]; ...
%     [ 0.1  2.5 -4  ]; ...
%     [ 3   -4   -8.5]; ...
%     [-11   0   19]];
% xyz = {'X' 'Y' 'Z'};
% 
% chanlocs = readeetraklocs(file);
% if length(chanlocs) == length(labels)
%     for i = 1:length(chanlocs)
%         if ~isequal(chanlocs(i).labels,labels{i})
%             error('EEGLAB:unittesting', 'Error in readeetraklocs(): incorrect channel labels.');
%         end;
%         for j = 1:3
%             if ~near(chanlocs(i).(xyz{j}),coord(i,j))
%                 error('EEGLAB:unittesting', 'Error in readeetraklocs(): incorrect channel locations');
%             end;
%         end;
%     end;
% else
%     error('EEGLAB:unittesting', 'Error in readeetraklocs(): incorrect number of channels');
% end;

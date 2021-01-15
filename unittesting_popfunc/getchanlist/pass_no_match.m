% Testcases for EEGLab
% Copyright (C) 2006 Andreas Romeyke & Ronny Lindner
% Max-Planck-Institute for Human Cognitive and Brain Sciences Leipzig, Germany
% romeyke@cbs.mpg.de, art1@it-netservice.de
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

function pass_no_match()

        chanlocs(1).type = 'h';
        chanlocs(1).X = 1;
        chanlocs(1).Y = 2;
        chanlocs(1).Z = 3;

        chanlocs(2).type = 'e';
        chanlocs(2).X = 2;
        chanlocs(2).Y = 3;
        chanlocs(2).Z = 4;

        chanlocs(3).type = 'l';
        chanlocs(3).X = 3;
        chanlocs(3).Y = 4;
        chanlocs(3).Z = 5;

        chanlocs(4).type = 'l';
        chanlocs(4).X = 4;
        chanlocs(4).Y = 5;
        chanlocs(4).Z = 6;

        chanlocs(5).type = 'o';
        chanlocs(5).X = 5;
        chanlocs(5).Y = 6;
        chanlocs(5).Z = 7;

        % 'a' is not in types -> empty list
        rchanlist = getchanlist(chanlocs, 'a');

        if ~isempty(rchanlist)
            error('EEGLAB:unittesting', 'Error in getchanlist(): incorrect output.');
        end;

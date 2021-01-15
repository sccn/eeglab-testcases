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

% flat from above
%
%          +x
%           |
%          /|\
%       ,o  |  o.
%      /    |    \
% +y --|----+----|-- -y
%      \    |    /
%       `.__|__.'
%           |
%          -x

% -45     0     45
%         |
%         |
% -90 ----+---- 90
%         |
%         |
% -135  +-180  135

function pass_zero_y()
        data = [ [ 1  0.000001000001 0 ];...
                 [-1  0.000001000001 0 ] ];

        cth = [ [   0 ];...
                [-180 ] ]; % 180 or -180 is correct

        cr  = [ [ 0.5 ];...
                [ 0.5 ] ];

        % cart2topo is deprecated!
        [rth rr] = cart2topo(data);

        if ~near(cth, rth) || ~near(cr, rr)
            error('EEGLAB:unittesting','Error in cart2topo(): incorrect result.');
        end;

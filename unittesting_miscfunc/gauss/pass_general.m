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

function pass_general()

        frames = 5;
        sds = 1;

        cupnum = 1;
        cdownnum = 1;

        %    up                   down
        %    __      ........
        %     /|   ....    ....     \
        %    /   ... :      : ...    \
        %   /   ..   :      :   ..    \
        %  /   ...   :      :   ...    \|
        % /  ...     :      :     ... --'
        % ....       :      :       ....
        % 
        % |---left---|center|--right---|

        routvector = gauss(frames, sds);

        rleft = routvector(1:floor(end/2));
        rcenter = routvector(ceil(end/2)); % == 1 if odd frames
        rright = routvector(ceil(end/2+1):end);

        rupnum = 0;
        rdownnum = 0;
        status = -1;
        for x = 2:frames
            if status == 1
                if routvector(x) < routvector(x-1)
                    status = -1;
                    rdownnum = rdownnum + 1;
                end;
            else
                if routvector(x) > routvector(x-1)
                    status = 1;
                    rupnum = rupnum + 1;
                end;
            end;
        end;


        if ~near(length(routvector), frames) ... % vector has correct length
        || ~near(rleft, rright(end:-1:1)) ... % right and left part equal
        || ~all(routvector <= 1) ... % 1 allowed
        || ~any(routvector < 1) ... % but not for all values
        || ~all(routvector >= 0) ... % 0 allowed
        || ~any(routvector > 0) ... % but not for all values
        || ~near(cupnum, rupnum) ...
        || ~near(cdownnum, rdownnum)
            error('EEGLAB:unittesting', 'Error in gauss(): incorrect result.');
        end;


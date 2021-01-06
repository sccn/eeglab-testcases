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

function pass_seven_args()

        framesx = 5;
        framesy = 4;
        sdsx = 1;
        sdsy = 1;
        peakx = (framesx+1)/2;
        peaky = (framesy+1)/2;
        mask = 0.5; % 50%

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

        routmatrix = gauss2d(framesx, framesy, sdsx, sdsy, peakx, peaky, mask);
        routmatrix2 = gauss2d(framesx, framesy, sdsx, sdsy, peakx, peaky, 0);

        rleftx = routmatrix(1:floor(end/2),:);
        rcenterx = routmatrix(ceil(end/2),:); % == 1 if odd frames
        rrightx = routmatrix(ceil(end/2+1):end,:);

        rlefty = routmatrix(:,1:floor(end/2));
        rcentery = routmatrix(:,ceil(end/2)); % == 1 if odd frames
        rrighty = routmatrix(:,ceil(end/2+1):end);

        if ~near(size(routmatrix), [framesx, framesy]) ... % vector has correct length
        || ~near(rleftx, rrightx(end:-1:1,:)) ... % right and left part equal
        || ~near(rlefty, rrighty(:,end:-1:1)) ... % right and left part equal
        || ~all(all(routmatrix <= 1)) ... % 1 allowed
        || ~any(any(routmatrix < 1)) ... % but not for all values
        || ~all(all(routmatrix >= 0)) ... % 0 allowed
        || ~any(any(routmatrix > 0)) ... % but not for all values
        || sum(sum(abs(routmatrix))) >= sum(sum(abs(routmatrix2))) % a part is set to 0 and should be smaller
            error('EEGLAB:unittesting', 'Error in gauss(): incorrect result.');
        end;


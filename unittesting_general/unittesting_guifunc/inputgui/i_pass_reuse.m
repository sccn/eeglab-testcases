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

% ?? Can not run without user control

% function passed = i_pass_reuse()
% geometry = {[1 1], 1};
% uilist = { {'Style', 'radiobutton', 'string', 'you have the choice', 'callback', 'disp(''radiobutton pushed'')'}, ...
%     {'Style', 'pushbutton', 'string', 'pushme', 'callback', 'disp(''button pushed'')'}, ...
%     {'Style', 'edit', 'string', 'PLEASE PRESS [Ok]', 'callback', 'disp(''textfield complains'')'} };
% 
% inputgui('geometry', geometry, 'uilist', uilist, 'mode', 'plot');
% 
% windows = get(0, 'children');
% mode = windows(1); % choose one of the available windows and use it for input
% 
% if mode < 1
%     passed = tc_nottested;
%     return;
% end;
% 
% outparam = inputgui('geometry', geometry, 'uilist', uilist, 'mode', mode);
% 
% if ~near(size(outparam), [1,2]) ...
%         || ~isnumeric(outparam{1}) ...
%         || ~(near(outparam{1}, 0) || near(outparam{1}, 1)) ...
%         || ~ischar(outparam{2})
%     error('EEGLAB:unittesting', 'Error in inputgui() --- incorrect output');
% end;


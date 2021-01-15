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

% ?? Can not run without user control

% function passed = i_pass_geomvert()
% 
% geometry = {[1 1], 1};
% uilist = { {'Style', 'radiobutton', 'string', 'you have the choice', 'callback', 'disp(''radiobutton pushed'')'}, ...
%     {'Style', 'pushbutton', 'string', 'pushme', 'callback', 'disp(''button pushed'')'}, ...
%     {'Style', 'edit', 'string', 'PLEASE PRESS [Ok]', 'callback', 'disp(''textfield complains'')'} };
% geomvert = [4 1]; % first row is 4 units high and second row 1 unit
% 
% outparam = inputgui('geometry', geometry, 'uilist', uilist, 'geomvert', geomvert);
% 
% if ~near(size(outparam), [1,2]) ...
%         || ~isnumeric(outparam{1}) ...
%         || ~(near(outparam{1}, 0) || near(outparam{1}, 1)) ...
%         || ~ischar(outparam{2})
%     error('EEGLAB:unittesting', 'error in inputgui(): incorrect output.');
% end;

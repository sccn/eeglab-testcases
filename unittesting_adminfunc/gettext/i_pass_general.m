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

% ?? user cantrol

% function i_pass_general()
% 
%     % this test cannot run without user control
% 
%         label1 = 'TESTCASE FOR "gettext"';
%         label2 = 'please type in the next line and press [Return] (<-'')';
%         label3 = '';
%         label4 = 'test';
% 
%         cout = label4;
% 
%         rout = gettext(label1, label2, label3, label4);
% 
%         if isempty(rout)
%             if size(rout) == [1 0]
%                 disp('You pressed Return without entering a text');
%             elseif size(rout) == [0 0]
%                 disp('You pressed Cancel');
%             end;
%             passed = tc_notvalidated;
%         elseif near(cout, rout)
%             passed = tc_passed;
%         else
%             passed = tc_notvalidated;
%         end;
% 

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

% argument ''frames'' is invalid (should be 5)
% passed if invalid argument is ignored and correct result returned
% passed if error
% not passed if invalid argument is ignored and wrong result returned

% function passed = fail_invalid_frames()
%     passed = tc_notpassed;
%     try
%         data = [ [2 1 3 5 4];...
%                  [8 2 6 7 1] ];
% 
%         [amps, frames, signs] = abspeak(data, 6);
% 
%     catch % passed if error
% 	if thrown_by_eeglab
%             passed = tc_passed;
% 	end;
%     end;
% end

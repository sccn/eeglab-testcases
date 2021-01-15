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

function passed = pass_matrix()
    passed = tc_notpassed;
    try
        a = [ [ 1  2  3]; ...
              [ 4  5  6] ];
        b = [ [ 6  7  8]; ...
              [ 9 10 11] ];
        factor = 2;
        % *2  | 2  4  6   8 10 12
        %   d | 6  7  8   9 10 11
        %     |--------  --------
        %   = | 4  3  2   1  0  1
        % min:       ^^     ^^
        % mean([2,0])==1

        cmindiff = 1;

        rmindiff = eventalign(factor, a, b);

        if near(cmindiff, rmindiff)
            passed = tc_passed;
        end;
    catch % not passed on error
    end;
end

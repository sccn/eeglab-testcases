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

function passed = fail_trial_div()
    passed = tc_notpassed;
    try
        data = [ [ 21 24 25 28 31 37 ]; ... % <--
                 [ 22 25 26 29 32 38 ]; ... % <-- data
                 [ 23 26 27 30 33 39 ]; ... % <--
                 [ 24 27 28 31 34 40 ] ];   % <--
        sortvar = [ 1 2 3 4 5 ]; % "5" does not divide number of data elements

        erpimage(data, sortvar);
        passed = tc_passed; %should throw error and not return!

    catch % not passed on error
        if thrown_by_eeglab
            passed = tc_passed;
        else
            passed = tc_notpassed;
        end;
    end;
end

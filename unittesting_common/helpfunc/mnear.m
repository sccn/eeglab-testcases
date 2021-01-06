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
%
% this function checks if 2 arrays are equal using the more tolerant epsilon value
% the function should only be used on optimizing-problems, such as PCA, ICA, kMEANs and so on

function result = mnear(arg1, arg2)
    result = 0;

    if xor(isempty(arg1), isempty(arg2)) % 1 empty, the other not
        return;
    end;
    
    if isnumeric(arg1) && isnumeric(arg2)
        if all(all( ...
                      ((arg1-tc_tepsilon <= arg2) & (arg2 <= arg1+tc_tepsilon)) ...
                    | (isnan(arg1) & isnan(arg2)) ...
                  )) % workaround because Inf-Inf => NaN
            result = 1;
        end;
    else
        if isequal(arg1, arg2)
            result = 1;
        end;
    end;


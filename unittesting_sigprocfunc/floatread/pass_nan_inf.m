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

function pass_nan_inf()

        % ieee has 2x NaN, +0 and -0
        correct = [ [ NaN -Inf ]; ...
                    [ NaN +Inf ]; ...
                    [ NaN    0 ]; ...
                    [ NaN    0 ] ];
        % ieee-754 format:
        % in file (binary):
        %  s exponent        fraction
        % |1|----8---|----------23-----------|  = 32 bits
        %
        %  1 11111111 00000000000000000000001   = -SNaN
        %  0 11111111 00000000000000000000001   = +SNaN
        %  1 11111111 10000000000000000000001   = -QNaN
        %  0 11111111 10000000000000000000001   = +QNaN
        %  1 11111111 00000000000000000000000   = -Inf
        %  0 11111111 00000000000000000000000   = +Inf
        %  1 00000000 00000000000000000000000   = -0
        %  0 00000000 00000000000000000000000   = +0
        %
        %              sign                  exponent-127
        % number = (-1)     *  1.fraction * 2

        result = floatread('pass_nan_inf.fdt', [4 2], 'ieee-be');

        if ~near( correct, result)
            error('EEGLAB:unitesting', 'Error in floatread(): incorrect result.');
        end;


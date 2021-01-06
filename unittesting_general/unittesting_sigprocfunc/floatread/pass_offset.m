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

function pass_offset()

        fname = 'pass_offset.fdt';
        size = [2 2];
        format = 'ieee-be';
        offset = {[2 3], [1 2]}; % original data is 2x3, begin at [1 2]
        % 
        %   | 1 2 3
        % --+------
        % 1 | x y y
        % 2 | x y y
        % 
    
        correct = [ [ 7.89 3.45 ]; ...
                    [ 0.12 6.78 ] ];

        % ieee-754 format:
        % in file (binary):
        %  s exponent        fraction
        % |1|----8---|----------23-----------|  = 32 bits
        %
        %  0 01111111 00111010111000010100011 = 3F9D70A3 = 1.23
        %  0 10000001 00100011110101110000101 = 4091EB85 = 4.56
        %  0 10000001 11111000111101011100001 = 40FC7AE1 = 7.89
        %  0 01111011 11101011100001010001111 = 3DF5C28F = 0.12
        %  0 10000000 10111001100110011001100 = 405CCCCC = 3.45
        %  0 10000001 10110001111010111000010 = 40D8F5C2 = 6.78
        %
        %              sign                  exponent-127
        % number = (-1)     *  1.fraction * 2

        result = floatread(fname, size, format, offset);

       if ~near( correct, result)
            error('EEGLAB:unitesting', 'Error in floatread(): incorrect result.');
        end;


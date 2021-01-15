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

function pass_native()

        fname = 'pass_native.fdt';
%          format = 'native';
        data = [ [ 1.23 0.12 ]; ...
                 [ 4.56 3.45 ]; ...
                 [ 7.89 6.78 ] ];

        correct = [ ['3F'];['9D'];['70'];['A3']; ...
                    ['40'];['91'];['EB'];['85']; ...
                    ['40'];['FC'];['7A'];['E1']; ...
                    ['3D'];['F5'];['C2'];['8F']; ...
                    ['40'];['5C'];['CC'];['CC']; ...
                    ['40'];['D8'];['F5'];['C2'] ];
        ccount = 6*4;
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

        % delete output file
        if exist(fname, 'file')
            if ismatlab, oldstate = recycle('off'); end;
            delete(fname);
            if ismatlab, recycle(oldstate); end;
        end;

        floatwrite(data, fname);

        FID = fopen(fname, 'r');
        [inbytes, rcount] = fread(FID, 6*4);
        fclose(FID);
        result = dec2hex(inbytes, 2);

        % delete output file
        if exist(fname, 'file')
            if ismatlab, oldstate = recycle('off'); end;
            delete(fname);
            if ismatlab, recycle(oldstate); end;
            % was a file created in the test?
            rexist = 1;
        else
            % was a file created in the test?
            rexist = 0;
        end;

        % last hex digit is not significant (small rounding errors)
        % so a maximum of 4 hex digits can be different
        % sorting is used because system can be little endian or big endian
        % which changes the order of bytes: 01 02 03 04 05 06 07 08
        %                          becomes: 04 03 02 01 08 07 06 05
        % number of values that are not equal must be <= 4
        if sum(any( sortrows(correct) ~= sortrows(result), 2 )) > 4 ...
        || ~near(ccount, rcount) ...
        || ~near(rexist, 1)
            error('EEGLAB:unittesting', 'Error in floatwrite(): incorrect result.');
        end;



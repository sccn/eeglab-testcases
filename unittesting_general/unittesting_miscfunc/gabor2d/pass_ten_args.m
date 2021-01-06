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

function pass_ten_args()
        rows = 50;
        cols = 40;
        freq = 20;
        angle = 0;
        sigmaR = rows / 5;
        sigmaC = cols / 5;
        meanR = (rows+1) / 2;
        meanC = (cols+1) / 2;
        dephase = 0;
        cut = 0;

        cmax = 1; % 0.5152 with gabor2d(2, 2)
        cmin = -1; % -0.5152 with gabor2d(2, 2)
        cupnum = 3;
        cdownnum = 4;

        rmatrix = gabor2d(rows, cols, freq, angle, sigmaR, sigmaC, meanR, meanC, dephase, cut);


        rupnum = zeros(cols, 1);
        rdownnum = zeros(cols, 1);
        for x = 1:cols
            status = 1;
            for y = 2:rows
                if status == 1
                    if rmatrix(y, x) < rmatrix(y-1, x)
                        status = -1;
                        rdownnum(x) = rdownnum(x) + 1;
                    end;
                else
                    if rmatrix(y, x) > rmatrix(y-1, x)
                        status = 1;
                        rupnum(x) = rupnum(x) + 1;
                    end;
                end;
            end;
        end;

%         if ~any(any(rmatrix ~= 0)) ... % not all zero
%         || ~all(all(rmatrix >= cmin)) ... % in min/max range
%         || ~all(all(rmatrix <= cmax)) ...
%         || ~near(cupnum, rupnum) ... % numbers going up
%         || ~near(cdownnum, rdownnum) % and down
%             error('EEGLAB:unittesting', 'Error in gabor2d(): incorrect result');
%         end;



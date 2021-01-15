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

function pass_extended_noise20dB()

        num_runs = 1;

% http://www.sccn.ucsd.edu/%7Earno/indexica.html

        A = sin(linspace(0,50, 1000));   % A
        B = sin(linspace(0,37, 1000)+5); % B

        noise_dB = 20;
        diffA = max(A) - min(A);
        noiselevelA = 10^( log10(diffA) - noise_dB/20 );
        noiseA = noiselevelA * (rand(size(A))-0.5);
        diffB = max(B) - min(B);
        noiselevelB = 10^( log10(diffB) - noise_dB/20 );
        noiseB = noiselevelB * (rand(size(B))-0.5);

        A = A + noiseA;
        B = B + noiseB;

        M1 = A - 2*B;                  % mixing 1
        M2 = 1.73*A+3.41*B;            % mixing 2

        source = [ A; B ];
        data = [ M1; M2 ];

        % normalise to [-1; 1]
        newmin = -1;
        newmax = 1;
        minsource = min(source')' * ones(1,length(source));
        maxsource = max(source')' * ones(1,length(source));
        source = ((source - minsource) ./ (maxsource - minsource)) * (newmax - newmin) + newmin;

        all_maxdiffs = -1 * ones(1, num_runs); % -1 => internal_error as standard value

        for run = 1:num_runs
            [rweights, rsphere] = runica( data, 'extended', 1 );

            datamean = mean(data,2);
            demixed = icaact(data, rweights*rsphere, datamean);

            % normalise to [-1; 1]
            mindemixed = min(demixed')' * ones(1,length(demixed));
            maxdemixed = max(demixed')' * ones(1,length(demixed));
            demixed = ((demixed - mindemixed) ./ (maxdemixed - mindemixed)) * (newmax - newmin) + newmin;

            % find highest difference between source data and demixed data
            % inverting channel data (max3-8)
            % exchanging channels (max2,4,6,8)
            max1 = max(max(abs( source - [[ 1, 0];[ 0, 1]] * demixed ))); % max diff between source1, source2 and demixed1, demixed2
            max2 = max(max(abs( source - [[ 0, 1];[ 1, 0]] * demixed ))); % max diff between source1, source2 and demixed2, demixed1

            max3 = max(max(abs( source - [[-1, 0];[ 0, 1]] * demixed ))); % max diff between source1, source2 and inverted demixed1, normal demixed2
            max4 = max(max(abs( source - [[ 0,-1];[ 1, 0]] * demixed ))); % max diff between source1, source2 and inverted demixed2, normal demixed1

            max5 = max(max(abs( source - [[ 1, 0];[ 0,-1]] * demixed ))); % max diff between source1, source2 and normal demixed1, inverted demixed2
            max6 = max(max(abs( source - [[ 0, 1];[-1, 0]] * demixed ))); % max diff between source1, source2 and normal demixed2, inverted demixed1

            max7 = max(max(abs( source - [[-1, 0];[ 0,-1]] * demixed ))); % max diff between source1, source2 and inverted demixed1, inverted demixed2
            max8 = max(max(abs( source - [[ 0,-1];[-1, 0]] * demixed ))); % max diff between source1, source2 and inverted demixed2, inverted demixed1

            % lowest maximum difference was using correct transformation
            [maxdiff, minmaxmethod] = min([max1, max2, max3, max4, max5, max6, max7, max8]);
            all_maxdiffs(run) = maxdiff;

%              switch minmaxmethod
%                  case 1, transform = [[ 1, 0];[ 0, 1]];
%                  case 2, transform = [[ 0, 1];[ 1, 0]];
%                  case 3, transform = [[-1, 0];[ 0, 1]];
%                  case 4, transform = [[ 0,-1];[ 1, 0]];
%                  case 5, transform = [[ 1, 0];[ 0,-1]];
%                  case 6, transform = [[ 0, 1];[-1, 0]];
%                  case 7, transform = [[-1, 0];[ 0,-1]];
%                  case 8, transform = [[ 0,-1];[-1, 0]];
%                  otherwise, transform = eye(2,2);
%              end;
        end;

        all_sorted_maxdiffs = sort(all_maxdiffs);

        if all(all_sorted_maxdiffs >= 0)
            if all_sorted_maxdiffs(ceil(num_runs/2)) < (tc_icaepsilon + (max([noiselevelA, noiselevelB]))/2) % noise cannot be reconstructed
            else
                error('EEGLAB:unittesting', 'Error in runica()');
            end;

        end;


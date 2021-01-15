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

function pass_camera()
return; % there is a problem with getframe in Matlab 7.11+

    %%%%%%%
    % set variables
    %%%%%%%

        spline_file = 'test.spline';
        elec_loc = 'test.locs';
        data = [ [ 1 0 0 0 ]; ...
                 [ 0 1 0 0 ]; ...
                 [ 0 0 1 0 ]; ...
                 [ 0 0 0 1 ]; ...
                 [ 0 0 0 0 ]; ...
                 [ 0 0 0 0 ]; ...
                 [ 0 0 0 0 ]; ...
                 [ 0 0 0 0 ]; ...
                 [ 0 0 0 0 ] ];
        srate = 1;
        title = 'testcase';
        camerapath = [-127 20 30 0];

    %%%%%%%
    % delete output file
    %%%%%%%

        if exist(spline_file, 'file')
            oldstate = recycle('off');
            delete(spline_file);
            recycle(oldstate);
        end;


    %%%%%%%
    % call headplot -> spline_file
    %%%%%%%

        headplot('setup', elec_loc, spline_file)
        % was a file created in the test?
        if ~exist(spline_file, 'file')
            error('EEGLAB:unittesting','Error in headmovie(): headmovie: initialisation error (spline_file does not exist)');
        end;



    %%%%%%%
    % call headmovie (main test)
    %%%%%%%

        % Movie: movieframes * width * height * numcolors

        [rMovie, rColormap, rminc, rmaxc] = headmovie(data, elec_loc, spline_file, srate, title, camerapath);

        % not twice the same color (row), reordered -> i used for comparison
        [rColormapunique, i, j] = unique(rColormap, 'rows');

        %TODO: more detailed test if rMovie is correct
        if ~all(all(rColormap <= 1)) || ~all(all(rColormap >= 0)) ...
        || ~near(rColormapunique, rColormap(i,:)) ...
        || ~all(all(all([rMovie.cdata] <= 255))) || ~all(all(all([rMovie.cdata] >= 0)))
            error('EEGLAB:unittesting', 'Error in headmovie().');
        end;


    %%%%%%%
    % delete spline_file
    %%%%%%%

        % delete output file
        if exist(spline_file, 'file')
            oldstate = recycle('off');
            delete(spline_file);
            recycle(oldstate);
        end;
close all;

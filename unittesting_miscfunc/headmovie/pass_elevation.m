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

function passed = pass_elevation()
    passed = tc_notpassed;
    % for description see block "main test"
    %%%%%%%
    % load dipfit plugin
    %%%%%%%
    try
        dipfitPath = tc_getPluginDir('dipfit');
        if strcmp(dipfitPath, '')
            disp('headmovie: initialisation error (tried to load dipfit plugin)');
            passed = tc_nottested;
            return;
        end;
        if isempty(findstr(path, dipfitPath))
            addpath(dipfitPath);
        end;
    catch
        disp('headmovie: initialisation error (tried to load dipfit plugin)');
        passed = tc_nottested;
        return;
    end;

    %%%%%%%
    % set variables
    %%%%%%%
    try
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
        camerapath = [-127 0 30 40];
    catch
        disp('headmovie: initialisation error (tried to set variables)');
        passed = tc_nottested;
        return;
    end;

    %%%%%%%
    % delete output file
    %%%%%%%
    try
        if exist(spline_file, 'file')
            oldstate = recycle('off');
            delete(spline_file);
            recycle(oldstate);
        end;
    catch
        disp('headmovie: initialisation error (tried to delete output file)');
        passed = tc_nottested;
        return;
    end;

    %%%%%%%
    % call headplot -> spline_file
    %%%%%%%
    try
        headplot('setup', elec_loc, spline_file)
        % was a file created in the test?
        if ~exist(spline_file, 'file')
            error('headmovie: initialisation error (spline_file does not exist)');
        end;
    catch
        disp('headmovie: initialisation error, see headplot tests');
        passed = tc_nottested;
        return;
    end;


    %%%%%%%
    % call headmovie (main test)
    %%%%%%%
    try

        % Movie: movieframes * width * height * numcolors

        [rMovie, rColormap, rminc, rmaxc] = headmovie(data, elec_loc, spline_file, srate, title, camerapath);

        % not twice the same color (row), reordered -> i used for comparison
        [rColormapunique, i, j] = unique(rColormap, 'rows');

        %TODO: more detailed test if rMovie is correct
        if all(all(rColormap <= 1)) && all(all(rColormap >= 0)) ...
        && near(rColormapunique, rColormap(i,:)) ...
        && all(all(all([rMovie.cdata] <= 255))) && all(all(all([rMovie.cdata] >= 0)))
            %%% the warning "elevation out of range" can not be tested
            %%% possible solution: horiz=-horiz; elev=180-elev;
            passed = tc_notvalidated;
        end;
    catch
        disp('headmovie: validation error');
        passed = tc_notpassed;
        return;
    end;

    %%%%%%%
    % delete spline_file
    %%%%%%%
    try
        % delete output file
        if exist(spline_file, 'file')
            oldstate = recycle('off');
            delete(spline_file);
            recycle(oldstate);
        end;
    catch
        disp('headmovie: cleanup error (tried to delete output file)');
    end;

end

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
% this function returns the path of the plugin given as argument 1
%
% usage: path = tc_getPluginDir('dipfit');

function path = tc_getPluginDir(namePlugin)
    path = '';

    % find out where we are
    testPath = which('tc_getPluginDir');
    testPath = testPath(1:end-length('helperfun/tc_getPluginDir.m')); % get script directory
    % find out where the eeglab-directory is
    eeglabPath = fileparts(which('eeglab'));
    pluginPath = fullfile(eeglabPath, 'plugins');

    contents = dir(pluginPath);
    numPlugins = 0;
    for cnt = 1:length(contents)
        if strfind(contents(cnt).name, namePlugin)
            numPlugins = numPlugins + 1;
            if strcmp(path, '')
                path = fullfile(pluginPath, contents(cnt).name);
            end;
        end;
    end;
    if numPlugins ~= 1
        disp(sprintf('Warning(tc_getPluginDir): %d plugins found for \"%s\"', numPlugins, namePlugin));
    end;
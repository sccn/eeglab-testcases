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

% help2html has the same name to the function in MATLAB! 

% function pass_general()
%     % EEGLab 5.03:
%     % the link to the output file is wrong
%     % it always ends in '.html'
%     % although the real file has a different extension
% 
%     %%%%%%%
%     % set variables
%     %%%%%%%
% 
%         output_file = 'test.htm';
%         input_file = 'test.dat';
% 
% 
%     %%%%%%%
%     % delete output file
%     %%%%%%%
% 
%         if exist(output_file, 'file')
%             oldstate = recycle('off');
%             delete(output_file);
%             recycle(oldstate);
%         end;
% 
%     %%%%%%%
%     % call help2html (main test)
%     %%%%%%%
% 
%         [rfileout, rlinktext] = help2html(input_file, output_file);
%         % was a file created in the test?
%         if ~exist(output_file, 'file')
%             error('EEGLAB:unittesting','Error in help2html(): execution error (output_file does not exist)');
%         end;
% 
%     %%%%%%%
%     % test output
%     %%%%%%%
% 
%         % EEGLab 5.03:
%         % the link to the output file is wrong
%         % it always ends in '.html'
%         % although the real file has a different extension
%         clinktext = {'filein', 'fileout', '''header''', '''footer''', ...
%                      '''refcall''', '''font''', '''background''', '''outputlink''', ...
%                      '''outputtext''', '''outputonly''', 'fileout', 'linktext'};
% 
%        
% 
% 
%     %%%%%%%
%     % delete output_file
%     %%%%%%%
%         % delete output file
%         if exist(output_file, 'file')
%             oldstate = recycle('off');
%             delete(output_file);
%             recycle(oldstate);
%         end;


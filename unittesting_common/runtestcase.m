% run test cases for EEGLAB
%
% Arnaud Delorme - August 8, 2009
% -------------------------------
function errlist = runtestcase(file, exclude_list, prompt)

errlist = [];
count   = 1;
if isstruct(file) || exist(file) == 7
    % if it is a folder, scan content and evaluate
    if ~isstruct(file)
        foldercontent = dir(file);
    else
        foldercontent = file;
    end
    for index = 1:length(foldercontent)
        if ~isequal(foldercontent(index).name(1), '.')
            %fprintf('Recursing %s...\n', fullfile(file, foldercontent(index).name));
            errlisttmp = runtestcase(fullfile(foldercontent(index).folder, foldercontent(index).name), exclude_list, prompt);
            
            % process error
            if ~isempty(errlisttmp)
                if isempty(errlist), errlist        = errlisttmp;
                else                 errlist        = [errlist errlisttmp];
                end
                count = count+length(errlisttmp);
            end
        end
    end
else
    % if it is a Matlab file, simply evaluate it
    [filename, ~, ext] = fileparts(file);
    [~, filename] = fileparts(filename);
    if length(file) > 2 && ( strcmpi(ext, '.mlx') || strcmpi(ext, '.m') ) && isempty(findstr('runlocal.m', file)) ...
            && isempty(findstr('unittesting_common', file)) && isempty(find(strcmp(filename, exclude_list) == 1))
        fprintf('Evaluating %s ', file);
        oldfold = pwd;
        [newfolder, funcname, ext] = fileparts(file);
        if ispc
            try
                cd(newfolder);
                save('-mat', 'C:\Users\labadmin\AppData\Local\Temp\workspace.mat', 'file', 'oldfold'); % save vars for script which use clear
                eval( [ funcname ';' ] );
            catch
                load('-mat',  'C:\Users\labadmin\AppData\Local\Temp\workspace.mat');
                errlist.function = file;
                errlist.errmsg   = lasterror;
                save('-mat', 'C:\Users\labadmin\AppData\Local\Temp\workspace.mat');
            end
            load('-mat',  'C:\Users\labadmin\AppData\Local\Temp\workspace.mat');
        else
            try
                cd(newfolder);
                save('-mat', '/tmp/workspace.mat', 'file', 'oldfold'); % save vars for script which use clear
                eval( [ funcname ';' ] );
            catch
                load('-mat',  '/tmp/workspace.mat');
                errlist.function = file;
                errlist.errmsg   = lasterror;
                save('-mat', '/tmp/workspace.mat');
            end
            load('-mat',  '/tmp/workspace.mat');
        end
        cd(oldfold);
        fprintf('\n');
        if nargin > 2 && prompt == 1
            t = input('Press enter to continue', 's');
        end
    elseif ~isempty(find(strcmp(filename, exclude_list) == 1))
        fprintf('Skipping %s\n', file);
        if nargin > 2 && prompt == 1
            t = input('Press enter to continue', 's');
        end
    end
end

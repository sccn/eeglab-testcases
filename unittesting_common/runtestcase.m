% run test cases for EEGLAB
%
% Arnaud Delorme - August 8, 2009
% -------------------------------
function errlist = runtestcase(file, exclude_list, prompt)

errlist = [];
count   = 1;
if ~isstruct(file)
    error('Not a structure');
end
if length(file) > 1
    for index = 1:length(file)
        if ~isequal(file(index).name(1), '.')
            %fprintf('Recursing %s...\n', fullfile(file, foldercontent(index).name));
            errlisttmp = runtestcase(file(index), exclude_list, prompt);
            
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
    % check if in the exclude list
    if any(strcmp(file.name, exclude_list))
        return;
    end
    
    if exist(fullfile(file.folder, file.name), 'dir')
        % if it is a folder, scan content and evaluate
        foldercontent = dir(fullfile(file.folder, file.name));
        [foldercontent(:).folder] = deal(fullfile(file.folder, file.name));
        errlist = runtestcase(foldercontent, exclude_list, prompt);
    else
        % if it is a Matlab file, simply evaluate it
        [~, funcname, ext] = fileparts(file.name);
        if strcmpi(ext, '.m') % || strcmpi(ext, '.mlx') % some MLX files have questdlg
            fprintf('Evaluating %s ', file.name);
            oldfold = pwd;

            % exectute function or script in subfunction to avoid having to
            % save variables (plus issue with collision when running multiple functions
            try
                cd(file.folder);
                execute_func(funcname);
            catch
                errlist.function = file.name;
                errlist.errmsg   = lasterror;
                pop_editoptions('option_memmapdata', 0);
            end

            cd(oldfold);
            fprintf('\n');
            if nargin > 2 && prompt == 1
                t = input('Press enter to continue', 's');
            end
        end
    end
end

function execute_func(funcname)
    eval( [ funcname ';' ] );

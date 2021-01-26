function formaterrorlist(error_list, fileName)

if nargin < 2
    fileName = 'error_list_formated.txt';
end

if isstr(error_list)
    load('-mat', error_list);
end

fid  = fopen(fileName, 'w');

if fid ~= -1
    % write octave info
    if ~ismatlab
        fprintf(fid, 'Runnning Octave!\n');
        fprintf(fid, '----------------\n');
    end
    
    % write option file
    % -----------------
    eeglab_options;
    options = { 'option_single' 'option_memmapdata' 'option_eegobject' 'option_computeica' 'option_donotusetoolboxes' };
    for ind =1:length(options)
        var = eval(options{ind});
        fprintf(fid, '%s = %d\n', options{ind}, var);
    end
    
    % write errors
    % ------------
    for index = 1:length(error_list)
        fprintf(fid, '*********************************************\n');
        fprintf(fid, 'function %s\n', error_list(index).function);
        fprintf(fid, '   msg %s\n'  , error_list(index).errmsg.message);
        fprintf('function %s\n', error_list(index).function);
        fprintf('   msg %s\n'  , error_list(index).errmsg.message);
        fprintf('*********************************************\n');
    end
    fclose(fid);
end

for index = 1:length(error_list)
    fprintf('function %s\n', error_list(index).function);
    fprintf('   msg %s\n'  , error_list(index).errmsg.message);
    fprintf('*********************************************\n');
end

% test_rmart
% 05/19/2010 roy
% case 1 failed -- no function 'isint()', see bug 848

function test_rmart
fid = fopen('test_data.floats', 'w');
data = [2 5 3 6 7 2 6 8 1 2;...
    6 1 10 234 3 5 464 3 2 5;
    1 1 1 1 3 5 1 1 4 5;
    4 23456 2 3 1 1 34 2 3 5;
    20 30 10 10 34 10 30 20 30 10];
count = fwrite(fid, data, 'float');
fclose(fid);
file1 = fullfile(pwd,'test_data.floats');
file2 = fullfile(pwd,'test_result.floats');
if count == 50
    rmart(file1, file2,5,[1:5],7);
    fid = fopen(file1);
    result = fread(fid, [5 10], 'float');
    if ~near(size(data), size(result))
        ME = MException('MATLAB:nargchk:notEnoughInputs', 'Sizes of output data and input data do not match!');
        throw(ME);
    end;
end;
delete test_data.floats;
delete test_result.floats;
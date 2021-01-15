% check writing
% -------------
clear global; clear; clear classes;
tmp = pascal(8); tmp(:,:,2) = tmp*2;
test = checkmmo_sub7(tmp);
tmp2 = test(:,:,:);
if ~isequal(tmp, tmp2);
    error('test 1, arrays should be equal');
end;
disp('Pass 1');

%% check if should be using the same copy of not in a subfunction
% ---------------------------------------------------------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
test = checkmmo_sub8(tmp); % check is internal

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(9,:) = 1; tmp2 = test(:,:,:);
tmp(9,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 3, arrays should be equal');
end;
disp('Pass 3');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(:,9) = 1; tmp2 = test(:,:,:);
tmp(:,9) = 1;
if ~isequal(tmp, tmp2);
    error('test 4, arrays should be equal');
end;
disp('Pass 4');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(9,9) = 1; tmp2 = test(:,:,:);
tmp(9,9) = 1;
if ~isequal(tmp, tmp2);
    error('test 5, arrays should be equal');
end;
disp('Pass 5');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(9:12,:,:) = 1; tmp2 = test(:,:,:);
tmp(9:12,:,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 6, arrays should be equal');
end;
disp('Pass 6');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(:,9,:) = 1; tmp2 = test(:,:,:);
tmp(:,9,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 7, arrays should be equal');
end;
disp('Pass 7');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(:,:,3) = 1; tmp2 = test(:,:,:);
tmp(:,:,3) = 1;
if ~isequal(tmp, tmp2);
    error('test 8, arrays should be equal');
end;
disp('Pass 8');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(:,9:10,3) = 1; tmp2 = test(:,:,:);
tmp(:,9:10,3) = 1;
if ~isequal(tmp, tmp2);
    error('test 9, arrays should be equal');
end;
disp('Pass 9');

%% check writing
% -------------
tmp = pascal(8); tmp(:,:,2) = tmp*2;
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(9,9:10,3) = 1; tmp2 = test(:,:,:);
tmp(9,9:10,3) = 1;
if ~isequal(tmp, tmp2);
    error('test 10, arrays should be equal');
end;
disp('Pass 10');

%% check writing
% -------------
tmp = pascal(8);
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(9,9:10) = 1; tmp2 = test(:,:,:);
tmp(9,9:10) = 1;
if ~isequal(tmp, tmp2);
    error('test 11, arrays should be equal');
end;
disp('Pass 11');

%% check writing
% -------------
tmp = pascal(8);
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(9,:) = 1; tmp2 = test(:,:,:);
tmp(9,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 12, arrays should be equal');
end;
disp('Pass 12');

%% check writing
% -------------
tmp = pascal(8);
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(:,9) = 1; tmp2 = test(:,:,:);
tmp(:,9) = 1;
if ~isequal(tmp, tmp2);
    error('test 13, arrays should be equal');
end;
disp('Pass 13');

%% check writing
% -------------
tmp = [1:10];
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(11) = 1; tmp2 = test(:,:,:);
tmp(11) = 1;
if ~isequal(tmp, tmp2);
    error('test 14, arrays should be equal');
end;
disp('Pass 14');

%% check writing
% -------------
tmp = [1:10]';
floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt' , size(tmp), true, false, true);
test(11) = 1; tmp2 = test(:,:,:);
tmp(11) = 1;
if ~isequal(tmp, tmp2);
    error('test 15, arrays should be equal');
end;
disp('Pass 15');


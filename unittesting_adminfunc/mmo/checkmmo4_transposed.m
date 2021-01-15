%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(9,:) = 1; tmp2 = test(:,:,:);
tmp(9,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 3, arrays should be equal');
end;
disp('Pass 1');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(9:12,:,:) = 1; tmp2 = test(:,:,:);
tmp(9:12,:,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 6, arrays should be equal');
end;
disp('Pass 2');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(:,9,:) = 1; tmp2 = test(:,:,:);
tmp(:,9,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 7, arrays should be equal');
end;
disp('Pass 3');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(:,:,3) = 1; tmp2 = test(:,:,:);
tmp(:,:,3) = 1;
if ~isequal(tmp, tmp2);
    error('test 8, arrays should be equal');
end;
disp('Pass 4');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(:,9:10,3) = 1; tmp2 = test(:,:,:);
tmp(:,9:10,3) = 1;
if ~isequal(tmp, tmp2);
    error('test 9, arrays should be equal');
end;
disp('Pass 5');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(9,9:10,3) = 1; tmp2 = test(:,:,:);
tmp(9,9:10,3) = 1;
if ~isequal(tmp, tmp2);
    error('test 10, arrays should be equal');
end;
disp('Pass 6');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; floatwrite(tmp', 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(9,9:10) = 1; tmp2 = test(:,:,:);
tmp(9,9:10) = 1;
if ~isequal(tmp, tmp2);
    error('test 11, arrays should be equal');
end;
disp('Pass 7');

%% check writing
% -------------
tmp = pascal(8); tmp(:,9) = 2; floatwrite(tmp', 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test = mmo('testfile.fdt' , size(tmp), true, true, true);
test(9,:) = 1; tmp2 = test(:,:,:);
tmp(9,:) = 1;
if ~isequal(tmp, tmp2);
    error('test 12, arrays should be equal');
end;
disp('Pass 8');

%% check writing
% -------------
tmp = pascal(8); tmp(:,1) = 2; floatwrite(tmp', 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test = mmo('testfile.fdt' , size(tmp), true, true, true);
test(:,9) = 1; tmp2 = test(:,:,:);
tmp(:,9) = 1;
if ~isequal(tmp, tmp2);
    error('test 13, arrays should be equal');
end;
disp('Pass 9');

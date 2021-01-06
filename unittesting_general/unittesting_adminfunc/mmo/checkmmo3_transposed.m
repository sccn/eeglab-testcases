%% check empty assigment copies
% ----------------------------
clear global; clear; clear classes;
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(:,:,1) = []; tmp2 = test(:,:,:);
tmp( :,:,1) = [];
if ~isequal(tmp, tmp2);
    error('test 1, arrays should be equal');
end;
disp('Pass 1');

%% --------------------
clear global; clear; clear classes;
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(:,:,2) = []; tmp2 = test(:,:,:);
tmp( :,:,2) = [];
if ~isequal(tmp, tmp2);
    error('test 2, arrays should be equal');
end;
disp('Pass 2');

%% --------------------
%clear global; clear; clear classes;
tmp = pascal(8); tmp(:,1) = 2; tmp(:,:,2) = tmp*2; 
transp_tmp = reshape(tmp(:,:,1)', [8 1 8]);
transp_tmp(:,2,:) = transp_tmp(:,1,:)*2;
floatwrite(transp_tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(4:5,:,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:,:) = [];
if ~isequal(tmp, tmp2);
    error('test 6, arrays should be equal');
end;
disp('Pass 3');

%% --------------------
%clear global; clear; clear classes;
tmp = pascal(8); tmp(:,1) = 2; floatwrite(tmp', 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(4:5,:,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:,:) = [];
if ~isequal(tmp, tmp2);
    error('test 9, arrays should be equal');
end;
disp('Pass 4');

%% --------------------
%clear global; clear; clear classes;
tmp = pascal(8); tmp(:,1) = 2; floatwrite(tmp', 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(4:5,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:) = [];
if ~isequal(tmp, tmp2);
    error('test 10, arrays should be equal');
end;
disp('Pass 5');

%% --------------------
clear global; clear; clear classes;
tmp = pascal(8); tmp(:,1) = 2; floatwrite(tmp', 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, true, true);
test(:,4:5) = []; tmp2 = test(:,:,:);
tmp( :,4:5) = [];
if ~isequal(tmp, tmp2);
    error('test 12, arrays should be equal');
end;
disp('Pass 6');

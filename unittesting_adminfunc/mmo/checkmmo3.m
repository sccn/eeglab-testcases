% check empty assigment copies
% ----------------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(:,:,1) = []; tmp2 = test(:,:,:);
tmp( :,:,1) = [];
if ~isequal(tmp, tmp2);
    error('test 1, arrays should be equal');
end;
disp('Pass 1');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(:,:,2) = []; tmp2 = test(:,:,:);
tmp( :,:,2) = [];
if ~isequal(tmp, tmp2);
    error('test 2, arrays should be equal');
end;
disp('Pass 2');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(:,2) = []; tmp2 = test(:,:,:);
tmp( :,2) = [];
if ~isequal(tmp, tmp2);
    error('test 3, arrays should be equal');
end;
disp('Pass 3');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(:,12) = []; tmp2 = test(:,:,:);
tmp( :,12) = [];
if ~isequal(tmp, tmp2);
    error('test 4, arrays should be equal');
end;
disp('Pass 4');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(4:5,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:) = [];
if ~isequal(tmp, tmp2);
    error('test 5, arrays should be equal');
end;
disp('Pass 5');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(4:5,:,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:,:) = [];
if ~isequal(tmp, tmp2);
    error('test 6, arrays should be equal');
end;
disp('Pass 6');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(4:5) = []; tmp2 = test(:,:,:);
tmp( 4:5) = [];
if ~isequal(tmp, tmp2);
    error('test 7, arrays should be equal');
end;
disp('Pass 7');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); tmp(:,:,2) = tmp*2; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8 2],  true, false, true);
test(73:83) = []; tmp2 = test(:,:,:);
tmp( 73:83) = [];
if ~isequal(tmp, tmp2);
    error('test 8, arrays should be equal');
end;
disp('Pass 8');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8],  true, false, true);
test(4:5,:,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:,:) = [];
if ~isequal(tmp, tmp2);
    error('test 9, arrays should be equal');
end;
disp('Pass 9');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8],  true, false, true);
test(4:5,:) = []; tmp2 = test(:,:,:);
tmp( 4:5,:) = [];
if ~isequal(tmp, tmp2);
    error('test 10, arrays should be equal');
end;
disp('Pass 10');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8],  true, false, true);
test(:,4:5,:,:) = []; tmp2 = test(:,:,:);
tmp( :,4:5,:,:) = [];
if ~isequal(tmp, tmp2);
    error('test 11, arrays should be equal');
end;
disp('Pass 11');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8],  true, false, true);
test(:,4:5) = []; tmp2 = test(:,:,:);
tmp( :,4:5) = [];
if ~isequal(tmp, tmp2);
    error('test 12, arrays should be equal');
end;
disp('Pass 12');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8],  true, false, true);
test(4) = []; tmp2 = test(:,:,:);
tmp( 4) = [];
if ~isequal(tmp, tmp2);
    error('test 13, arrays should be equal');
end;
disp('Pass 13');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', [8 8],  true, false, true);
test(63) = []; tmp2 = test(:,:,:);
tmp( 63) = [];
if ~isequal(tmp, tmp2);
    error('test 14, arrays should be equal');
end;
disp('Pass 14');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = [1:10]; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, false, true);
test([4 7]) = []; tmp2 = test(:,:,:);
tmp( [4 7]) = [];
if ~isequal(tmp, tmp2);
    error('test 15, arrays should be equal');
end;
disp('Pass 15');

%% --------------------
warning off; clear global; clear; clear classes; warning on;
tmp = [1:10]'; floatwrite(tmp, 'testfile.fdt'); test = mmo('testfile.fdt', size(tmp),  true, false, true);
test([4 7]) = []; tmp2 = test(:,:,:);
tmp( [4 7]) = [];
if ~isequal(tmp, tmp2);
    error('test 16, arrays should be equal');
end;
disp('Pass 16');



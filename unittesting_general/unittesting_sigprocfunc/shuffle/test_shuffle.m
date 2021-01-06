% test_shuffle
% 05/24/2010 roy
% case 1..4 pass

function test_shuffle
%% - 2D
X = rand(32, 100);
%% case 1
[Y I J] = shuffle(X, 1);
if ~near(Y, X(I,:)) || ~near(Y(J,:), X)
    error('EEGLAB:unittesting', 'The result index are incorrect.');
end;
%% case 2
[Y I J] = shuffle(X, 2);
if ~near(Y, X(:,I)) || ~near(Y(:,J), X)
    error('EEGLAB:unittesting', 'The result index are incorrect.');
end;
%% - 3D
X = rand(32, 80, 100);
%% case 3
[Y I J] = shuffle(X, 2);
if ~near(Y, X(:, I ,:)) || ~near(Y(:, J,:), X)
   error('EEGLAB:unittesting', 'The result index are incorrect.');
end;
%% case 4
X = rand(32, 80, 100);
[Y I J] = shuffle(X, 3);
if ~near(Y, X(:, :, I)) || ~near(Y(:, :, J), X)
   error('EEGLAB:unittesting', 'The result index are incorrect.');;
end;
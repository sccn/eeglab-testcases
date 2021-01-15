% test_shortread
% 05/19/2010 roy
% case 1...5 pass

function test_shortread
data = fix(rand(200, 10000)*100);
fid = fopen('test_short', 'w');
fwrite(fid, data, 'short');
fclose(fid);

%% case 1
Size = [200, 10000];
A = shortread('test_short',Size,[],0);
if ~near(size(A), Size)
    error('EEGLAB:unittesting', 'Error in shortread(): The size of the output matrix is incorrect.');
end;

%% case 2
Size = [200, inf];
A = shortread('test_short',Size,[],0);
if ~near(size(A), [200, 10000])
    error('EEGLAB:unittesting', 'Error in shortread(): The size of the output matrix is incorrect.');
end;

%% case 3
Size = [100 10];
A = shortread('test_short',Size,[],0);
if ~near(size(A), Size)
    error('EEGLAB:unittesting', 'Error in shortread(): The size of the output matrix is incorrect.');
end;

%% case 4
Size = [100, 10];
A = shortread('test_short',Size,[],1999000);
if ~near(size(A), Size)
    error('EEGLAB:unittesting', 'Error in shortread(): The size of the output matrix is incorrect.');
end;

%% case 5
Size = [20, inf];
A = shortread('test_short',Size,[],200);
if ~near(size(A), [20, 99990])
   error('EEGLAB:unittesting', 'Error in shortread(): The size of the output matrix is incorrect.');
end;

delete test_short
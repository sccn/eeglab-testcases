function test_pop_biosig_timerange
% Function to test and visualize continuity of data after partition it into
% 2 chunks. There was no error on loading the data from [0, 30] s and
% from [30, 60] s. The program just load the data from indexes [1, 7680] and
% for [7681, 15360] respectively. Here we show that by loading two
% partially overlapped chunks.
% BUG 1523 related

%----------------------------------------------------------------------
% Author: Ramon Martinez-Cancino
% Swartz Center for Computational Neurosciences, UCSD
% May 2014
%----------------------------------------------------------------------

[path,~,~] = fileparts(pwd)   ;                                                             % Getting current directory
path2data = [path filesep 'testfiles' filesep 'BDF' filesep '5038.edf'];                    % Path and name of data

% Display messages
display (' ');
display(['Loading: ' path2data  ' into 2 chuncks [0 30.5] and [30.5 60] s' ]);
display(' ');

% Loading data
EEG1 = pop_biosig(path2data, 'blockrange', [0 30]);
EEG2 = pop_biosig(path2data, 'blockrange', [29 60]);

% Checking continuity of data: Comparing overlapped chunks
if isequal( EEG1.data(1,end-255:end), EEG2.data(1,1:256))
    
     display('------------------------------------------'); 
     display('---------- EEG chunks fits well ----------'); 
     display('------------------------------------------'); 
     
     % Plot just the ovelapped chunks
     figure;
     subplot(2,1,1); imagesc(EEG1.data(1,end-255:end));
     title ('Overlapping of 2 EEG chunks','FontSize',14);
     ylabel('Chunk 1');
     subplot(2,1,2); imagesc(EEG2.data(1,1:256));
     ylabel('Chunk 2');
     grid on;
       
else
    error('check time entries');
end;
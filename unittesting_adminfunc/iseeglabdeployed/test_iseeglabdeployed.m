function test_iseeglabdeployed
val = iseeglabdeployed;
if val ~=0
    error('EEGLAB:unittesting', 'Error in iseeglabdeployed(): This should not be compile version.');
end;

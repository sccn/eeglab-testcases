function test_pop_erspparams
% Author: Ramon Martinez-Cancino UCSD/ SCCN,2018
%         Arnaud Delorme         UCSD/ SCCN,2018

% Read the sample study
readsamplestudy;

% Test for changing parameters
paramList =  {'timerange',   [-100 400];...
              'freqrange',   [2 60];...
              'ersplim',     [1 20];...
              'itclim',      [0 1];...
              'itclim',      [0 2];... % must fail
              'topotime',    100;...
              'topotime',    [100 200];...
              'topofreq',    10;...
              'topofreq',    [8 12];...
              'subbaseline', 'on';...
              'subbaseline', 'off';...
              'maskdata',    'on';...
              'maskdata',    'off'}; % if new parameter/test-case, add here.
          
errorflag = zeros(1,size(paramList,1));

for iParam =1:size(paramList,1)
    STUDY = pop_erspparams(STUDY,paramList{iParam,:});
    
    if ~isequal(STUDY.etc.erspparams.(paramList{iParam,1}),paramList{iParam,2})
        errorflag(iParam) = 1;
        display(['test_pop_erspparams: Testing parameter ''' paramList{iParam,1} ''' ... failed']);    
    else
        display(['test_pop_erspparams: Testing parameter ''' paramList{iParam,1} ''' ... passed']);
    end
end

% Creating error message
if any(errorflag)
    errtext = [];
    uniquefails = unique(paramList(find(errorflag)));
    for ierr = 1:length(uniquefails)
        errtext = [errtext uniquefails{ierr}];
         if ierr ~= length(uniquefails)
             errtext = [errtext ', '];
         end      
    end
error(['pop_erspparams issue wile setting parameter(s) '''  errtext ''' ']); 
end
end
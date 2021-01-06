function test_pop_statparams
% Author: Ramon Martinez-Cancino UCSD/ SCCN,2018
%         Arnaud Delorme         UCSD/ SCCN,2018

% Read the sample study
readsamplestudy;

%% Test for changing common parameters
paramList =  {'groupstats',   'on';...       % common stats start here
              'groupstats',   'off';...
              'condstats',    'on';...
              'condstats',    'off';...
              'singletrials', 'on';
              'singletrials', 'off';...
              'mode',         'eeglab';
              'mode',         'fieldtrip';... % common stats end here
              'method',   'param';...         % eeglab stats start here
              'method',   'perm';...
              'method',   'bootstrap';...
              'naccu',    2000;...
              'alpha',    0.5;...
              'mcorrect', 'fdr';...
              'mcorrect', 'holms';...
              'mcorrect', 'bonferoni';...
              'mcorrect', 'none';...             % eeglab stats end here
              'fieldtripmethod',  'analytic';... % Fieldtrip stats start here
              'fieldtripmethod',   'montecarlo';
              'fieldtripnaccu',    2000;...
              'fieldtripalpha',    0.5;...
              'fieldtripmcorrect', 'cluster';...
              'fieldtripmcorrect', 'max'
              'fieldtripmcorrect', 'fdr'
              'fieldtripmcorrect', 'holms'
              'fieldtripmcorrect', 'bonferoni'
              'fieldtripmcorrect', 'none';...
              'fieldtripclusterparam', [];...       % struct
              'fieldtripchannelneighbor', [];...    % struct
              'fieldtripchannelneighborparam', []}; % struct % if new parameter/test-case, add here.
         
errorflag = zeros(1,size(paramList,1));
for iParam =1:size(paramList,1)
    STUDY = pop_statparams(STUDY,paramList{iParam,:}); 
    if iParam >=1 && iParam<=8
        FieldtoTest = paramList{iParam,1};
    elseif iParam >=9 && iParam<=17
        FieldtoTest = ['eeglab.' paramList{iParam,1}];
    else
        FieldtoTest = ['fieldtrip.' paramList{iParam,1}(10:end)];
    end
        
    if ~isequal(eval(['STUDY.etc.statistics.' FieldtoTest]),paramList{iParam,2})
        errorflag(iParam) = 1;
        display(['test_pop_statparams: Testing parameter ''' paramList{iParam,1} ''' ... failed']);    
    else
        display(['test_pop_statparams: Testing parameter ''' paramList{iParam,1} ''' ... passed']);
    end
end
               
% Individial checkings
try
    pop_statparams(STUDY, 'default');
    errorflag(end+1) = 0;
catch
    errorflag(end+1) = 1;
end

% Creating error message
if any(errorflag)
    errtext = [];
    params = {paramList{:,1},'default'};
    uniquefails = unique(paramList(find(errorflag)));
    for ierr = 1:length(uniquefails)
        errtext = [errtext uniquefails{ierr}];
         if ierr ~= length(uniquefails)
             errtext = [errtext ', '];
         end      
    end
error(['pop_statparams issue wile setting parameter(s) '''  errtext ''' ']); 
end
end
function test_loc_subsets

eeglab_p = fileparts(which('eeglab.m'));
filelocs = fullfile(eeglab_p, 'sample_locs', 'GSN256.sfp');
locs = pop_readlocs(filelocs);

if license('test', 'statistics_toolbox') && ...
        license('checkout', 'statistics_toolbox') && exist('pdist')
    subset = loc_subsets(locs, [32 60 100], true, true);
    close;
    close;
    subset = loc_subsets(locs, [32 60 100], true, true, {[1:10] [20:30]});
    close;
    close;
end;

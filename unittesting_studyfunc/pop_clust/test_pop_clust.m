function test_pop_clust;

readsamplestudy;
[STUDY] = pop_clust(STUDY, ALLEEG, 'algorithm','kmeanscluster','clus_num',  10 );

if license('checkout', 'statistics_toolbox') && exist('kmean')
    [STUDY] = pop_clust(STUDY, ALLEEG, 'algorithm','kmeans','clus_num',  10 , 'outliers',  3 );
end;

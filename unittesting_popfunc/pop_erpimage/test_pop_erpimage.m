function test_pop_erpimage;

readepochsamplefile;
c = 1; 

figure; pop_erpimage(EEG,1, [27],[],'POz',0,1,{},[],'' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar'); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{},[],'' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar'); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{ 'rt'},[],'latency' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar'); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{},[],'position' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar','renorm', 'yes'); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{ 'rt'},[],'position' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar','renorm', 'yes'); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{ 'rt'},[],'position' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar','renorm', '100*x'); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{},[],'' ,'topo', { 27 EEG.chanlocs } ,'erp','cbar','phasesort',[0 50 10] ); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{},[],'' ,'topo', { 27 EEG.chanlocs } ,'erp','limits',[-200 1000 NaN NaN NaN NaN NaN NaN] ,'cbar','phasesort',[0 50 9 11] ,'coher',[9 11 0.01] ); if c, close; end;
figure; pop_erpimage(EEG,1, [27],[],'POz',10,1,{ 'rt'},[],'latency' ,'topo', { 27 EEG.chanlocs } ,'erp','limits',[-500 1500 NaN NaN -3 3 NaN NaN] ,'cbar','phasesort',[0 50 9 11] ,'plotamps','coher',[9 11 0.01] ,'spec', [2 50],'vert', [500]); if c, close; end;

figure; pop_erpimage(EEG,0, [6],[],'Comp. 6',10,1,{ 'rt'},[],'latency' ,'yerplabel','','topo', { EEG.icawinv(:,6) EEG.chanlocs } ,'erp','limits',[-300 500 NaN NaN NaN NaN NaN NaN] ,'cbar','phasesort',[-150 0 9 11] ,'coher',[9 11 0.01] ); if c, close; end;
figure; pop_erpimage(EEG,0, [6],[27],'Comp. 6 -> POz',10,1,{ 'rt'},[],'latency' ,'yerplabel','','topo', { EEG.icawinv(:,6) EEG.chanlocs } ,'erp','limits',[-300 500 NaN NaN NaN NaN NaN NaN] ,'cbar','phasesort',[-150 0 9 11] ,'coher',[9 11 0.01] ); if c, close; end;

times = -250:1000/256:5000;
times = times(1:200);
figure;
sbplot(1,2,1); erpimage(randn(200,1000),randn(1,1000),times,'test phasesort',20,5,...
              'phasesort',[200 0 10],'erp','cbar','coher',[10]);
sbplot(1,2,2); erpimage(randn(200,1000),randn(1,1000),times,'test phasesort, allamps',20,5,...
              'phasesort',[200 0 10],'plotamps','erp','cbar',...
              'coher',[10 10 0.05]);
if c, close; end;
figure;erpimage(randn(100,100),-100:-1,-200:5:295,'',1,1,'plotamps','coher',[10,10,0.05]); if c, close; end;

% test auxilary variable
% -----------------------
auxvar = [[1:EEG.trials]'-200 [1:EEG.trials]'-400 [1:EEG.trials]'-600]; 
              % define all-negative 3-column auxvar size(3,EEG.trials)

figure
sbplot(2,3,1)
erpimage( EEG.data(1,:), ones(1, EEG.trials)*EEG.xmax*1000, ...
          linspace(EEG.xmin*1000,EEG.xmax*1000, EEG.pnts), ...
          'test auxvar', 10, 1 ,'topo', { 1 EEG.chanlocs } ,...
          'erp','cbar','auxvar',auxvar);

sbplot(2,3,2)
erpimage( EEG.data(1,:), ones(1, EEG.trials)*EEG.xmax*1000, ...
          linspace(EEG.xmin*1000,EEG.xmax*1000, EEG.pnts), ...
          'test auxvar (amp sort)', 10, 1 ,'topo', { 1 EEG.chanlocs } ,...
          'erp','cbar','auxvar',auxvar,'ampsort',[100,10,10 13]);

sbplot(2,3,3)
erpimage( EEG.data(1,:), ones(1, EEG.trials)*EEG.xmax*1000, ...
          linspace(EEG.xmin*1000,EEG.xmax*1000, EEG.pnts), ...
          'test auxvar (phase sort)', 10, 1 ,'topo', { 1 EEG.chanlocs } ,...
          'erp','cbar','auxvar',auxvar,'phasesort',[-100,20,10 11,30]);

sbplot(2,3,4)
erpimage( EEG.data(1,:), ones(1, EEG.trials)*EEG.xmax*1000, ...
          linspace(EEG.xmin*1000,EEG.xmax*1000, EEG.pnts), ...
          'test auxvar (amp sort)', 10, 1 ,'topo', { 1 EEG.chanlocs } ,...
          'erp','cbar','auxvar',auxvar,'ampsort',[100,10,10 13],'coher', [10 11, .01],'plotamps');
if c, close; end;

figure;
sbplot(1,3,1)
erpimage(squeeze(EEG.data(13,:,:)),1:EEG.trials,EEG.times,'ERP alone', ...
                                  1,1,'erp');
sbplot(1,3,2)
erpimage(squeeze(EEG.data(13,:,:)),1:EEG.trials,EEG.times,'ERP + plotamps', ...
                                  1,1,'erp','plotamps','coher',[8 12 .01]);
drawnow
sbplot(1,3,3)
erpimage(squeeze(EEG.data(13,:,:)),1:EEG.trials,EEG.times,'ERP + erpalpha + plotamps', ...
                                  1,1,'erpalpha',[.01],'plotamps','coher',[8 12 .01]);
drawnow
if c, close; end;

% test auxvar re-alignment
% ------------------------
a = rand(1000,100);
st1 = [1:1:100]+100;
st2 = [1:2:200]+200;
figure; erpimage(a, st1, linspace(-300,700, 1000), 'test', 10, 0, 'auxvar', st2); if c, close; end;
figure; erpimage(a, st1, linspace(-300,700, 1000), 'test', 10, 0, 'auxvar', st2, 'align', Inf); if c, close; end;


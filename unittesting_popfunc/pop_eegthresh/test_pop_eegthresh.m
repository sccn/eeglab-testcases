% test_mypop_eegthresh
% 04/01/2010 roy
% case 1...case 3
% ? need more possible input value
% ?? what is the second argument mean? - Yes
% 04/01/2010 roy
% Extent to 64 cases
function test_pop_eegthresh
%% case 1
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin, EEG.xmax, 0, 0);
%% case 2
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin, EEG.xmax, 0, 0);
%% case 3
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*1000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 0, 0);
%% case 4
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*1000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 0, 0);
%% case 5
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 6
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 7
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*1000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 8
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 9
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin, EEG.xmax, 0, 1);
%% case 10
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin, EEG.xmax, 0, 1);
%% case 11
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 0, 1);
%% case 12
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 0, 1);
%% case 13
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 14
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 15
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*1000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 16
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 17
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin, EEG.xmax, 1, 0);
%% case 18
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin, EEG.xmax, 1, 0);
%% case 19
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 1, 0);
%% case 20
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 1, 0);
%% case 21
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 22
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 23
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*1000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 24
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 25
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin, EEG.xmax, 1, 1);
%% case 26
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin, EEG.xmax, 1, 1);
%% case 27
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 1, 1);
%% case 28
readepochsamplefile; 
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 1, 1);
%% case 29
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [1:EEG.nbchan], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);
%% case 30
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 1, [], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);
%% case 31
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
Thresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);
%% case 32
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(EEG.nbchan);
Elements = Elements(1:EEG.nbchan/2);
LThresh = -1*rand(1,EEG.nbchan/2)*1000;
HThresh = rand(1,EEG.nbchan/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 1, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);

%% case 33
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:length(EEG.icachansind)], -100, 100, EEG.xmin, EEG.xmax, 0, 0);
%% case 34
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin, EEG.xmax, 0, 0);
%% case 35
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 0, 0);
%% case 36
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 0, 0);
%% case 37
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 38
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 39
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 40
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 0);
%% case 41
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin, EEG.xmax, 0, 1);
%% case 42
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin, EEG.xmax, 0, 1);
%% case 43
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 0, 1);
%% case 44
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 0, 1);
%% case 45
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 46
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 47
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 48
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 0, 1);
%% case 49
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin, EEG.xmax, 1, 0);
%% case 50
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin, EEG.xmax, 1, 0);
%% case 51
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 1, 0);
%% case 52
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 1, 0);
%% case 53
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 54
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 55
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 56
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 0);
%% case 57
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin, EEG.xmax, 1, 1);
%% case 58
readepochsamplefile;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin, EEG.xmax, 1, 1);
%% case 59
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin, EEG.xmax, 1, 1);
%% case 60
readepochsamplefile; 
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin, EEG.xmax, 1, 1);
%% case 61
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1:size(EEG.icaweights,1)], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);
%% case 62
readepochsamplefile;
Shift = (EEG.xmax-EEG.xmin)/10;
[EEG Indexes] = mypop_eegthresh(EEG, 0, [1], -100, 100, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);
%% case 63
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
Thresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, -1*Thresh, Thresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);
%% case 64
readepochsamplefile; 
Shift = (EEG.xmax-EEG.xmin)/10;
Elements = randperm(size(EEG.icaweights,1));
Elements = Elements(1:size(EEG.icaweights,1)/2);
LThresh = -1*rand(1,size(EEG.icaweights,1)/2)*1000;
HThresh = rand(1,size(EEG.icaweights,1)/2)*2000;
[EEG Indexes] = mypop_eegthresh(EEG, 0, Elements, LThresh, HThresh, EEG.xmin+Shift, EEG.xmax-Shift, 1, 1);

function [EEG Indexes] = mypop_eegthresh(varargin)

try
    [EEG Indexes] = pop_eegthresh(varargin{:});
catch
    if isempty(findstr(lasterr, 'Error: dataset is empty'))
        error(lasterr);
    end
    EEG = [];
    Indexes = [];
end

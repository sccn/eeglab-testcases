function str = binarytestlocation;

tmppath = fileparts(which('binarytestlocation'));
str     = fullfile( tmppath, 'testfiles');

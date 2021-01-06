function [test tmp] = checkmmo_sub6;

tmp = pascal(8); floatwrite(tmp, 'testfile.fdt'); 
test = mmo('testfile.fdt', [8 8], true, false, true);

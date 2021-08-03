function [hi, yi] = sensor(teta, i, R) 

    hi = [1 i; i sin(pi*i/200)];
    vi = sqrt(R) * randn(2,1);
    yi = hi*teta' + vi;


clc();clear();

tic;
for i = 0: 1
    x1 = -1 + 2 * rand(1);
    x2 = -1 + 2 * rand(1);
    [ x_opt ] = HookeJeeves_NM([x1 x2], 0.5, 0.5, 0.01, 100 );
end
toc;
clc();clear();

iterations_count = 10;
xn_disp(1:3 * iterations_count, 1:2) = 0;

disp('Doing stuff...');

alfa = 4;
for j = 1 : iterations_count
    x1 = -5 + 10 * rand(1);
    x2 = -5 + 10 * rand(1);
%     xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, 100 );
    xn_disp(j, :) = Interior_M([x1 x2], 2, 1e-4, 0.5, alfa, 100 );
end

% F_M = @F_E;
F_M = @F_I;

figure;
hold on;

[xx, yy] = meshgrid(-5:0.025:5, -5:0.025:5);
len = length (xx);
surf(xx, yy, fn([xx yy], 4));

plot3(xx, yy, F_M( xx, yy, 4, 2 ), 'r');

xlabel('x');
ylabel('y');
zlabel('z');
shading interp;

xn_disp = xn_disp.';
xx1 = xn_disp(1, 1:iterations_count);
yy1 = xn_disp(2, 1:iterations_count);
zz1 = F_M( xx1, yy1, 4, 2 );
scatter3(xx1, yy1, zz1, 'MarkerEdgeColor', 'k', 'MarkerFaceColor','r');


disp('Finished.');

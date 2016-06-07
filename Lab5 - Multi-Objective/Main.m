clc();clear();
disp('Lab 5 - Multi-objective optimization');

iterations_count = 100;

% Prepare variables
xn_disp(1:3 * iterations_count, 1:2) = 0;
disp([num2str(iterations_count) ' iterations.']);
disp('Starting...');

% Init timmer
tic();

% alfa = 4;
% for j = 1 : iterations_count
%     x1 = -5 + 10 * rand(1);
%     x2 = -5 + 10 * rand(1);
%     xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
% end
% alfa = 4.4934;
% for j = iterations_count + 1 : 2 * iterations_count
%     x1 = -5 + 10 * rand(1);
%     x2 = -5 + 10 * rand(1);
%     xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
% end
% alfa = 5;
% for j = 2 * iterations_count + 1 : 3 * iterations_count
%     x1 = -5 + 10 * rand(1);
%     x2 = -5 + 10 * rand(1);
%     xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
% end

disp('Done');

% Stop timmer and show results
toc();

% Prepare graphs
disp('Ploting graph...');
figure;
hold on;

% Draw function graph
x = 0.01:0.005:0.05;
y = 0.2:0.1:1;
[xx, yy] = meshgrid(x, y);
surf(xx, yy, f([xx yy], 0.5));
xlabel('x');
ylabel('y');
zlabel('z');
shading flat ;

% Draw results graph
% xn_disp = xn_disp.';
% xx1 = xn_disp(1, 1:iterations_count);
% yy1 = xn_disp(2, 1:iterations_count);
% zz1 = F_E( xx1, yy1, 4, 0.5 );
% xx2 = xn_disp(1, iterations_count + 1:2 * iterations_count);
% yy2 = xn_disp(2, iterations_count + 1:2 * iterations_count);
% zz2 = F_E( xx2, yy2, 4.4934, 0.5 );
% xx3 = xn_disp(1, 2 * iterations_count + 1: 3 * iterations_count);
% yy3 = xn_disp(2, 2 * iterations_count + 1: 3 * iterations_count);
% zz3 = F_E( xx3, yy3, 5, 0.5 );
% 
% plot3(xx1, yy1, zz1);
% plot3(xx2, yy2, zz2);
% plot3(xx3, yy3, zz3);
plot3(xx, yy, F_E(xx, yy, 0.5, 2));
plot3(xx, yy, F_I(xx, yy, 0.5, 2));
disp('Finished.');
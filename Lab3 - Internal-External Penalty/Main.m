clc();clear();
disp('Lab 3 - Exterior and Interior penalty function method');

% Method selector
% e = , i =
algorithm_selector = 'e';
iterations_count = 100;

if(algorithm_selector == 'e')
    disp('Using Exterior penalty method');
elseif(algorithm_selector == 'i')
    disp('Using Interior penalty method');
else
    error('Invalid method selected.');
end

% Prepare variables
xn_disp(1:3 * iterations_count, 1:2) = 0;
disp([num2str(iterations_count) ' iterations.']);
disp('Starting...');

% Init timmer
tic();

if(algorithm_selector == 'e')
    % Exterior penalty method
    alfa = 4;
    for j = 1 : iterations_count
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
    end
    alfa = 4.4934;
    for j = iterations_count + 1 : 2 * iterations_count
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
    end
    alfa = 5;
    for j = 2 * iterations_count + 1 : 3 * iterations_count
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(j, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
    end
elseif(algorithm_selector == 'i')
    % Interior penalty method
    alfa = 4;
    for j = 1 : iterations_count
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(j, :) = Interior_M([x1 x2], 2, 1e-4, 0.5, alfa, iterations_count );
    end
    alfa = 4.4934;
    for j = iterations_count + 1 : 2 * iterations_count
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(j, :) = Interior_M([x1 x2], 2, 1e-4, 0.5, alfa, iterations_count );
    end
    alfa = 5;
    for j = 2 * iterations_count + 1 : 3 * iterations_count
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(j, :) = Interior_M([x1 x2], 2, 1e-4, 0.5, alfa, iterations_count );
    end
end
disp('Done');

% Stop timmer and show results
toc();

% Prepare graphs
disp('Ploting graph...');
figure;
hold on;

% Draw function graph
[xx, yy] = meshgrid(-5:0.1:5, -5:0.1:5);
contour3(xx, yy, f_normal([xx yy]));
surface(xx, yy, fn([xx yy], 5));
xlabel('x');
ylabel('y');
zlabel('z');
shading interp;

% Draw results graph
xn_disp = xn_disp.';
xx1 = xn_disp(1, 1:iterations_count);
yy1 = xn_disp(2, 1:iterations_count);
xx2 = xn_disp(1, iterations_count + 1:2 * iterations_count);
yy2 = xn_disp(2, iterations_count + 1:2 * iterations_count);
xx3 = xn_disp(1, 2 * iterations_count + 1: 3 * iterations_count);
yy3 = xn_disp(2, 2 * iterations_count + 1: 3 * iterations_count);

if(algorithm_selector == 'e')
    zz1 = F_E( xx1, yy1, 4, 2 );
    zz2 = F_E( xx2, yy2, 4.4934, 2 );
    zz3 = F_E( xx3, yy3, 5, 2 );
else
    zz1 = F_I( xx1, yy1, 4, 2 );
    zz2 = F_I( xx2, yy2, 4.4934, 2 );
    zz3 = F_I( xx3, yy3, 5, 2 );
end
plot3(xx1, yy1, zz1);
plot3(xx2, yy2, zz2);
plot3(xx3, yy3, zz3);
disp('Finished.');
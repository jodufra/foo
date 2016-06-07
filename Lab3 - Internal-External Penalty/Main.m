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
    for j = 1 : iterations_count
        jj = j+iterations_count;
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(jj, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
    end
    alfa = 5;
    for j = 1 : iterations_count
        jj = j+iterations_count+iterations_count;
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(jj, :) = Exterior_M([x1 x2], 2, 1e-4, alfa, iterations_count );
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
    for j = 1 : iterations_count
        jj = j+iterations_count;
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(jj, :) = Interior_M([x1 x2], 2, 1e-4, 0.5, alfa, iterations_count );
    end
    alfa = 5;
    for j = 1 : iterations_count
        jj = j+iterations_count+iterations_count;
        x1 = -5 + 10 * rand(1);
        x2 = -5 + 10 * rand(1);
        xn_disp(jj, :) = Interior_M([x1 x2], 2, 1e-4, 0.5, alfa, iterations_count );
    end
end
disp('Done');

% Stop timmer and show results
toc();

% Prepare graphs
disp('Ploting graph...');
figure;

% Draw function graph
x = -5:0.1:5;
y = -5:0.1:5;
[xx, yy] = meshgrid(x, y);
graph = surf(xx, yy, f_normal([xx yy]));
xlabel('x');
ylabel('y');
zlabel('z');
% axis tight;
shading interp;
hold on;

% Draw results graph
xn_disp = xn_disp.';
xx1 = xn_disp(1, 1:iterations_count);
yy1 = xn_disp(2, 1:iterations_count);
xx2 = xn_disp(1, iterations_count:2 * iterations_count);
yy2 = xn_disp(2, iterations_count:2 * iterations_count);
xx3 = xn_disp(1, 2 * iterations_count: 3 * iterations_count);
yy3 = xn_disp(2, 2 * iterations_count: 3 * iterations_count);
plot3(xx1, yy1, fn([xx1 yy1], 4));
hold on;
plot3(xx2, yy2, fn([xx2 yy2], 4.4934));
hold on;
plot3(xx3, yy3, fn([xx3 yy3], 5));
disp('Finished.');
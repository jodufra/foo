clc();clear();
disp('Lab 3 - Gradient Methods');

% Method selector
% i = Internal, e = External
algorithm_selector = 'n';

if(algorithm_selector == 's')
    disp('Using Steepest Descend Method');
elseif(algorithm_selector == 'n')
    disp('Using Newton Method');
else
    error('Invalid method selected.');
end

% Prepare variables
iterations_count = 1000;
optimal_results = 0;
x1disp = zeros(1, iterations_count);
x2disp = zeros(1, iterations_count);
disp([num2str(iterations_count) ' iterations.']);
disp('Starting...');

% Init timmer
tic();

if(algorithm_selector == 's')
    % Steepest Descend method
    for j = 1 : iterations_count
        x1 = -1 + 2 * rand(1);
        x2 = -1 + 2 * rand(1);
        [ x1_opt, x2_opt ] = SteepestD_M( x1,x2,1e-4,10000 );
        if(-0.3 < x1_opt && x1_opt < 0.3 && -0.3 < x2_opt && x2_opt < 0.3)
            optimal_results = optimal_results + 1;
        end
        x1disp(j) = x1_opt;
        x2disp(j) = x2_opt;
    end
elseif(algorithm_selector == 'n')
    syms y x;
    symf = symfun(x.^2 + y.^2 - cos(2.5 * pi .* x) - cos(2.5 * pi .* y) + 2, [x y]);
    grad = matlabFunction(gradient(symf));
    hess = matlabFunction(hessian(symf));
    % Newton Method
    for j = 1 : iterations_count
        x1 = -1 + 2 * rand(1);
        x2 = -1 + 2 * rand(1);
        [ x1_opt, x2_opt ] = Newton_M(grad, hess, x1, x2, 1e-3, 10000 );
        if(-0.3 < x1_opt && x1_opt < 0.3 && -0.3 < x2_opt && x2_opt < 0.3)
            optimal_results = optimal_results + 1;
        end
        x1disp(j) = x1_opt;
        x2disp(j) = x2_opt;
    end
end
disp('Done');

% Stop timmer and show results
toc();

% Show results
non_optimal_results = iterations_count - optimal_results;
disp(['Optimal results: ' num2str(optimal_results) '(' num2str(optimal_results / iterations_count * 100) '%)']);
disp(['Non optimal results: ' num2str(non_optimal_results) '(' num2str(non_optimal_results / iterations_count * 100) '%)']);

% Prepare graphs
disp('Ploting graph...');
figure;

% Draw function graph
x = -1:0.1:1;
y = -1:0.1:1;
[xx, yy] = meshgrid(x, y);
zz = f(xx, yy);
surface(xx, yy, zz);
xlabel('x');
ylabel('y');
zlabel('z');
xlim([-1 1]);
ylim([-1 1]);
% axis tight;
shading interp;
hold on;

% Draw results graph
zz = f(x1disp, x2disp);
scatter3(x1disp, x2disp, zz);
disp('Finished.');
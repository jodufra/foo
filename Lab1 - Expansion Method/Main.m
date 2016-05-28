clc();clear();
disp('Lab 1 - Expansion Method');

% Method selector
% g = GoldenR_M, f = Fibonacci_M, l = Lagrange_M
algorithm_selector = 'l';

if(algorithm_selector == 'g')
    disp('Using Golden ration method');
elseif(algorithm_selector == 'f')
    disp('Using Fibonacci method');
elseif(algorithm_selector == 'l')
    disp('Using Lagrange method');
else
    error('Invalid method selected.');
end

% Prepare variables
exceptions_count = 0;
optimal_results = 0;
iterations_count = 10000;
xdisp = zeros(1, iterations_count);
disp([num2str(iterations_count) ' iterations.']);
disp('Starting...');

% Init timmer
tic();

% Calling selected algorith
if(algorithm_selector == 'g')
    % Golden ration method
    for j = 1 : iterations_count
        [minl, maxl] = Expansion_M(2, 100);
        try
            [Gx] = GoldenR_M(minl, maxl, iterations_count, 0.01);
            if(Gx > 4) optimal_results = optimal_results + 1; end
            xdisp(j) = Gx;
        catch exception
            exceptions_count = exceptions_count + 1;
            if(exceptions_count < iterations_count)
                j = j - 1;
            else
                break;
            end
        end
    end
elseif(algorithm_selector == 'f')
    % Fibonacci method
    for j = 1 : iterations_count
        [minl, maxl] = Expansion_M(2, 100);
        try
            [Gx] = Fibonacci_M(minl, maxl, iterations_count, 0.01);
            if(Gx > 4) optimal_results = optimal_results + 1; end
            xdisp(j) = Gx;
        catch exception
            exceptions_count = exceptions_count + 1;
            if(exceptions_count < iterations_count)
                j = j - 1;
            else
                break;
            end
        end
    end
elseif(algorithm_selector == 'l')
    % Lagrange_M method
    for j = 1 : iterations_count
        [minl, maxl] = Expansion_M(2, 100);
        try
            [Gx] = Lagrange_M(minl, maxl, iterations_count, 0.01, 0.0001);
            if(Gx > 4) optimal_results = optimal_results + 1; end
            xdisp(j) = Gx;
        catch exception
            exceptions_count = exceptions_count + 1;
            if(exceptions_count < iterations_count)
                j = j - 1;
            else
                break;
            end
        end
    end
end
disp(['Done with ' num2str(exceptions_count) ' exceptions.']);

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
x = linspace(-10, 10, 1000);
y = f(x);
plot(x, y, '-');
hold on;

% Draw results graph
plot(xdisp, f(xdisp), '*');
disp('Finished.');

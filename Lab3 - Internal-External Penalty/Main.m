clc();clear();
disp('Lab 3 - Internal-External Penalty');

% Method selector
% i = Internal, e = External
algorithm_selector = 'i';

if(algorithm_selector == 'i')
    disp('Using Internal Penalty method');
elseif(algorithm_selector == 'e')
    disp('Using External Penalty method');
else
    error('Invalid method selected.');
end

% Prepare variables
exceptions_count = 0;
optimal_results = 0;
iterations_count = 100;
x1disp = zeros(1, iterations_count);
x2disp = zeros(1, iterations_count);
disp([num2str(iterations_count) ' iterations.']);
disp('Starting...');

% Init timmer
tic();

if(algorithm_selector == 'i')
    % Internal Penalty method
    for j = 1 : iterations_count
        x1 = -1 + 2 * rand(1);
        x2 = -1 + 2 * rand(1);
        try
            [ x_opt ] = HookeJeeves_NM([x1 x2], 0.5, 0.5, 1e-4, iterations_count*iterations_count );
            x1_opt = x_opt(1);
            x2_opt = x_opt(2);
            if(-0.3 < x1_opt && x1_opt < 0.3 && -0.3 < x2_opt && x2_opt < 0.3)
                optimal_results = optimal_results + 1;
            end
            x1disp(j) = x1_opt;
            x2disp(j) = x2_opt;
        catch exception
            exceptions_count = exceptions_count + 1;
            if(exceptions_count < iterations_count)
                j = j - 1;
            else
                break;
            end
        end
    end
elseif(algorithm_selector == 'e')
%     % External Penalty method
%     d = [1 0;0 1];
%     s(1:2, 1:iterations_count) = 0.5;
%     for j = 1 : iterations_count
%         x = [-1 + 2 * rand(1), -1 + 2 * rand(1)];
%         try
%             % [ x1_opt, x2_opt ] = Rosenbrock_M(x, d, s, 3, 0.5, iterations_count );
%             x1_opt = 0;
%             x2_opt = 0;
%             if(-0.3 < x1_opt && x1_opt < 0.3 && -0.3 < x2_opt && x2_opt < 0.3)
%                 optimal_results = optimal_results + 1;
%             end
%             x1disp(j) = x1_opt;
%             x2disp(j) = x2_opt;
%         catch exception
%             exceptions_count = exceptions_count + 1;
%             if(exceptions_count < iterations_count)
%                 j = j - 1;
%             else
%                 break;
%             end
%         end
%     end
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
x = -1:0.05:1;
y = -1:0.05:1;
[xx, yy] = meshgrid(x, y);
graph = surf(xx, yy, fn([xx yy]));
xlabel('x');
ylabel('y');
zlabel('z');
% axis tight;
shading interp;
hold on;

% Draw results graph
scatter3(x1disp, x2disp, fn([x1disp x2disp]));
disp('Finished.');
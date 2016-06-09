clc();clear();
iterations_count = 100;
x1disp = zeros(1, iterations_count);
x2disp = zeros(1, iterations_count);

grad=matlabFunction(gradient(f_sym()));
hess=matlabFunction(hessian(f_sym()));
% Newton Method
for j = 1 : iterations_count
    x1 = -1 + 2 * rand(1);
    x2 = -1 + 2 * rand(1);
    [ x1_opt, x2_opt ] = Newton_M(grad, hess, x1, x2, 1e-3, 10000 );
    x1disp(j) = x1_opt;
    x2disp(j) = x2_opt;
    if(x1_opt < -1 || x1_opt > 1 || x2_opt < -1 || x2_opt > 1)
        error('');
    end
end
disp('Done');
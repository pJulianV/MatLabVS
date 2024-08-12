% Define the function
f = @(x, y) x.^2 + y.^2 + 5;

% Define the partial derivatives using numerical differentiation
eps = 1e-6;
f_x = @(x, y) (f(x + eps, y) - f(x - eps, y)) / (2 * eps);
f_y = @(x, y) (f(x, y + eps) - f(x, y - eps)) / (2 * eps);

alpha = [2 1 0.1];

% First iteration
for k = 1:3
    w_old = [3 4];
    for i = 1:40
        x = w_old(1);
        y = w_old(2);
        w_new = w_old - alpha(k) * [f_x(x, y) f_y(x, y)];
        
        % Plot the iteration
        subplot(1, 3, k);
        plot([w_new(1) w_old(1)], [w_new(2) w_old(2)]);
        xlim([-5 5]);
        ylim([-5 5]);
        hold on;
        
        w_old = w_new;
    end
    hold off;
end
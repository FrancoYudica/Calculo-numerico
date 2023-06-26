function final2


    A = [0, 1; -12/5, -2/5];
    dt = 0.02;
    t = 0.0 : dt : 6;

    y_0 = [5; 2];
    y_rk = [y_0];
    w = 1;
    for i = 2 : length(t)

        previous = y_rk(:, i - 1);
        previous_t = t(i - 1);

        previous_slope = A * previous + [0; 3 * previous_t * sin(3 * previous_t)];
        k1 = dt * previous_slope;
        yg = previous + k1 / (2.0 * w);

        current_t = t(i);
        current_slope = A * yg + [0; 3 * current_t * sin(3 * current_t)];
        k2 = dt * current_slope;

        y_rk(:, i) = previous + (1 - w) * k1 + w * k2;
    end

    y = y_rk(1, :);
    plot(t, y)

    # Derivative
    dy = [];
    for i = 1 : length(y)
        dy(i) = get_derivative(i, y, dt);
    end
    plot(y, dy);

    integral_vector = [];
    for i = 1 : 201
        integral_vector(i) = (5 + y(i)) * t(i) * t(i);
    end

    plot(0 : 0.02 : 4, integral_vector)
    integral_result = discrete_integral(integral_vector, dt)

endfunction



function [result] = get_derivative(i, u, dt)
    n = length(u);
    if (i == 1)
        result = 1.0 / (2.0 * dt) * (-3.0 * u(1) + 4.0 * u(2) - u(3));
    elseif (i == n)
        result = 1.0 / (2.0 * dt) * (3.0 * u(n) - 4.0 * u(n - 1) + u(n - 2));

    else
        result = 1.0 / (2.0 * dt) * (u(i + 1) - u(i - 1));
    endif

endfunction


function [result] = discrete_integral(u, dt)
    n = length(u);
    result = u(1) + u(n);

    for i = 2 : 2 : n - 1
        result += 2 * u(i);
    end

    for i = 3 : 2 : n - 1
        result += 4 * u(i);
    end

    result *= dt / 3.0;

endfunction

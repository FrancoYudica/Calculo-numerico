function final1
    format long

    M = 5.0 * eye(5);
    K = [
        2, -1, 0, 0, 0
        -1, 2, -1, 0, 0
        0, -1, 2, -1, 0
        0, 0, -1, 2, -1
        0, 0, 0, -1, 2
    ];

    b = (50.0 / 19.0) * [5; 8; 9; 8; 5];
    z_0 = [0; 0; 0; 0; 0];
    dz_0 = [0; 0; 0; 0; 0];
    dt = 0.1;

    t = 0 : dt : 150;

    start_prev = z_0 - dt * dz_0 + dt * dt * 0.5 * inverse(M) * (b * g(0) - K * z_0);

    z = [start_prev, z_0];

    for i = 2 : length(t)
        previous = z(:, i - 1);
        current = z(:, i);
        z(:, i + 1) = dt * dt * inverse(M) * b * g(t(i)) + (2.0 * eye(5) - dt * dt * inverse(M) * K) * current - previous;
    end

    z3 = z(3, 2 : length(z));
    plot(t, z3);
    calculate_integral(z3, dt)
    discrete_root_count(z3)

endfunction


function [g_t] = g(t)

    if (t < 50)
        g_t =  (50 * t - t * t) / 625;
    else
        g_t = 0;
    endif

endfunction


function [result] = calculate_integral(y, h)
    # Simpson numerical integration method
    n = length(y);
    result = y(1) + y(n);

    for i = 2 : 2 : n - 1
        result += 2 * y(i);
    end

    for i = 3 : 2 : n - 1
        result += 4 * y(i);
    end


    result *= h / 3.0;

endfunction


function [count] = discrete_root_count(y)

    count = 0;
    previous_sign = -1;
    for i = 1 : length(y)

        current_sign = sign(y(i));
        if (y(i) == 0 || current_sign * previous_sign == -1)
            count += 1;
        end

        previous_sign = current_sign;

    end

endfunction


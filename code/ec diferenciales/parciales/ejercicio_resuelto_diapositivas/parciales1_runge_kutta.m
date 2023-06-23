# Primer ejercicio de ecuaciones diferenciales parciales de las diapositivas
# resuelto mediante reducción de orden con el método de Runge-Kutta.
# la deducción del sistema cKU(t)+MU''(t)=0 se encuentra en las diapositivas


function parciales1_runge_kutta


    c = 12 / (0.25 * 0.25);
    K = [2, -1, 0; -1, 2, -1; 0, -1, 2];
    M = [0.25 * 0.25, 0, 0; 0, 0.5 * 0.5, 0; 0, 0, 0.75 * 0.75];
    dt = 0.001;
    t = 0 : dt : 1.0;

    # Matrix of matrices
    A = [zeros(3, 3), eye(3); -c * inverse(M) * K, zeros(3, 3)];
    U_0 = [sin(0.25 * pi); sin(0.5 * pi); sin(0.75 * pi)];
    dU_0 = [3; 3; 3];
    w = 0.5;

    # The first vector is a combination of U_0 and dU_0
    u = [U_0 ; dU_0];

    # Calculates usual Runge-Kutta
    for i = 2 : length(t)
        current = u(:, i - 1);
        current_slope = A * current;
        k1 = dt * current_slope;
        yg = current + k1 / (2 * w);
        slope_g = A * yg;
        k2 = dt * slope_g;
        u(:, i) = current + (1 - w) * k1 + w * k2;
    end


    # Only plots the values of U
    # In indices u(4 : 6) we have stored the derivatives
    plot(t, u(1 : 3, :));
    #plot(t, u(4 : 6, :));

endfunction



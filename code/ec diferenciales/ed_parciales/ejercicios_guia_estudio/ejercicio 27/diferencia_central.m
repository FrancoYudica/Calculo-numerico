# Ejercicio 27 integrador. Página 114
# Es de segundo orden en 'x' y en primer orden en 't'
# usando diferencia central

function diferencia_central


    L = 1.0;
    c = 1.0;
    dt = 0.01;
    dx = L / 4;

    # Discretizamos en 5 puntos
    x = 0.0 : dx : L
    t = 0.0 : dt : 1.0;

    l = -c * c /  (dx * dx);
    K = [-2, 1, 0; 1, -2, 1; 0, 1, -2];

    # Condiciones iniciales
    u_0 = [sin(pi * x(2) / L); sin(pi * x(3) / L); sin(pi * x(4) / L)];
    du_0 = [0; 0; 0];

    # Diferencia central
    start_prev = u_0 - dt * du_0 - dt * dt * 0.5 * l * K * u_0;

    u = [start_prev, u_0];

    for i = 2 : length(t)
        previous = u(:, i - 1);
        current = u(:, i);

        u(:, i + 1) = (2.0 * eye(3) - dt * dt * l * K) * current - previous;
    end

    plot(t, u(:, 2 : length(u)))

endfunction

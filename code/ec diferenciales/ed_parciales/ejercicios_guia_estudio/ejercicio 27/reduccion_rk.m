# Ejercicio 27 integrador. Página 114
# Es de segundo orden en 'x' y en primer orden en 't'
# usando reduccion de orden y runge kutta

function reduccion_rk


    L = 1.0;
    c = 1.0;
    dt = 0.01;
    dx = L / 4;

    # Discretizamos en 5 puntos
    x = 0.0 : dx : L;
    t = 0.0 : dt : 1.0;

    l = -c * c /  (dx * dx);
    K = [-2, 1, 0; 1, -2, 1; 0, 1, -2];

    A = [zeros(3, 3), eye(3); -l * K, zeros(3, 3)];

    # Condiciones iniciales
    u_0 = [sin(pi * x(2) / L); sin(pi * x(3) / L); sin(pi * x(4) / L)];
    du_0 = [0; 0; 0];

    # Reduccion de orden Runge Kutta
    u = [u_0; du_0];
    w = 0.5;
    for i = 2 : length(t)

        previous = u(:, i - 1);
        slope1 = A * previous;
        k1 = dt * slope1;

        yg = previous + k1 / (2.0 * w);
        slope2 = A * yg;
        k2 = dt * slope2;

        u(:, i) = previous + (1.0 - w) * k1 + w * k2;
    end

    # Muestro solamente las primeras 3 funciones, que corresponden a las
    # funciones U(t) y no a sus derivadas
    plot(t, u(1 : 3, :))


endfunction

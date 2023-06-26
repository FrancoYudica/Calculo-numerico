# Ejercicio 27 integrador. Página 114
# Es de segundo orden en 'x' y en primer orden en 't'
# usando reduccion de orden y euler modificado

function reduccion_euler_modificado


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

    # Reduccion de orden euler modificado
    u = [u_0; du_0];
    for i = 2 : length(t)

        previous = u(:, i - 1);
        slope1 = A * previous;

        half_way_u = previous + dt * 0.5 * slope1;

        half_way_slope = A * half_way_u;
        u(:, i) = previous + dt * half_way_slope;
    end

    # Muestro solamente las primeras 3 funciones, que corresponden a las
    # funciones U(t) y no a sus derivadas
    plot(t, u(1 : 3, :))


endfunction

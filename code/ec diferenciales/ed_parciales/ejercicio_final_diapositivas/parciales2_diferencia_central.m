# Ultimo ejericio integrador de las diapositivas de e.d. parciales1_diferencia_central
# Nos dan el sistema en su forma matricial y tenemos que aplicar diferencia central
#
# Ejercicio:
#   Es de la forma
#   cKu(t) + Mu''(t) = 0
#
#   donde
#
#   c = 12 / (0.2 * 0.2)
#   K = [2, -1, 0, 0; -1, 2, -1, 0; 0, -1, 2, -1; 0, 0, -1, 2]
#   M = [0.2 * 0.2, 0, 0, 0; 0, 0.4 * 0.4, 0, 0; 0, 0, 0.6 * 0.6, 0; 0, 0, 0, 0.8 * 0.8]
#
#   Ademas, nos dicen que ui(0) = sin(pi * xi), y ui'(0) = 3
#   d2 = 0.01 en el rango [0, 1]
#
# Resolucion
#    1) Regla recursiva:
#      Sustituyo por derivada numerica central de segundo orden
#      cKu(t) + Mu''(t) = 0
#      cKu(t) + M(1/dt^2)(u(t-dt)-2u(t)+u(t+dt)) = 0
#      M(1/dt^2)(u(t-dt)-2u(t)+u(t+dt)) = -cKu(t)
#      (1/dt^2)(u(t-dt)-2u(t)+u(t+dt)) = -cM^-1Ku(t)
#      u(t-dt)-2u(t)+u(t+dt) = -dt^2cM^-1Ku(t)
#      u(t+dt) = -dt^2cM^-1Ku(t) - u(t-dt) + 2u(t)
#
#    Finalmente:
#      u(t+dt) = (2.0I -dt^2c(M^-1)K)u(t) - u(t-dt)
#   2) Caso base, con serie de Taylor
#       u(t0 - dt) = u(t0) - dt * u'(t0) - 0.5 * dt^2 * u''(t0)
#       Despejando u'' de la ecuacion original
#           cKu(t) + Mu''(t) = 0
#           Mu''(t) = -cKu(t)
#           u''(t) =
#       Sustituyo
#       u(t0 - dt) = u(t0) - dt * u'(t0) - 0.5 * dt^2 * (-c(M^-1)Ku(t0))
function parciales2_diferencia_central


    c = 12 / (0.2 * 0.2);
    K = [2, -1, 0, 0; -1, 2, -1, 0; 0, -1, 2, -1; 0, 0, -1, 2];
    M = [0.2 * 0.2, 0, 0, 0; 0, 0.4 * 0.4, 0, 0; 0, 0, 0.6 * 0.6, 0; 0, 0, 0, 0.8 * 0.8];
    dt = 0.001;
    t = 0 : dt : 1.0;

    # 4 puntos [0.2, 0.4, 0.6, 0.8]
    dx = 0.2;
    x = 0.2 : dx : 0.8;

    # Valores iniciales
    u_0 = [sin(pi * x(1)); sin(pi * x(2)); sin(pi * x(3)); sin(pi * x(4))]
    du_0 = [3; 3; 3; 3];

    # u anterior
    start_prev = u_0 - dt * du_0 - 0.5 * dt * dt * (-c * inverse(M) * K * u_0);

    temp = [start_prev, u_0];
    for i = 2 : length(t)
        previous = temp(:, i - 1);
        current = temp(:, i);
        temp(:, i + 1) = (2.0 * eye(4) - dt * dt * c * inverse(M) * K) * current - previous;
    end

    u = temp(:, 2 : length(temp));
    plot(t, u)
    legend("u_1", "u_2", "u_3", "u_4");


    a = derivative_x(u, dx, 1)

endfunction



function [dX] = derivative_x(x, dx, i)
    # Calculates the partial derivatives respect to X
    # Note that operates along columns

    # Forward asymetric derivative
    if i == 1
        dX = 0.5 / dx * (-3.0 * x(:, 1) + 4.0 * x(:, 2) - x(:, 3));

    # Backward asymetric derivative
    elseif i == rows(x)
        dX = 0.5 / dx * (3.0 * x(:, i) - 4.0 * x(:, i - 1) + x(:, i - 2));

    # Central derivative
    else
        dX = 0.5 / dx * (x(:, i + 1) - x(:, i - 1));

    endif
endfunction

function [dX] = derivative_t(x, dx, i)
    # Calculates the partial derivatives respect to T
    # Note that operates along rows

    # Forward asymetric derivative
    if i == 1
        dX = 0.5 / dx * (-3.0 * x(1, :) + 4.0 * x(2, :) - x(3, :));

    # Backward asymetric derivative
    elseif i == columns(x)
        dX = 0.5 / dx * (3.0 * x(i, :) - 4.0 * x(i - 1, :) + x(i - 2, :));

    # Central derivative
    else
        dX = 0.5 / dx * (x(i + 1, :) - x(i - 1, :));

    endif
endfunction

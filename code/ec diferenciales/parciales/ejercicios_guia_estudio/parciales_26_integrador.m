# Ejercicio 26 integrador. Página 114
# Es de segundo orden en 'x' y en primer orden en 't'
# es por eso que podemos usar euler mejorado sin reduccion de orden

function parciales_26_integrador

  d = 0.5;
  B = d * [-2, 1, 0, 0; 1, -2, 1, 0; 0, 1, -2, 1; 0, 0, 1, -2];
  L = 6;
  dx = 1;
  dt = 0.1;

  x = [0, 1, 2, 3, 4, 5];
  t = 0.0 : dt : 20.0;

  u_0 = [sin(pi / L); sin(pi * 2 / L); sin(pi * 3 / L); sin(pi * 4 / L)];

  u = [u_0]

  for i = 2 : length(t)

    # En lugar de usar Runge-Kutta usamos el metodo de euler mejorado
    # el cual calcula la pendiente como el promedio de las pendientes
    # en el T actual y el T siguiente. Nótese que para poder calcualar
    # la pendiente en el punto siguiente necesitamos aproximar u siguiente
    previous = u(:, i - 1);
    slope1 = B * previous;
    u_next = previous + slope1 * dt;
    slope2 = B * u_next;

    u(:, i) = previous + (slope1 + slope2) / 2.0 * dt;

  endfor
  plot(t, u);



endfunction

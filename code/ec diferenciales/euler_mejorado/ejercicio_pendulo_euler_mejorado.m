function ejercicio_pendulo_euler_mejorado

  g = 9.8; # Aceleracion de la gravedad
  L = 1;   # Longitud del pendulo

  ti = 0.0;  # Tiempo inicial
  tf = 10.0; # Tiempo final
  dt = 0.001;
  t = ti : dt : tf;

  fi = 0;
  dfi = 2;

  A = [0, 1; -g / L, 0];

  y = [fi; dfi];

  for i = 2 : length(t)


    # Calculates slope L1
    yk = y(:, i - 1);
    current_slope = A * yk;

    # Calculates slope L2
    yk_next = dt * current_slope + yk;
    next_slope = A * yk_next;

    # Takes the calculates the slope average and uses euler
    slope_average = 0.5 * (current_slope + next_slope);

    y(:, i) = yk + dt * slope_average;
  endfor

  plot(t, y);


endfunction

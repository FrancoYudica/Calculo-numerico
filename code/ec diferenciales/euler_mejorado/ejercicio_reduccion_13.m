# El ejercicio se encuentra en la guia de estudio, página 107 del pdf
# es un ejercicio de reducción de orden

function ejericicio_reduccion_13


  m = 65; # Aceleracion de la gravedad
  k = 400;   # Longitud del pendulo
  c = 0;
  omega = 5;

  ti = 0.0;  # Tiempo inicial
  tf = 30.0; # Tiempo final
  dt = 0.003;
  t = ti : dt : tf;

  fi = 0;
  dfi = 0;

  A = [0, 1; -k / m, 0];

  y = [fi; dfi];

  for i = 2 : length(t)


    # Calculates slope L1
    yk = y(:, i - 1);
    bk = [0; sin(t(i-1) * omega) / m];
    current_slope = A * yk + bk;

    # Calculates slope L2
    yk_next = dt * current_slope + yk;
    bk_next = [0; sin(t(i) * omega) / m];
    next_slope = A * yk_next + bk_next;

    # Takes the calculates the slope average and uses euler
    slope_average = 0.5 * (current_slope + next_slope);

    y(:, i) = yk + dt * slope_average;
  endfor

  plot(t, y);


endfunction

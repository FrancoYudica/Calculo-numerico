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
  w = 1.0;
  for i = 2 : length(t)



    yk = y(:, i - 1);

    # 1) Calculates slope
    bk = [0; sin(t(i-1) * omega) / m];
    current_slope = A * yk + bk;

    # 2) Use slope to calculate K1
    k1 = dt * current_slope;

    # 3) With K1 calculates YG
    yg = yk + k1 * (1.0 / (2.0 * w));

    # 4) With YG calculates K2
    # First calculate slope with YG
    bk_next = [0; sin(t(i) * omega) / m];
    next_slope = A * yg + bk_next;
    k2 = dt * next_slope;

    # 5) Calculates next y
    y(:, i) = yk + (1.0 - w) * k1 + w * k2;

  endfor

  plot(t, y);


endfunction




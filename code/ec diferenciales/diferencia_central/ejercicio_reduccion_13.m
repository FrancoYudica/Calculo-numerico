# El ejercicio se encuentra en la guia de estudio, página 107 del pdf
# es un ejercicio de reducción de orden


function ejericicio_reduccion_13

  m = 65; # Aceleracion de la gravedad
  k = 400;   # Longitud del pendulo
  c = 0;
  omega = 5;

  ti = 0.0;  # Tiempo inicial
  tf = 30.0; # Tiempo final
  dt = 0.001;
  t = ti : dt : tf;

  fi = 0;
  dfi = 0;

  start_prev = fi - dt * dfi + dt * dt * 0.5 / m * (sin(omega * ti) - k * fi);
  y = [start_prev, fi];

  for i = 2 : length(t)

    previous = y(i - 1);
    current = y(i);

    y(i + 1) = dt * dt / m * sin(omega * t(i)) + (2.0 - dt * dt * k / m) * current - previous;

  endfor

  plot(t, y(2 : length(y)));


endfunction

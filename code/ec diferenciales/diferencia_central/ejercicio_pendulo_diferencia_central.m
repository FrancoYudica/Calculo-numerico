function ejercicio_pendulo_diferencia_central

  ti = 0.0;
  tf = 10.0;
  dt = 0.01;
  t = ti : dt : tf;

  fi = 0.0;
  dfi = 2.0;

  g = 9.8;
  L = 1.0;

  # Calculates previous

  start_previous = fi - dt * dfi - g / L * fi * dt * dt * 0.5;

  # Precalculates constant
  c = 2.0 - dt * dt * g / L;

  y = [start_previous, fi];

  for i = 2 : length(t)
    y(i + 1) = c * y(i) - y(i - 1);
  endfor

  plot(t, y(2 : length(y)))


endfunction

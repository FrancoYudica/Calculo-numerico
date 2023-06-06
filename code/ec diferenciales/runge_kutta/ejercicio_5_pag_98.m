function ejercicio_5_pag_98

  f = @(t, y)(0.5 * t - 0.5 * y);
  y0 = 4;
  ti = 0;
  tf = 10;
  dt = 0.001;
  t = ti : dt : tf;

  y = [y0];
  w = 0.5;
  for i = 1 : length(t) - 1
    yk = y(i);
    xk = t(i);

    k1 = dt * f(xk, yk);
    xg = xk + dt / (2.0 * w);
    yg = yk + k1 / (2.0 * w);
    slope = f(xg, yg);
    k2 = dt * slope;
    y(i + 1) = yk + (1 - w) * k1 + w * k2;

  endfor

  plot(t, y)


endfunction

function metodo_runge_kutta
  f = @(x, y)(0.5 * x - 0.5 * y);
  y0 = 4;
  h = 0.1;
  x = 0 : h : 10;
  y = [y0];

  # Si w = 1 -> euler modificado
  # Si w = 0.5 -> euler mejorado
  w = 1;

  for i = 2: length(x)

    # Pendiente anterior
    k1 = h * f(x(i-1), y(i-1));

    xg = x(i-1) + h / (2 * w);
    yg = y(i-1) + k1 / (2 * w);
    k2 = h * f(xg, yg);

    y(i) = y(i-1) + (1 - w) * k1 + w * k2;

  endfor

  hold on

  figure(1);
  plot(x, y, "o");

  # Solución exacta
  plot(x, 6 * exp(-x * 0.5) - 2 + x);
  hold off


endfunction

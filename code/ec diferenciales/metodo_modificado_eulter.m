function metodo_modificado_euler

  f = @(x, y)(2*y - 2*x-1);
  y0 = 2;
  h = 0.1;
  x = 0 : h : 1;
  y = [y0];

  for i = 2: 11

    # Pendiente anterior
    l1 = f(x(i-1), y(i-1));

    # Pendiente en el punto medio
    lc = f(x(i-1) + 0.5 * h, y(i-1) + 0.5 * h * l1);

    y(i) = y(i-1) + h * lc;

  endfor

  hold on

  figure(1);
  plot(x, y, "o");

  # Solución exacta
  plot(x, exp(2*x)+x+1)
  hold off


endfunction

function metodo_euler
  hold on
  f = @(x, y)(2*y - 2*x-1);
  y0 = 2;
  h = 0.1;
  x = 0 : h : 1;
  y = [y0];
  for i = 2: 11
    y(i) = y(i-1) + h*f(x(i-1), y(i-1));
  endfor
  plot(x, y, "o");
  error = [];

  for i = 1 : 11
    error(i)=exp(2*x(i))+x(i)+1 - y(i);
  endfor
  plot(x, error);
  plot(x, exp(2*x)+x+1)

  hold off

endfunction

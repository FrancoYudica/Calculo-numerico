
function ejercicio_parcial_1

  h = 0.2;
  x_data = 0.2 : h : 1.0;

  y_data = [46.3600; 55.8600; 58.9000; 60.4200; 61.5600];

  for i = 1 : length(y_data)
   derivate = get_derivate(i, y_data, h)
  endfor

  get_integral(y_data, h)
  get_integral_simpson(y_data, h)
  richardson_extrapolation(45.8280, 45.1440, 0.2, 0.4, 2)
endfunction


function [result] = get_derivate(i, y_data, h)

  # First order derivate, where error O(h^2)
  n = length(y_data);
  d = 1.0 / (2.0 * h);
  if (i == 1)
    result = d * (-3.0 * y_data(1) + 4.0 * y_data(2) - y_data(3));
  elseif (i == n)
    result = d * (3.0 * y_data(n) - 4.0 * y_data(n-1) + y_data(n-2));
  else
    result = d * (y_data(i+1) - y_data(i-1));
  endif

endfunction


function [integral] = get_integral(y_data, h)
  # Trapezoid
  n = length(y_data);
  integral = (y_data(1) + y_data(n)) * 0.5;

  for i = 2 : n - 1
    integral += y_data(i);
  endfor

  integral *= h;

endfunction


function [result] = get_integral_simpson(y_data, h)

  n = length(y_data);
  result = y_data(1) + y_data(n);

  for i = 2 : 2 : n - 1
    result += 4.0 * y_data(i);
  endfor


  for i = 3 : 2 : n - 1
    result += 2.0 * y_data(i);
  endfor

  result *= h / 3.0;

endfunction


function [result] = richardson_extrapolation(i1, i2, h1, h2, n)

  beta = power(h1 / h2, n);
  result = (beta * i2 - i1) / (beta - 1);

endfunction

function ejercicio3
  x_data_1 = [-0.75; -0.25; 0.25; 0.75; 1.25];
  y_data_1 = [677.25; 540.75; 540.75; 677.25; 987.00];
  h1 = 0.5;
  
  x_data_2 = [-0.75; 0.25; 1.25];
  y_data_2 = [677.25; 540.75; 987.00];
  h2 = h1 * 2;
  
  simpson_1 = simpson(y_data_1, h1)
  trapezoid_1 = trapezoid(y_data_1, h1)
  
  simpson_2 = simpson(y_data_2, h2)
  trapezoid_2 = trapezoid(y_data_2, h2)
  
  richardson = richardson_extrapolation(trapezoid_1, trapezoid_2, h1, h2, 2)
  
endfunction


function [result] = richardson_extrapolation(
  integral1, integral2, step1, step2, err_order
  )
  beta = power(step1 / step2, err_order);
  result = (beta * integral2 - integral1) / (beta - 1);
  
endfunction



function [result] = simpson(y_data, h)
  n = length(y_data);
  
  # Extremos
  result = y_data(1) + y_data(n);
  
  # Casos especiales para indices pares e impares
  for i = 2 : 2 : n - 1
    result += 4 * y_data(i);
  endfor
  
  
  for i = 3 : 2 : n - 1
    result += 2 * y_data(i);
  endfor
  
  result *= h / 3;
  
endfunction

function [result] = trapezoid(y_data, h)
  n = length(y_data);
  
  # Extremos
  result = 0.5 * (y_data(1) + y_data(n));
  
  for i = 2 : n - 1
    result += y_data(i);
  endfor
  
  result *= h;
  
endfunction

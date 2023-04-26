
function ejercicio_integrador

  h = 0.5;
	x_data = [0, 0.5, 1, 1.5, 2, 2.5, 3];
  u_data = [167, 176, 201, 241, 291, 347, 400];
  n = length(u_data);
  
  # Calculates the derivative values
  u_derivatives = [];
  for i = 1 : n
    u_derivatives(i) = numeric_derivative1(i, u_data, h);
  endfor
  u_derivatives
  
  # Now calculaes the values of the function 2pix du^2
  y_data = [];
  for i = 1 : n
    y_data(i) = 2 * pi * x_data(i) * u_derivatives(i) * u_derivatives(i);
  endfor
  
  [result] = numeric_integration(y_data, h)
endfunction


function [result] = numeric_integration(y_data, step)
	# Simpson
  result = y_data(1);
  n = length(y_data);
  
  # Suma impares
  for i = 2 : 2 : n - 1
    result += 4 * y_data(i);
  endfor
  
  
  # Suma pares
  for i = 3 : 2 : n - 1
    result += 2 * y_data(i);
  endfor
  
  
	result += y_data(n);

	result *= step / 3.0;

endfunction


function [result] = numeric_derivative1(i, y_data, step)
  # First order derivative
  n = length(y_data);
  
  if (i == 1)
    # Calculates the derivage in the start edge of the interval
    result = (1.0 / (2 * step)) * (-3 * y_data(1) + 4 * y_data(2) - y_data(3));
    
  elseif (i == n)
    # Calculates the derivage in the end edge of the interval
    result = (1.0 / (2.0 * step)) * (3 * y_data(n) - 4 * y_data(i -1) + y_data(i-2));
  else
    # Calculates the derivative using the centered methods
    result = (1.0 / (2.0 * step)) * (y_data(i + 1) - y_data(i - 1))
  endif
   
endfunction  
  


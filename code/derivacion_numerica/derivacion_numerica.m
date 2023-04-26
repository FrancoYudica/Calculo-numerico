
function derivacion_numerica
  
  f = @(x)(cos(pi * x));
  
  # Integration interval [a, b]
  a = 0.0;
  b = 1.0;
  
  # Steps
  h = (b - a) / 10;
  
  # Vectors that represent the x_data, this will generate n intervals
  x_data = a : h : b;
  
  # Now generates the y_data with the function f
  # Note that this process is donde for y1_data and y2_data
  y_data = [];
 
  for i = 1: length(x_data)
    y_data(i) = f(x_data(i));
  endfor

  # Calculates the integration in the first point
  [derivative1] = numeric_derivative1(1, y_data, h)
  [derivative2] = numeric_derivative2(1, y_data, h)

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
  


function [result] = numeric_derivative2(i, y_data, step)

  n = length(y_data);
  
  if (i == 1)
    # Calculates the derivage in the start edge of the interval
    result = (1.0 / (step * step)) * (2 * y_data(1) - 5 * y_data(2) + 4 * y_data(3) - y_data(4));
    
  elseif (i == n)
    # Calculates the derivage in the end edge of the interval
    result = result =  (1.0 / (step * step)) * (2 * y_data(n) - 5 * y_data(n - 1) + 4 * y_data(n - 2) - y_data(n - 3));
  else
    # Calculates the derivative using the centered methods
    result = (1.0 / (step * step)) * (y_data(i + 1) - 2 * y_data(i) + y_data(i - 1));
  endif
   
endfunction




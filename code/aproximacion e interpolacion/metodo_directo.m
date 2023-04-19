
function metodo_directo
  # Metodo directo usado para encontrar la interpolacion polinomica
  x_data = [0; 1; 2];
  y_data = [0; 2; 0];
  
  [interpolated] = direct_interpolation(x_data, y_data);
  
  success = true;
  for i = 1 : rows(y_data)
    if interpolated(x_data(i)) != y_data(i)
      success = false;
      break
    endif
  endfor
  
  success
  
endfunction



function [interpolated] = direct_interpolation(x_data, y_data)
  
  n = rows(x_data);
  q = zeros(n, n);
  
  # Fills the matrix
  for row = 1 : n
    for column = 1 : n
      
      q(row, column) = power(x_data(row), column - 1);
      
    endfor
    
  endfor
  
  coeffs = q\y_data;
  
  # Creates the interpolation function using the calculated coefficients
  interpolated = @(x)(0);
  for index = 1 : n
    coeff = coeffs(index);
    interpolated = @(x)(interpolated(x) + coeff * power(x, index-1));
  endfor
  
endfunction

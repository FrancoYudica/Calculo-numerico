
function integracion_numerica


	x_data = [0; 0.1; 0.2; 0.3; 0.4];
	y_data = [1; 7; 4; 3; 5];
	step = 0.1;
	[result] = numeric_integration(y_data, step);
	result
endfunction


function [result] = numeric_integration(y_data, step)
	
	result = y_data(1);
  n = rows(y_data);
  
  # Suma impares
  for i = 1 : 2 : n - 1
    result += 2 * y_data(i);
  endfor
  
  # Suma pares
  for i = 2 : 2 : n - 1
    result += 4 * y_data(i);
  endfor
  
	result += y_data(i + 1);

	result *= step / 3.0;

endfunction



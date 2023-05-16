
function integracion_numerica


	x_data = [0; 0.1; 0.2; 0.3; 0.4];
	y_data = [1; 7; 4; 3; 5];
	step = 0.1;
	[result] = numeric_integration(y_data, step);
	result

endfunction


function [result] = numeric_integration(y_data, step)
	
	result = y_data(1) / 2.0;
	for i = 2 : rows(y_data) - 1
		result += y_data(i);
	endfor

	result += y_data(i + 1) / 2.0;

	result *= step;

endfunction



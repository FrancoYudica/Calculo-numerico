
function aprox


  functions = {
    @(x)(1),
    @(x)(x),
    @(x)(x * x)
  };

  x = 0 : 1 : 6;
  y = [4; 7; 9; 10; 9; 12; 15];

  aprox_func = get_aproximation(functions, x, y);

  for i=1 : length(x)
     aprox_func(x(i))
  endfor

endfunction

function [aprox] = get_aproximation(base_functions, x_data, y_data)

  # column count is determined by the amount of functions
  columns = length(base_functions)

  # row count is determined by the amount of points
  rows = length(x_data)

  q = zeros(rows, columns);

  # Fills the matrix
  for column = 1: columns

    current_function = base_functions{column};

    for row = 1: rows

      q(row, column) = current_function(x_data(row));

    endfor

  endfor
  A = transpose(q) * q;
  b = transpose(q) * y_data;
  coefficients = A\b;


  # Creates a function with the calculated coefficients
  aprox = @(x)(0);
  for i=1: columns
    aprox = @(x)(aprox(x) + coefficients(i) * base_functions{i}(x));
  endfor

endfunction

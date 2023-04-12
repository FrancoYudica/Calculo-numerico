
function aprox
  
  
  functions = {
    @(x)(1),
    @(x)(x),
    @(x)(x * x)
  };
  
  
  
  x = [0, 1, 2, 3, 4, 5, 6];
  y = [4, 7, 9, 10, 9, 12, 15];
  
  aprox = get_aproximation(functions, x, y);  
  
  last_index = size(x)(2)
  
 

  params = x(1) : 0.1 : x(last_index);
  
  for i=0 : 7
    aprox(i)
  endfor  
  
  
  repr = aprox(x)
  #plot(x, y, "o", x, aprox)
  plot(params, aprox)
  
endfunction

function [aprox] = get_aproximation(base_functions, x_data, y_data)
  
  columns = size(base_functions)(1)
  rows = size(x_data)(2)
  
  q = zeros(rows, columns);
  
  # Fills the matrix
  for column = 1: columns
    
    current_function = base_functions{column};
    
    for row = 1: rows
      
      q(row, column) = current_function(x_data(row));
      
    endfor
    
  endfor
  A = transpose(q) * q;
  b = transpose(q) * transpose(y_data);
  coefficients = A\b;
  
  
  # Creates a function with the calculated coefficients
  aprox = @(x)(0);
  for i=1: columns
    aprox = @(x)(aprox(x) + coefficients(i) * base_functions{i}(x));
  endfor
  
endfunction
function ejercicio1
  
  
  x_data = [-0.75; -0.25; 0.25; 0.75; 1.25];
  y_data = [677.25; 540.75; 540.75; 677.25; 987.00];

  # Base de funciones
  base = {@(x)(exp(x)), @(x)(exp(-x))};
  
  columns = length(base);
  rows = length(x_data);
  
  # Matriz
  q = zeros(rows, columns);
  
  for column = 1 : columns
    
    # Funcion correspondiente a la columna
    f = base{column};
    for row = 1 : rows
      q(row, column) = f(x_data(row));
    endfor
  endfor
  
  
  
  A = transpose(q) * q
  b = transpose(q) * y_data
  
  coeffs = A\b
  
  # Funcion resultante
  f = @(x)(coeffs(1) * exp(x) + coeffs(2) * exp(-x));
  
  # Check para ver que los valores sean cercanos
  for i = 1 : length(x_data)
    f(x_data(i)) - y_data(i)
  endfor
  
  
  
endfunction

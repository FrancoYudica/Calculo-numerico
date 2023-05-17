function ejercicio_parcial_3

  h = 2;
  x_data = 2 : h : 10;

  y_data = [26.84; 32.34; 34.1; 34.98; 35.64];

  base = {@(x)(1), @(x)(1.0 / x)};

  columns = length(base);
  rows = length(x_data);
  q = zeros(rows, columns);
  for column = 1 : columns
    func = base{column};

    for row = 1 : rows
      q(row, column) = func(x_data(row));
    endfor

  endfor
  q
  A = transpose(q) * q
  b = transpose(q) * y_data

  A\b

endfunction

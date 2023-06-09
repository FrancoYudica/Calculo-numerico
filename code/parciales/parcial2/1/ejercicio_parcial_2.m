function ejercicio_parcial_2

  newton_polys = {@(x)(1), @(x)(x-7.48), @(x)((x-7.48)*(x-15.64))};
  x_data  = [7.48; 15.64; 23.8];
  y_data = [41.48; 49.98; 52.7];

  q = zeros(1, 1);
  n = length(x_data);
  for column = 1 : n
    newton_poly = newton_polys{column};

    for row = 1 : n
      q(row, column) = newton_poly(x_data(row));
    endfor

  endfor

  q\y_data

endfunction

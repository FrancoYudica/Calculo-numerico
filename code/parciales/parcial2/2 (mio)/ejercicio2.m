function ejercicio2
  x_data = [-0.75; -0.25; 0.25];
  y_data = [677.25; 540.75; 540.75];
  
  # Los polinomios de Newton:
  newton_polys = {@(x)(1), @(x)(x + 0.75), @(x)((x+0.75) * (x + 0.25))};
  
  n = length(x_data);
  q = zeros(n, n);
  for column = 1 : n
    
    npoly = newton_polys{column};
    for row = 1 : n
      q(row, column) = npoly(x_data(row));
    endfor
  endfor
  
  coeffs = q \ y_data
  
  f = @(x)(coeffs(1) * newton_polys{1}(x) + coeffs(2) * newton_polys{2}(x) + coeffs(3) * newton_polys{3}(x));
  
  # Verifico que la diferencia entre la funcion obtenida y los puntos dados sea 0¨
  for i = 1 : n
    f(x_data(i)) - y_data(i)
  endfor
  
  
endfunction

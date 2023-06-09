function ejercicio4
  
  x_data = [-0.75; -0.25; 0.25; 0.75; 1.25];
  y_data = [677.25; 540.75; 540.75; 677.25; 987.00];
  h = 0.5;
  
  # La derivada primera en X0 = -0.75 se calcula mediante
  # la derivada asimetrica hacia adelante de primer ordem
  der_x0 = (1.0 / (2.0 * h)) * (-3.0 * y_data(1) + 4.0 * y_data(2) - y_data(3))
  
  
  # La derivada primera en X1 = -0.25 la calculo mediante la 
  # derivada central
  der_x1 = (1.0 / (2.0 * h)) * (y_data(3) - y_data(1))
  plot(x_data, y_data)
  
  
  
endfunction


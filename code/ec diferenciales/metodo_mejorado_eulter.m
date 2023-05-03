function metodo_mejorado_euler
  
  f = @(x, y)(2*y - 2*x-1);
  x0 = 0;
  y0 = 2;
  h = 0.1;
  x = 0 : h : 1;
  y = [2];
  
  for i = 2: 11
    
    # Pendiente anterior
    l1 = f(x(i-1), y(i-1));
    
    l2 = f(x(i),y(i-1)+h*l1);
    lprom = 0.5 * (l1 + l2);
    y(i) = y(i-1) + h * lprom;
    
  endfor
  hold on
  
  figure(1);
  plot(x, y, "o");
  
  error = [];
  
  #for i = 1 : 11
  #  error(i)=exp(2*x(i))+x(i)+1 - y(i);
  #endfor
  
  #plot(x, error);
  
  plot(x, exp(2*x)+x+1)
  hold off
  
  
endfunction
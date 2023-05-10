# En este ejercicio, aproximamos el angulo en el cual se encuentra
# el pendulo, en cada momento. Como datos tenemos que y1 = 0, lo cual significa
# que el pendulo forma 0 grados con respecto a la vertical
# Y ademas nos dan y2 = 2, que representa la velocidad en ese punto.
# Claramente, si tenemos un pendulo la velocidad va a ser maxima cuando el
# angulo sea 0


function pendulo_sistema_runge_kutta
  g = 9.8; # Aceleracion de la gravedad
  l = 1;   # Longitud del pendulo
  
  ti = 0.0;  # Tiempo inicial
  tf = 10.0; # Tiempo final
  
  h = 0.01; # El paso es muy chico, de otro modo nos encontramos que
             # el metodo de euler presenta una divergencia
             
  x = ti : h : tf;
  
  # Con esta matriz, vamos a poder obtener la pendiente en cada punto
  # la matriz resulta de despejar la derivada primera y la segunda de las 
  # ecuaciones dadas originalmente
  
  # f(x) = Ax
  
  A = [0, 1
       -g/l, 0];
         
  # Dos arreglos, en los cuales almaceno los resultados de las aproximaciones
  y1 = [0];
  y2 = [2];
  
  # METODO RUNGE - KUTTA
  # Si w = 1 -> euler modificado
  # Si w = 0.5 -> euler mejorado
  w = 1;

  for i = 2: length(x)

    ym = [y1(i-1); y2(i-1)];
    k1 = h * A * ym;
    # Notese que no es necesario usar xg, pero en otros
    # problemas si es necesario, por la forma de f
    # xg = x(i-1) + h / (2 * w);

    yg = ym + k1 / (2 * w);
    k2 = h * A * yg;
    
    y1(i) = ym(1) + (1 - w) * k1(1) + w * k2(1);
    y2(i) = ym(2) + (2 - w) * k1(2) + w * k2(2);


  endfor


  hold on

  figure(1);
  plot(x, y1, "o");
  plot(x, y2, "o");

  hold off


endfunction

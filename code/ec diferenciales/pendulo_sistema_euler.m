# En este ejercicio, aproximamos el angulo en el cual se encuentra
# el pendulo, en cada momento. Como datos tenemos que y1 = 0, lo cual significa
# que el pendulo forma 0 grados con respecto a la vertical
# Y ademas nos dan y2 = 2, que representa la velocidad en ese punto.
# Claramente, si tenemos un pendulo la velocidad va a ser maxima cuando el
# angulo sea 0


function pendulo_sistema_euler
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
  A = [0, 1
       -g/l, 0];

  # Matriz donde las columnmas son los resultados para los distintos X
  # se carga con las condiciones iniciales
  y = [0; 2];

  # Metodo de Euler
  for i = 2: length(x)

    # Columna anterior
    ym = y(:, i - 1);

    slope = A * ym;
    y(:, i) = ym + slope * h;

  endfor

  hold on

  figure(1);
  plot(x, y(1, :), "o");
  plot(x, y(2, :), "o");

  hold off


endfunction

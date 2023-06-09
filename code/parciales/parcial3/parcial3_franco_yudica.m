function parcial3_franco_yudica

  ti = 0.0;
  tf = 150.0;
  dt = 1e-1;
  t = ti : dt : tf;
  M = [4, 0, 0, 0; 0, 4, 0, 0; 0, 0, 4, 0; 0, 0, 0, 4];
  K = [2, -1, 0, 0; -1, 2, -1, 0; 0, -1, 2, -1; 0, 0, -1, 2];
  b = [10; 5; 5; 5];

  # Datos iniciales
  zi = zeros(4, 1);
  dzi = zeros(4, 1);

  # 1) Diferencia central ------------------------------------------------------
  # Calculo z(ti - dt)
  start_prev = zi - dt * dzi + dt * dt * 0.5 * inverse(M) * (b * g(ti) - K * zi);

  # Matrices / Vectores coeficientes usados en la regla secuencial de diferencia cetral
  I = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]; # Matriz identidad 4x4
  Z = [start_prev, zi];
  a = dt * dt * inverse(M) * b;
  B = 2.0 * I - dt * dt * inverse(M) * K;

  for i = 2 : length(t)

    t_current = t(i);
    y_previous = Z(:, i - 1);
    y_current = Z(:, i);

    Z(:, i + 1) = g(t_current) * a + B * y_current - y_previous;

  endfor

  # 2) El valor aproximado de Z1(ti)--------------------------------------------
  # Para hacerlo, debo calcular el indice correspondiete
  # a ese tiempo, el cual se encuentra en t
  # Se observa que el indice del tiempo es 501, pero el de Z tiene que ser
  # 502, pues cuando defino Z, agrego el valor previo y el valor inicial, razón por
  # la cuál Z cotiene 1 elemento mas que t. Entonces el valor de Z1 se encuentra en la
  # primer fila, y en la 502 columna de Z
  t(500 + 1)
  Z1_t50 = Z(1, 502)

  # 3) Grafico Z3 y Z4. --------------------------------------------------------
  hold on
  z3 = Z(3, 2 : length(Z));
  z4 = Z(4, 2 : length(Z));
  plot(t, z3);
  plot(t, z4);
  legend("z3", "z4")

  # 4) Calculo la derivada primera de Z3 ---------------------------------------
  v3 = [];
  for i = 1 : length(z3)
    v3(i) = get_derivative(z3, i, dt);
  endfor

  #plot(t, v3);

  # 5) Calculo la integral de v3²
  # Para hacer eso, tengo que elevar al
  # cuadrado a cada uno de los valores de v3,
  # y luego, aplicar algún método de integración
  v3_sqrd = power(v3, 2.0);
  integral_v3_sqrd = compound_simpson(v3_sqrd, dt)

endfunction

function [result] = get_derivative(y, index, dt)
  # Funcion que utiliza el método adecuado para calcular
  # la derivada de acuerdo al indice de la misma. Es por eso que
  # se toma como parámetro al índice y se consideran los 3 casos

  # Derivada primera asimétrica hacia adelante
  if index == 1
    result = 1.0 / (2.0 * dt) * (-3.0 * y(1) + 4.0 * y(2) - y(3));

  # Derivada primera asimétrica hacia atras
  elseif index == length(y)
    result = 1.0 / (2.0 * dt) * (3.0 * y(index) - 4.0 * y(index - 1) + y(index - 2));

  # Derivada cetral
  else
    result = 1.0 / (2.0 * dt) * (y(index + 1) - y(index - 1));
  endif

endfunction


function [result] = compound_simpson(y, dt)
  n = length(y);
  accum = y(1) + y(n);

  # Suma impares (suponiendo que empieza desde el indice 0)
  for i = 2 : 2 : n -1
    accum += 4.0 * y(i);
  endfor

  # Suma pares (suponiendo que empieza desde el indice 0)
  for i = 3 : 2 : n - 1
    accum += 2.0 * y(i);
  endfor

  result = (dt / 3.0) * accum;

endfunction


function [result] = g(t)
  # g es una función por partes, es por eso que la defino
  # con una función
  result = 0.0;
  if (t <= 50)
    result = 1.0 - t / 50.0;
  endif
endfunction

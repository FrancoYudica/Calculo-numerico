function ejericicio_runge_kutta_sistema_parcial


  ti = 0.0;
  tf = 10000.0;
  dt = 100.0;
  t = ti : dt : tf;

  # Constant
  td = 2.0 / 1000.0;

  K = 1e-3 * [-8, 4, 0, 0, 0, 0
        4,-8, 4, 0, 0, 0
        0, 4,-8, 4, 0, 0
        0, 0, 4,-8, 4, 0
        0, 0, 0, 4,-8, 4
        0, 0, 0, 0, 4,-3
  ];

  y(:, 1) = zeros(6, 1);

  w = 1.0;

  for i = 2 : length(t)
    yk = y(:, i - 1);
    tk = t(i - 1);

    # Calculates K1, but slope is requiered
    bk = [4.0 * cos(td * tk); 0; 0; 0; 0; 0];
    slope = K * yk + bk;
    k1 = dt * slope;

    # Calculates YG
    yg = yk + k1 * (1.0 / (2.0 * w));

    # Calculates K2
    tk_next = t(i);
    bk_next = [4.0 * cos(td * tk_next); 0; 0; 0; 0; 0];
    next_slope = K * yg + bk_next;

    k2 = dt * next_slope;

    y(:, i) = yk + (1 - w) * k1 + w * k2;

  endfor
  hold on
  plot(t, y(2, :));
  plot(t, y(6, :));
  legend("y_1", "y_2");

endfunction

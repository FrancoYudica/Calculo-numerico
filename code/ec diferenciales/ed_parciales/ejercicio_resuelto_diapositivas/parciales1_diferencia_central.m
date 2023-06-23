function parciales1_diferencia_central


    K = [2, -1, 0; -1, 2, -1; 0, -1, 2];
    M = [0.25 * 0.25, 0, 0; 0, 0.5 * 0.5, 0; 0, 0, 0.75 * 0.75];
    c = 12 / (0.25 * 0.25);

    u_0 = [sin(pi * 0.25); sin(pi * 0.5); sin(pi * 0.75)]
    du_0 = [3; 3; 3]

    dt = 0.001;
    t = 0.0 : dt : 1.0;

    start_prev = u_0 - dt * du_0 - dt * dt * 0.5 * c * inverse(M) * K * u_0;

    u = [start_prev, u_0];

    for i = 2 : length(t)
      previous = u(:, i - 1);
      current = u(:, i);

      u(:, i + 1) = (2 * eye(3) - dt * dt * c * inverse(M) * K) * current - previous;

  endfor
    plot(t, u(:, 2 : length(u)))




endfunction

# Diferential equiation
#   -d^2u(x)/dx^2 + u(x) - x = 0    (1)
#
# Edge conditions
#   u(0) = 0
#   u(1) = 0
#
# Discrete set
#   X = {0.0, 0.25, 0.5, 0.75, 1.0}
#
# Where
#   dx = 0.25
#   xs = 0.00 // Start time
#   xe = 1.00 // End time
#
# We already know u0(0) = 0 and u4(1) = 0
# then, we have to find u1(x1), u2(x2), u3(x3)
#
# Central numeric second order derivative
# d^2u(x)/dx^2 = -1 / (dx^2) * (u(xk - dx) - 2.0 * u(xk) + u(xk + dx))    (2)
#
# Replacing (2) in (1)
#
# -1 / (dx^2) * (u(xk - dx) - 2.0 * u(xk) + u(xk + dx)) + u(xk) - xk = 0
# -1 / (dx^2) * (u(xk - dx) - 2.0 * u(xk) + u(xk + dx)) + u(xk) = xk
#
# ------------------Then, repacing with x1, x2 and x3 --------------------------
#
# x1:
# -1 / (dx^2) * (u(x1 - dx) - 2.0 * u(x1) + u(x1 + dx)) + u(x1) = x1
# -1 / (dx^2) * (u(x0) - 2.0 * u(x1) + u(x2)) + u(x1) = x1
# -1 / (0.25^2) * (0.0 - 2.0 * u(x1) + u(x2)) + u(x1) = 0.25
# x2:
# -1 / (dx^2) * (u(x2 - dx) - 2.0 * u(x2) + u(x2 + dx)) + u(x2) = x2
# -1 / (dx^2) * (u(x1) - 2.0 * u(x2) + u(x3)) + u(x2) = x2
# -1 / (0.25^2) * (u(x1) - 2.0 * u(x2) + u(x3)) + u(x2) = 0.5
# x3:
# -1 / (dx^2) * (u(x3 - dx) - 2.0 * u(x3) + u(x3 + dx)) + u(x3) = x3
# -1 / (dx^2) * (u(x2) - 2.0 * u(x3) + u(x4)) + u(x3) = x3
# -1 / (0.25^2) * (u(x2) - 2.0 * u(x3) + 0.0)) + u(x3) = 0.75

# We get the following linear equiation system
# -1 / (0.25^2) * (0.0 - 2.0 * u(x1) + u(x2)) + u(x1) = 0.25
# -1 / (0.25^2) * (u(x1) - 2.0 * u(x2) + u(x3)) + u(x2) = 0.5
# -1 / (0.25^2) * (u(x2) - 2.0 * u(x3) + 0.0)) + u(x3) = 0.75

# Where we have 3 unknowns and 3 equations. Therefore, the system can be in
# matrix form, and that is what the code implements and solves

function contorno1

  M = [-2.0, 1.0, 0.0
        1.0, -2.0, 1.0
        0.0,  1.0,  -2.0];

  B = [1, 0, 0
       0, 1, 0
       0, 0, 1];

  b = [0.25; 0.5; 0.75];

  k = -1.0 / (0.25 * 0.25);

  A = k * M + B;

  u(1) = 0;
  u(5) = 0;

  u(2 : 4) = A \ b

  x = 0.0 : 0.25 : 1.0;
  plot(x, u);

endfunction

# Diferential equiation
#   -d^2u(x)/dx^2 + u(x) - x = 0    (1)
#
# Edge conditions
#   du/dx(0) = 0
#   u(1) = 4
#
# Discrete set
#   X = {0.0, 0.25, 0.5, 0.75, 1.0}
#
# Where
#   dx = 0.25
#   xs = 0.00 // Start time
#   xe = 1.00 // End time
#
# We already know and u4(1) = 4
# then, we have to find u0(x0), u1(x1), u2(x2), u3(x3)
#
# For u0 we can't use the central derivative, we use the asymetric forward second
# order derivative
# 1 / (2.0 * dx) * (-3.0 * u0 + 4.0 * u1 - u2) = 0
# 1 / 0.5 * (-3.0 * u0 + 4.0 * u1 - u2) = 0
# 2 * (-3.0 * u0 + 4.0 * u1 - u2) = 0
# (Equal to 0 for the given edge condition)
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
# -1 / (0.25^2) * (u(x0) - 2.0 * u(x1) + u(x2)) + u(x1) = 0.25
# x2:
# -1 / (dx^2) * (u(x2 - dx) - 2.0 * u(x2) + u(x2 + dx)) + u(x2) = x2
# -1 / (dx^2) * (u(x1) - 2.0 * u(x2) + u(x3)) + u(x2) = x2
# -1 / (0.25^2) * (u(x1) - 2.0 * u(x2) + u(x3)) + u(x2) = 0.5
# x3:
# -1 / (dx^2) * (u(x3 - dx) - 2.0 * u(x3) + u(x3 + dx)) + u(x3) = x3
# -1 / (dx^2) * (u(x2) - 2.0 * u(x3) + u(x4)) + u(x3) = x3
# -1 / (0.25^2) * (u(x2) - 2.0 * u(x3) + 4.0)) + u(x3) = 0.75
# -1 / (0.25^2) * (u(x2) - 2.0 * u(x3)) + u(x3) = 0.75 + 4 / (0.25^2)

# We get the following linear equiation system
# 2 * (-3.0 * u0 + 4.0 * u1 - u2) = 0
# -1 / (0.25^2) * (u0 - 2.0 * u1 + u2) + u1 = 0.25
# -1 / (0.25^2) * (u1 - 2.0 * u2 + u3) + u2 = 0.5
# -1 / (0.25^2) * (u2 - 2.0 * u3) + u3 = 0.75 + 4 / (0.25^2)

# Note that the first equation doesn't have the same coeffiecient as the others
# if we want to get the matrix form this is required. Then some refactoring is
# done to cancel out the introduced coefficient -1 / (0.25^2)

# -1 / (0.25^2) * 2.0 * (-0.25^2) * (-3.0 * u0 + 4.0 * u1 - u2) = 0
# -1 / (0.25^2) * (-0.125) * (-3.0 * u0 + 4.0 * u1 - u2) = 0
# -1 / (0.25^2) * (-0.125 * -3.0 * u0 -0.125 * 4.0 * u1 + 0.125 * u2) = 0

# Now, the system is
# -1 / (0.25^2) * (-0.125 * -3.0 * u0 -0.125 * 4.0 * u1 + 0.125 * u2) = 0
# -1 / (0.25^2) * (u0 - 2.0 * u1 + u2) + u1 = 0.25
# -1 / (0.25^2) * (u1 - 2.0 * u2 + u3) + u2 = 0.5
# -1 / (0.25^2) * (u2 - 2.0 * u3) + u3 = 0.75 + 4 / (0.25^2)

# Where we have 4 unknowns and 4 equations. Therefore, the system can be in
# matrix form, and that is what the code implements and solves

function contorno1

  M = [-0.125 * -3.0, -0.125 * 4.0, 0.125, 0.0
        1.0, -2.0, 1.0, 0.0
        0.0, 1.0, -2.0, 1.0
        0.0, 0.0, 1.0, -2.0]


  B = [0, 0, 0, 0
       0, 1, 0, 0
       0, 0, 1, 0
       0, 0, 0, 1];

  b = [0.0; 0.25; 0.5; 0.75 + 4.0 / (0.25 * 0.25)];

  k = -1.0 / (0.25 * 0.25);

  A = k * M + B;

  u(5) = 4;

  u(1 : 4) = A \ b

  x = 0.0 : 0.25 : 1.0;
  plot(x, u);

endfunction

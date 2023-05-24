function sistema_diferencia_central
  
  ti = 0;
  tf = 2;
  dt = 0.01;
  
  t = ti : dt : tf;
  
  # Matrices
  M = [1, 0, 0; 0, -1, 0; 0, 0, 2];
  C = [4, 0, 0; 0, -1, 0; 0, 0, 3];
  K = [0, 4, 1; 4,  2, 0; 1, 0, 1];
  
  # Independent vector of functions
  R = {
    @(t)(5.0 * exp(t) + 8.0 * exp(2.0 * t) + cos(t));
    @(t)(-8.0 * exp(2.0 * t) + 4.0 * exp(t));
    @(t)(-cos(t) - 3.0 * sin(t) + exp(t))
  };
  
  f0 = [1; 2; 1];  # Initial condition f(t0)
  df0 = [1; 4; 0]; # Initial condition df(t0)/dt
 
  # Precalculates the requiered matrices
  G = inverse(M + dt * 0.5 * C);
  D = G * (2 * M - dt * dt * K);
  H = G * (dt * 0.5 * C - M);
   
  # 1) Calculates the initial value
  second_derv = inverse(M) * (eval_R(R, t(1)) - C * df0 - K * f0);
  fprev = f0 - dt * df0 + dt * dt * 0.5 * second_derv;
    
  # The first and second value are already calculated and given
  values = [fprev, f0];
  
  for i = 2 : length(t) 
    
    # b can't be precalculated, because t parameter is requiered
    b = dt * dt * G * eval_R(R, t(i)); 
   
    previous = values(:, i - 1);
    current = values(:, i);
    
    values(:, i + 1) = b + D * current + H * previous; 
  endfor
  
  # Values is an array of vectors
  values
  
  # Removes the first vector from the array
  sub_values = values(:, 2 : length(values));
  
  # Plots all the components of the vector
  # plots like 3 plots of simple arrays
  plot(t, sub_values);
  
  
  
endfunction


function [result] = eval_R(R, t)
  # Returns a column vector containing 
  # all the functions evaluated in t
  result = [];
  for i = 1 : length(R)
    result(i, 1) = R{i}(t);
  endfor
  
endfunction

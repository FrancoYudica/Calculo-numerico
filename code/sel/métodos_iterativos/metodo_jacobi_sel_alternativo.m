



function metodo_jacobi_sel_alternativo

    A =  [-3, 1, -2
           4, -5, 0
           1, -3, 6];
    b = [1; 2; 3];
    [T, c] = alternative_jacobi(A, b)



endfunction


function [T, c] = alternative_jacobi(A, b)
  # Splits the martix in the diagonal D and the complementary B
  # The order of the matrix should be nxn
  n = rows(A);

  # c = D^-1 * b
  # that's why ci = bi / Aii
  c = b;
  for i=1 : n
    c(i) = c(i) / A(i, i);
  endfor

  # T = -D*-1 * B
  # where B = A - D
  T = zeros(n, n):



endfunction


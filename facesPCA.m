function retval = facesPCA (L, J, k)
  [n1, n2, n3] = size(L);

  min = 1e+14 ;

  I = zeros(n1*n3, n2);
  A = zeros(n1*n3, n2);
  M = zeros(n1*n3, 1);

  for i = 1 : n2
    I(:, i) = vec(squeeze(L(:, i, :)));
  end

  for i = 1 : n2
    M += squeeze(I(:, i));
  end
  M /= n2;

  for i = 1 : n2
    A(:, i, :) = I(:, i) - M;
  end

  [U, ~, ~] = svd(A);

  G = U(:, 1:k)' * A;
  T = vec(J) - M;

  C = U(:, 1:k)' * T;

  indeks = 0 ;
  for j = 1 : n2

    norma = norm(C - G(:, j), "fro") ;

    if (norma < min)
      min = norma ;
      indeks = j ;
    end

  end
  printf("Frobeniusova norma u metodi PCA za sliku iznosi: %f\n", min);
  retval = squeeze(L(:, indeks, :)) ;


end

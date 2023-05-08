function [U, S, V] = tsvd(A) ;

    tic
    [l, m, n] = size(A) ;
    A_fft = fft(A, [], 3) ;
    U_fft = zeros(l, l, n) ;
    S_fft = zeros(l, m, n) ;
    V_fft = zeros(m, m, n) ;

    pom = ceil((n+1)/2) ;
##    for i = 1 : n
##      [U_fft(:, :, i), S_fft(:, :, i), V_fft(:, :, i)] = svd(squeeze(A_fft(:, :, i))) ;
##      V_fft(:, :, i) = V_fft(:, :, i)' ;
##    end
    for i = 1 : pom
        [U_fft(:, :, i), S_fft(:, :, i), V_fft(:, :, i)] = svd(squeeze(A_fft(:, :, i))) ;
        V_fft(:, :, i) = V_fft(:, :, i)' ;
    end

    for i = pom + 1 : n
      U_fft(:, :, i) = conj(U_fft(:, :, n-i+2));
      S_fft(:, :, i) = conj(S_fft(:, :, n-i+2));
      V_fft(:, :, i) = conj(V_fft(:, :, n-i+2));
    end


    U = ifft(U_fft, [], 3) ;
    S = ifft(S_fft, [], 3) ;
    V = ifft(V_fft, [], 3) ;

    toc

end

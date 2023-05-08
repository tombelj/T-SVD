function [C] = ten_ten_prod( A, B )

    l = size(A, 1) ;
    m = size(B, 2) ;
    n = size(A, 3);
    
    A_fft = fft(A, [], 3) ;
    B_fft = fft(B, [], 3) ;
    C_fft = zeros(l, m, n) ;
    for i = 1 : n
        C_fft(:, :, i) = A_fft(:, :, i) * B_fft(:, :, i) ;
    end
    
    C = ifft(C_fft, [], 3) ;


end

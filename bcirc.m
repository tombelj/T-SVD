function [bcirc_A] = bcirc(A) 

    [l, m, n] = size(A) ;
    
    s = eye(n, n) ;
    bcirc_A = zeros(l*n, m*n) ;
    
    for i = 1 : n
        
        S = gallery('circul', s(i, :)')' ;
        bcirc_A = bcirc_A + kron(S, A(:, :, i)) ;
        
    end



end
function x = MNK(A, b)
   
[Q, R, P] = qr(A) ;
x = P\(R\(Q'*b)) ;


end

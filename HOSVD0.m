function [ S, U1, U2, U3 ] = HOSVD0( A )
% Racuna HOSVD tenzora A.
%
% Dio nastavnog materijala na  
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% A - tenzor reda 3 
% Izlazni parametri
% =================
% S - jezgreni tenzor, istih dimenzija kao i A 
% U1, U2, U3 - ortogonalne matrice 
% Vrijedi A = S x_1 U1 x_2 U2 x_3 U3
%.......................................................................... 
[n1,n2,n3] = size(A) ; 

[ U1, ~, ~ ] = svds( unfold( A, 1),min(n1,n2*n3) ) ;
[ U2, ~, ~ ] = svds( unfold( A, 2),min(n2,n1*n3) ) ;
[ U3, ~, ~ ] = svds( unfold( A, 3),min(n3,n1*n2) ) ;

S = ten_mat_mult(ten_mat_mult(ten_mat_mult(A,U1',1),U2',2),U3',3) ; 

end
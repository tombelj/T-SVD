clear ;
close all ; 
clc ;


a = load('Yale_64x64.mat') ;
A = a.fea ;
b = a.gnd ;

%imagesc(reshape(A(100, :), 64, 64));
%colormap(gray);

T = zeros(4096, 11, 15) ;

for i = 1 : 15 
    for j = 1 : 11
        
        T(:, j, i) = A(11*(i-1)+j, :);
        
    end
    
end

z = T(:, 5, 2) ;
figure,
imagesc(reshape(z, 64, 64));
colormap(gray);

T(:, 5, :) = [] ;

%imagesc(reshape(T(:, 1, 1), 64, 64));
%colormap(gray);

 [S, F, G, H] = HOSVD0(T);
 
 D = ten_mat_mult(S, F, 1) ;
 C = ten_mat_mult(D, G, 2) ;

[ni, ne, np] = size(T) ;



K_z = [] ;
br = 1 ;
M = zeros(np, ne) ;
min = 500 ;
indeks = 0 ;
for i = 1 : ne
    
    C_e = squeeze(C(:, i, :)) ;
    
    x = MNK(C_e, z) ;
    x = x/norm(x) ;
    
    for j = 1 : np 
        rez = norm(x - H(j, :)');
        M(j, i) = rez ;
        if(rez < min)
            min = rez ;
            indeks = j ;
        end
        if(rez <= 1)
            K_z(br) = j ;
            br = br + 1 ;
        end 
    end
end


figure,
imagesc(M) ;

figure,
imagesc(reshape(T(:, 1, indeks), 64, 64));
colormap(gray);

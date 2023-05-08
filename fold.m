function T = fold( M, mode, dT )
% Matricu M prepakira u tenzor reda tri s dimenzijama danim u deskriptoru
% dT.
%
% Dio nastavnog materijala na  
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% M    - matrica ciji stupci postaju niti u modu "mode" izlaznog tenzora T
% mode - mod u kojem radimo transformaciju
% dT   - dimenzije ciljanog tenzora reda tri, dT(1) x dT(2) x dT(3) 
% Izlazni parametri
% =================
% T    - tenzor dimenzija danih u polju dT, cije niti u modu "mode" su
%        stupci ulazne matrice M. Transformacija je uskladjena s definicijom 
%        funkcije unfold.
%..........................................................................
n1 = dT(1) ;
n2 = dT(2) ;
n3 = dT(3) ;
T = zeros( n1, n2, n3 ) ; 
% 
if ( mode == 1 )
    for i = 1 : n2
      T(:,i,:) = M(:, ((i-1)*n3 + 1):(i*n3));
    end
elseif ( mode == 2 )
    for i = 1:n3
      T(:,:,i) = M(:, ((i-1)*n1 + 1):(i*n1))';
    end
elseif ( mode == 3 )
    for i = 1:n1
      T(i,:,:) = M(:, ((i-1)*n2 + 1):(i*n2))';
    end
end
end
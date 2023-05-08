function M = unfold( T, mode )
% Transformira tenzor T reda 3 u matricu operacijom unfold u zadanom modu.
%
% Dio nastavnog materijala na  
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% T    - tenzor reda 3 
% mode - mod u kojem  radimo unfold
% Izlazni parametri
% =================
% M    - matrica ciji su stupci niti u modu "mode" u odabranom poretku
%..........................................................................
if ( mode == 1 )
    % niti u modu 1, uzete redom po lateralnim odsjeccima
    M = squeeze( T(:,1,:) ) ; % funkcija squeeze eliminira dimenziju tenzora
                              % ako je jednaka jedan, tj. lateralni slice
                              % formalno pretvara u matricu.
    for i = 2 : size(T,2)
      M = [M squeeze(T(:,i,:)) ] ;
    end
elseif ( mode == 2 )
    M = T(:,:,1)' ;
    for i = 2 : size(T,3)
      M = [ M T(:,:,i)' ];
    end
elseif ( mode == 3 )
    M = shiftdim( T(1,:,:), 1 )' ;
    for i = 2 : size(T,1)
      M = [ M shiftdim( T(i,:,:), 1 )' ] ;
    end
end
end
  
        
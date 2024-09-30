%% Función para cálculo de síndromes en GF(2^6)
% Entradas: celda r(x), 2t
% Salida: Vector de sindromes en notación de potencias
function sindrom = SindromGF26(r_x,t2)
    sindrom = zeros(1,t2);
    for i_s = 1:t2
        for i_x = 0:numel(r_x)-1
            if i_x == 0
                sindrom(i_s) = potGF26(r_x{ i_x+1 }); %valor en posición x^0
            else
                if potGF26(r_x{ i_x+1 }) ~= -1                                                % a^n (a^i)^x
                    pot_aux = i_s * i_x;                                                    %      a^(i*x)
                    [ ~ ,   pot_aux    ] = mult_pot_GF26( potGF26(r_x{ i_x+1 }),pot_aux,0 );  % a^[n+(i*x)]
                    [ ~ , sindrom(i_s) ] = sum_pot_GF26( sindrom(i_s),pot_aux );            % acc_a + a^[n+(i*x)]
                end
            end
        end
    end 
end
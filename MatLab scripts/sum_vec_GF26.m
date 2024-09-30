%% Función de suma a partir de un par de vectores binarios GF(2^6)
function [vec_bin, pot] = sum_vec_GF26(vec_1, vec_2)
    vec_bin = double( xor(vec_1,vec_2) );
    pot = potGF26(vec_bin);
end
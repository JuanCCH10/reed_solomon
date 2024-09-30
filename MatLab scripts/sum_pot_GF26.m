function [vec_bin, pot] = sum_pot_GF26(pot_1, pot_2)
    % a = mod(pot_1,63);
    % b = mod(pot_2,63);
    vec_1 = alphaGF26(pot_1);
    vec_2 = alphaGF26(pot_2);
    vec_bin = double( xor(vec_1,vec_2) );
    pot = potGF26(vec_bin);
end
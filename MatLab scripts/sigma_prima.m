%% sigma'(beta_k^-1)
% Entradas: Et, beta_pot
function sigma_pot = sigma_prima(beta_pot,v)
    Et = numel(beta_pot);
    sigma_pot = zeros(1,numel(beta_pot));
    for k_beta = 1:Et
        if Et == 1
            sigma_pot = beta_pot(Et);
        else
            sigma_pot(k_beta) = beta_pot(k_beta);
            for i_b = 1:v
                if i_b ~= k_beta
                    if i_b > Et
                        aux_pot = 0;
                        [ ~ , sigma_pot(k_beta) ] = mult_pot_GF26( sigma_pot(k_beta),aux_pot,0 );
                    else
                        aux_beta = beta_pot( i_b );
                        [ ~ ,     aux_pot       ] = mult_pot_GF26( aux_beta,-1*beta_pot(k_beta),1 ); %beta_k^-1
                        [ ~ ,     aux_pot       ] = sum_pot_GF26( 0,aux_pot );
                        [ ~ , sigma_pot(k_beta) ] = mult_pot_GF26( sigma_pot(k_beta),aux_pot,0 );
                    end
                end
            end
        end
    end
end
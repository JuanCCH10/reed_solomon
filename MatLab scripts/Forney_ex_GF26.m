function [ex_vec,ex_pot] = Forney_ex_GF26(sind_pot, v, sigm_pot, beta_pot, Et)   
    %% Z0(X)
    Z0 = zeros(1,v-1);
    for i_x = 0:v-1
        if i_x == 0
            Z0(i_x + 1) = sind_pot(i_x + 1);
        else
            i_sind = i_x + 1;
            i_sigm = 0;
            while i_sind ~= 0
                if i_sigm == 0
                    Z0(i_x + 1) = sind_pot(i_sind);
                    i_sind = i_sind -1;
                    i_sigm = i_sigm +1;
                else
                    if (sigm_pot(i_sigm) ~= -1) && (sind_pot(i_sind) ~= -1)
                        [ ~ ,   aux_pot   ] = mult_pot_GF26( sigm_pot(i_sigm),sind_pot(i_sind),0 );
                        [ ~ , Z0(i_x + 1) ] = sum_pot_GF26( Z0(i_x + 1),aux_pot );
                        i_sind = i_sind -1;
                        i_sigm = i_sigm +1;
                    else
                        i_sind = i_sind -1;
                        i_sigm = i_sigm +1;
                    end
                end
            end
        end
    end
      coef = Z0

    %% sigma'(beta_k^-1)
    sigma_pot = sigma_prima(beta_pot,v);
%      sigma_pot

    %% delta(beta_i)
    delta_pot = zeros(1,Et);
    z0_pot = zeros(1,numel(beta_pot));
    disp("| idx beta | beta | beta_k^-1 | (beta_k^-1)^n | z0(beta_k^-1) |")
    for i_beta = 1:Et
    % Evaluar Z0(beta_i^-1)
        for i_z = 1:numel(Z0)
            if i_z == 1
                z0_pot(i_beta) = Z0( i_z );
            else
                if Z0(i_z) ~= -1
                    aux_pot                 = ( i_z-1 ) * ( -1*beta_pot(i_beta) ); %beta_k^-1
                    [ ~ ,    aux_pot2    ]  = mult_pot_GF26( Z0(i_z),aux_pot,1 );
                    [ ~ , z0_pot(i_beta) ]  = sum_pot_GF26( z0_pot( i_beta ),aux_pot2 );
                end
            end
        end
    % Dividir Z0(beta_k^-1) / sigma'(beta_k^-1)
        [i_beta, beta_pot(i_beta), -1*beta_pot(i_beta), aux_pot, z0_pot(i_beta)]
        [ delta_vec{i_beta} , delta_pot(i_beta) ] = mult_pot_GF26( z0_pot(i_beta),-1*sigma_pot(i_beta),1 );
    end
    ex_vec = delta_vec;
    ex_pot = delta_pot;
end
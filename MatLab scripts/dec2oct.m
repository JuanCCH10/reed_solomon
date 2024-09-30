%% Funcion traductor notacion decimal -> octal GF26
function octal = dec2oct(decimal)
    decimal_v = 0:62;
    octal_v = [1 2 4 10 20 40 3 6 14 30 60 43 5 12 24 50 23 46 17 36 74 73 65 51 21 42 7 16 34 70 63 45 11 22 44 13 26 54 33 66 57 35 72 67 55 31 62 47 15 32 64 53 25 52 27 56 37 76 77 75 71 61 41];
    if decimal == -1
        octal = 00;
    else
        decimal_acot = mod(decimal,63);
        bool_v = decimal_v == decimal_acot;
        mask = octal_v .* bool_v;
        octal = sum(mask);
    end
end
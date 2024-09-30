%% Esta función recibe el valor decimal de potencia de un alfa y regresa el
%  vector binario correspondiente a dicha potencia de alpha
function vec_bin = alphaGF26(pot_val)
    gf_26 = {[0,0,0,0,0,1] [0,0,0,0,1,0] [0,0,0,1,0,0] [0,0,1,0,0,0] [0,1,0,0,0,0] [1,0,0,0,0,0] [0,0,0,0,1,1] [0,0,0,1,1,0] [0,0,1,1,0,0] [0,1,1,0,0,0] [1,1,0,0,0,0] [1,0,0,0,1,1] [0,0,0,1,0,1] [0,0,1,0,1,0] [0,1,0,1,0,0] [1,0,1,0,0,0] [0,1,0,0,1,1] [1,0,0,1,1,0] [0,0,1,1,1,1] [0,1,1,1,1,0] [1,1,1,1,0,0] [1,1,1,0,1,1] [1,1,0,1,0,1] [1,0,1,0,0,1] [0,1,0,0,0,1] [1,0,0,0,1,0] [0,0,0,1,1,1] [0,0,1,1,1,0] [0,1,1,1,0,0] [1,1,1,0,0,0] [1,1,0,0,1,1] [1,0,0,1,0,1] [0,0,1,0,0,1] [0,1,0,0,1,0] [1,0,0,1,0,0] [0,0,1,0,1,1] [0,1,0,1,1,0] [1,0,1,1,0,0] [0,1,1,0,1,1] [1,1,0,1,1,0] [1,0,1,1,1,1] [0,1,1,1,0,1] [1,1,1,0,1,0] [1,1,0,1,1,1] [1,0,1,1,0,1] [0,1,1,0,0,1] [1,1,0,0,1,0] [1,0,0,1,1,1] [0,0,1,1,0,1] [0,1,1,0,1,0] [1,1,0,1,0,0] [1,0,1,0,1,1] [0,1,0,1,0,1] [1,0,1,0,1,0] [0,1,0,1,1,1] [1,0,1,1,1,0] [0,1,1,1,1,1] [1,1,1,1,1,0] [1,1,1,1,1,1] [1,1,1,1,0,1] [1,1,1,0,0,1] [1,1,0,0,0,1] [1,0,0,0,0,1]};
    switch pot_val
        case 0
            vec_bin = gf_26{1};
        case 1
            vec_bin = gf_26{2};
        case 2
            vec_bin = gf_26{3};
        case 3
            vec_bin = gf_26{4};
        case 4
            vec_bin = gf_26{5};
        case 5
            vec_bin = gf_26{6};
        case 6
            vec_bin = gf_26{7};
        case 7
            vec_bin = gf_26{8};
        case 8
            vec_bin = gf_26{9};
        case 9
            vec_bin = gf_26{10};
        case 10
            vec_bin = gf_26{11};
        case 11
            vec_bin = gf_26{12};
        case 12
            vec_bin = gf_26{13};
        case 13
            vec_bin = gf_26{14};
        case 14
            vec_bin = gf_26{15};
        case 15
            vec_bin = gf_26{16};
        case 16
            vec_bin = gf_26{17};
        case 17
            vec_bin = gf_26{18};
        case 18
            vec_bin = gf_26{19};
        case 19
            vec_bin = gf_26{20};
        case 20
            vec_bin = gf_26{21};
        case 21
            vec_bin = gf_26{22};
        case 22
            vec_bin = gf_26{23};
        case 23
            vec_bin = gf_26{24};
        case 24
            vec_bin = gf_26{25};
        case 25
            vec_bin = gf_26{26};
        case 26
            vec_bin = gf_26{27};
        case 27
            vec_bin = gf_26{28};
        case 28
            vec_bin = gf_26{29};
        case 29
            vec_bin = gf_26{30};
        case 30
            vec_bin = gf_26{31};
        case 31
            vec_bin = gf_26{32};
        case 32
            vec_bin = gf_26{33};
        case 33
            vec_bin = gf_26{34};
        case 34
            vec_bin = gf_26{35};
        case 35
            vec_bin = gf_26{36};
        case 36
            vec_bin = gf_26{37};
        case 37
            vec_bin = gf_26{38};
        case 38
            vec_bin = gf_26{39};
        case 39
            vec_bin = gf_26{40};
        case 40
            vec_bin = gf_26{41};
        case 41
            vec_bin = gf_26{42};
        case 42
            vec_bin = gf_26{43};
        case 43
            vec_bin = gf_26{44};
        case 44
            vec_bin = gf_26{45};
        case 45
            vec_bin = gf_26{46};
        case 46
            vec_bin = gf_26{47};
        case 47
            vec_bin = gf_26{48};
        case 48
            vec_bin = gf_26{49};
        case 49
            vec_bin = gf_26{50};
        case 50
            vec_bin = gf_26{51};
        case 51
            vec_bin = gf_26{52};
        case 52
            vec_bin = gf_26{53};
        case 53
            vec_bin = gf_26{54};
        case 54
            vec_bin = gf_26{55};
        case 55
            vec_bin = gf_26{56};
        case 56
            vec_bin = gf_26{57};
        case 57
            vec_bin = gf_26{58};
        case 58
            vec_bin = gf_26{59};
        case 59
            vec_bin = gf_26{60};
        case 60
            vec_bin = gf_26{61};
        case 61
            vec_bin = gf_26{62};
        case 62
            vec_bin = gf_26{63};
        otherwise
            vec_bin = [0 0 0 0 0 0];
    end
end
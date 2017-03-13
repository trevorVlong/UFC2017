%Plane Vanilla 

%Payload
    str = load('Master_Constant.mat');
        %contains all constants from primary doc, can be changed
    [AR, S, cavg] = ARSspace(Str.c_function, str.b);
        %finds Aspect Ratio, Planform area, and average chord length
    [W_wing,W_body] = Weighing(str.rho, cavg, str.tau, str.b, str.W_fuse);
        %finds Wing weight and Plane body weight
        
    %%%% Make a new function to create the parts for this
    W_payd = ((((str.CDA_0)/S)/(str.C_L))+(str.c_d)/(str.C_L)+(Str.C_L)/(pi*AR*str.e));
    
    
    W_pay = str.T_max/(W_payd)-W_body;
        %finds payload weight in terms of AR and S
    W_pay = double(W_pay);
        %converts answer to decimal instead of fraction
    
    
%Tip Deflection

    [delta, M0, I0] = WingBend(str.E,str.tau,str.epsilon,str.c_t,str.c_r,str.b,str.N,str.W_fuse,W_pay);  
        %gets Moment, Bending inertia, and deflection of wingtip

    d_span = double(delta/Str.b); 
        %gets tip-deflection to wingspan ratio
    
%Constrained Back-solving

%Bending-Constrained d_span2 >= .1 C_L = .8

    C_L2 = .8; 
        %lift coefficient
    d_spand2 = .1 ; 
        %tip deflection ratio
    [Wpay_tc,delta2,M02] = defweight(I0,1,d_spand2,Str.b,Str.lambda,Str.W_fuse);
        %returns bending-constrained payload, tip deflection, and Moment
    
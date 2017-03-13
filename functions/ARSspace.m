%AR, S design Space solver
%solves for AR, S and other dependents

function [AR, S, cavg] = ARSspace(chord_function, b)
    
    syms x;
    cavg = 2/b*int(chord_function,x,0,b/2); %solves for average chord length
    
    S = cavg*b; %gets planform area of wing
    
    AR = (b^2)/S; %gets aspect ratio of wing
end
    
    
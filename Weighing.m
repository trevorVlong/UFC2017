%Wing Mass calculator function of density, avg chord, and wingspan
function [W_wing, W_body] = Weighing(rho, c, tau , b, W_fuse)
    A = .60 * c^2 * tau; %cross sectional area
    
    W_wing = rho*A*b*9.81; %integral (technically)
    
    W_body = W_fuse+W_wing; %finds total plane body mass
end    
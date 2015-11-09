function [J] = hoistLoad(weigth, height, eta)
    % The function calculates the amount of energy used for the hoisting
    % operation. It takes the lifting weigth, the lifting heigth and the
    % efficiency for the whole system as input parameters (including
    % electric motor, friction etc.). The output is energy, and it is with
    % negative sign since the hoisting operation takes energy from one
    % source and store it as potential energy in the container. SI unit is
    % assumed.
    
    Ep = potentialEnergy(weigth,height);    % The potential energy
    
    lift = Ep/eta;     % Calculates how much energy that is needed with 
                       % respect taken to the effiency of the system.
                                          
    J = -lift;
end
    
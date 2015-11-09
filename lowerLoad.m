function [J] = lowerLoad(weigth, height, eta)
    % The function calculates the amount of energy released from the 
    % lowering operation. It takes the weigth that is to be lowered, the
    % heigth it is lowered and eta is the effiency of the system. Effiency in this
    % case means the energy that is released in a controlled manner (in
    % contrary to unspecified friction etc.). The function returns the
    % energy released. SI units i assumed.
    
    Ep = potentialEnergy(weigth,height);    % The potential energy
    
    lower = Ep*eta;     % Calculates how much energy that is released with 
                        % respect taken to the effiency of the system.
    J = lower;
end
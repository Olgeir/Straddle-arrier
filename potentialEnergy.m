function [potentialEnergy] = potentialEnergy(mass, height) 
    % Calculates the potential energy for a given weigth and heigth 
    % (compared to an unknown reference heigth). SI units is assumed, which
    % means mass in [kg], height in [m] and potential energy in [J].

    g = 9.81; % [m/s^2] gravity
    potentialEnergy = mass*g*height; 
end
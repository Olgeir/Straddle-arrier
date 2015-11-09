function [acc, const, dec, accTime, driveTime, decTime] = moveCSC(load)
    % This function is used to simulate how much energy is used to move a
    % container from one place to another. The input is the weigth of the
    % load. The output is in J

    % To ease things, these constants are used for the effect needed in the
    % driving cycle. The figures comes from Maija Tuomi
    drive = 100e3; % [W], the effect needed to drive the Straddle carrier in 30 km/h
    accel = 200e3; % [W] the effect needed to accelerate the straddle carrier
    decel = 100e3; % [W] the effect needed to decelerate the straddle carrier
    
    accTime = 10; % [s] the time the CSC is accelerating, when UNLOADED
    accTimeLoad = 15; % [s] the time the CSC is accelerating, when LOADED
    driveTime = 45; % [s] the time the CSC is driving with constant speed
    decTime = 10; % [s] the time the CSC is decelerating, when UNLOADED
    decTimeLoad = 15; % [s] the time the CSC is decelerating, when LOADED
    
    if load>0
        
        accTime = accTimeLoad;
        decTime = decTimeLoad;
    end
    % Calculates the sum of the energy that is used when in the different phases
    % when moving the CSC
    acc = accTime*accel;
    const = driveTime*drive;
    dec = decTime*decel;
    
end
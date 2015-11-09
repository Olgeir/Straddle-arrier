%% Load cycle
% This script intends to simulate a load cycle.
% The load cycle implemented is from Maija Tuomi.

clc
clear all
close all
% The following is 1-3 in Tuomi
[acc, const, dec, accTime, driveTime, decTime] = moveCSC(0);
Energy = [acc, const, dec];
Time = [accTime, driveTime, decTime];
deceleration = [dec];

% The following is 4 in Tuomi
Energy = [Energy, hoistLoad(25e3, 0.5, 1)];
Time = [Time, 2];

% The following is 5-7 in Tuomi
[acc, const, dec, accTime, driveTime, decTime] = moveCSC(25e3);
Energy = [Energy, acc, const, dec];
Time = [Time, accTime, driveTime, decTime];
deceleration = [deceleration, dec];

% The following is 8 in Tuomi
lower = lowerLoad(25e3, 0.5, 1);
Energy = [Energy, lower];
Time = [Time, 2];
lowering = lower;

% These six following lines is an approximation of the corner case 
% in Tuomi 9-13
[acc, const, dec, accTime, driveTime, decTime] = moveCSC(0);
Energy = [Energy, acc, const, dec];
Time = [Time, accTime, driveTime, decTime];
deceleration = [deceleration, dec];
[acc, const, dec, accTime, driveTime, decTime] = moveCSC(0);
Energy = [Energy, acc, const, dec];
Time = [Time, accTime, driveTime, decTime];
deceleration = [deceleration, dec];

% The following is 14 in Tuomi
Energy = [Energy, hoistLoad(25e3, 0.5, 1)];
Time = [Time, 2];

% The following is 15-18 in Tuomi
% Number 17 in Tuomi is put after the moving operation, i.e. 
% the hoist is done after the carrier has stopped moving, because that was
% easier to implement with the defined functions. This gives one more
% element in the time and energy vectors than Toumi have, that's why they
% are 21 elements instead of 20.
[acc, const, dec, accTime, driveTime, decTime] = moveCSC(25e3);
Energy = [Energy, acc, const, dec];
Time = [Time, accTime, driveTime, decTime]; 
deceleration = [deceleration, dec];

Energy = [Energy, hoistLoad(25e3, 2.9, 1)];
Time = [Time, 2];

% The following is 19 in Tuomi
lower = lowerLoad(25e3, 0.5, 1);
Energy = [Energy, lower];
Time = [Time, 2];
lowering = [lowering, lower];

% The following is 20 in Tuomi
standby = 30e3*225; % Stand-by time according to Tuomi's cycle
Energy = [Energy standby];
Time = [Time, 225];

cumsum(lowering)
cumsum(deceleration)
plot(cumsum(Time), Energy)  %The cumulative sum is used, since time of each 
                            % operation is added all the time
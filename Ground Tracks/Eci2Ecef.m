function [r_ecef, v_ecef] = Eci2Ecef(ECI, GST, v_eci)
% Purpose:  This function rotates Earth Centered Inertial (ECI) coordinates to Earth
%           Centered Earth Fixed (ECEF) coordinates via the Greenwich Sideral Time
%           hour angle (GST).

%Checking number of inputs for errors
if nargin < 2 || nargin > 3
    error('Incorrect number of inputs.  See help eci2ecef.')
end

[b,n] = size(ECI);
%Checking to see if length of ECI matrix is the same as the length of the GST vector
if n ~= length(GST)
    error('Size of ECI vector not equal to size of GST vector.  Check inputs.')
end

%Checking to see if the ECI vector has 3 elements
if b ~= 3
    error('ECI vector must have 3 elements to the vector (X,Y,Z) coordinates')
end

r_ecef = zeros(n, 3);
v_ecef = zeros(n, 3);

r_ecef = R3(GST)*ECI;
end
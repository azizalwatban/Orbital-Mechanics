function [R, V] = OE2Eci(a, e, i, omega, w, f, mu)

if nargin == 6 
    mu = 398600;
end

if f>7
    f = f/180*pi;
end
if i>7
    i = i/180*pi;
end
if omega>7
    omega = omega/180*pi;
end
if w>7
    w = w/180*pi;
end

R = zeros(3, 1);
V = zeros(3, 1);

p = a*(1-e^2);
r = p/(1+e*cos(f));
h = sqrt(mu*p);

% Creating the position vector in perifocal frame
r_peri(1,1) = r*cos(f);
r_peri(2,1) = r*sin(f);
r_peri(3,1) = 0;

% Creating the velocity vector in perifocal frame
v_peri(1,1) = -mu/h * sin(f);
v_peri(2,1) = mu/h * (e+cos(f));
v_peri(3,1) = 0;

% Rotating to ECI frame
R = R3(-omega)*R1(-i)*R3(-w) * r_peri;
V = R3(-omega)*R1(-i)*R3(-w) * v_peri;


end
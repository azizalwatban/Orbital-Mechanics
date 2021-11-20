function groundTrack(a, e, i, omega, w, f, n)
% a : semi-major axis
% e : eccentricity
% i : inclination
% omega: longitude of ascending node
% w : argument of perapsis
% f : true anamoly
% n : number of orbits


cd ../
file = readmatrix("world_coastline_low.txt");
plot(file(:,1), file(:,2), 'LineWidth',2)

w_earth = 15.04*pi/3600/180;
mu = 398600;

cd 'Orbital Functions'/

[r0, r_dot0] = OE2Eci(a,e,i,omega, w, f);

Y0 = [r0; r_dot0];
period = 2*pi*sqrt(a^3/mu);
tspan = 0:20:period*n;

[t, Y] = ode45(@odeFun, tspan, Y0);

theta = w_earth * (t);
r_eci = Y(:, 1:3);

lat = zeros(length(theta),1);
long = zeros(length(theta),1);
for i = 1:length(theta)
    if theta(i) > 2*pi
        theta = theta - 2*pi;
    end
    [r_ecef(i, :), ~] = Eci2Ecef(transpose(r_eci(i,:)), theta(i));

    % Converting from ECEF to latitude and longitude in spherical coords
   
    [lat(i), long(i)] = ECEF2LatLong(r_ecef(i, :), theta(i));
%     [Theta1(i), phi(i), R(i)] = cart2sph(r_ecef(i,1), r_ecef(i,2), r_ecef(i,3));
end
% Theta: latitude
hold on
long = long/pi*180;
lat = lat/pi*180;

scatter(long, lat)
xlabel("longitude [deg]")
ylabel("latitude [deg]")
set(gca, 'FontSize', 15)


%% Functions:
function dydt = odeFun(t, r)
rPos = r(1:3);
rVel = r(4:6);
mu = 398600;

r_dd = -mu/(norm(rPos)^3) * rPos;
dydt = [rVel;  r_dd];
end

end
function [lat, long] = ECEF2LatLong(r_ecef, theta)

r_delta = norm(r_ecef(1:2));

sinA = r_ecef(2)/r_delta;
cosA = r_ecef(1)/r_delta;

long = atan2(sinA, cosA);


if long < -pi
    long = long + 2*pi;
end
if long > pi
    long = long - 2*pi;
end

lat = asin(r_ecef(3)/norm(r_ecef));

end
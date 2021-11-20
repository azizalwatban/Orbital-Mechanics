clc; clear all; close all;

cd 'Orbital Functions'/
%% Problem 1:
mu = 398600;
a = 20000;
e = 0.25;
i = 40/180*pi;
omega = 300/180*pi;
w = 0;
f = 80/180*pi;
n = 2;
% Ground track plotter, here n is the number of orbits
figure;
groundTrack(a,e,i,omega,w,f, n) 




%% Problem 2: Geosynchronous orbits:
% inclination variation:
period = 23*3600 + 56*60 +4;
a = (period^2/(4*pi^2)* mu)^(1/3);
e = 0;
r = a;
i = [10, 30, 50, 70, 90];
n = 1;
j = 1;
figure;
for i = [10, 30, 50, 70, 80]
    subplot(2,3, j)
    groundTrack(a, e, i/180*pi, omega, w, f, n)
    title("Ground track for inclination = " + i + " degrees")
    j = j+1;
end

% period variation:
p = 23*3600 + 56*60 +4;
period = [p+3000, p+10000, p+20000];
a = (period.^2/(4*pi^2)* mu).^(1/3);
i = 40;
n =3;
figure;
for j = 1:length(a)
    subplot(2,2, j)
    groundTrack(a(j), e, i/180*pi, omega, w, f, n)
    title("Ground track for period = " + period(j) + " s")
end


% eccentricity variation:
period = 23*3600 + 56*60 +4;
a = (period^2/(4*pi^2)* mu)^(1/3);
i = 40;
e = [0, 0.2, 0.4, 0.7, 0.9];
figure;
for j = 1:length(e)
    subplot(2,3, j)
    groundTrack(a, e(j), i/180*pi, omega, w, f, n)
    title("Ground track for eccentricity = " + e(j))
end

cd ../

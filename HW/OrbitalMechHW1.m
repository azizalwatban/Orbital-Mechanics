%% Orbital Mechanics HW1:
%% Housekeeping:
clc; clear all; close all

%% Prolem #1: Ode45

r0 = [7642; 170; 2186]*1000;
r_dot0 = [0.32; 6.91; 4.29]*1000;
Y0 = [r0; r_dot0];
mu = 3.986*10^14;
period = 13000;
tspan = 0:10:period;

[t, Y] = ode45(@odeFun, tspan, Y0);

j=1;
for tol = [1e-3, 1e-6, 1e-12]
    mu = 3.986*10^14;
    opts = odeset('RelTol', tol, 'AbsTol', tol);
    [t, X] = ode45(@odeFun, tspan, Y0, opts);
    rPos = [X(:,1), X(:,2), X(:,3)];
    rVel = [X(:,4), X(:,5), X(:,6)];

    for i = 1:length(rVel)
        energy(i, :) = 0.5 * dot(rVel(i, :), rVel(i, :)) - mu/(norm(rPos(i,:)));
        h(i, :) = cross(rPos(i,:), rVel(i,:));
        e(i, :) =1/mu * (cross(rVel(i,:), h(i,:)) - mu * rPos(i,:) / norm(rPos(i,:)));
        h(i, :) = norm(cross(rPos(i,:), rVel(i,:)));
        eccen(i) = norm(e(i,:));
    end
 
    figure(j)
    ax1 = subplot(3,1, 1);
    plot(ax1, t, energy, 'LineWidth',2)
    grid on
    title("Specific Energy of Spacecraft Orbit as a Function of Time")

    ax2 = subplot(3,1,2);
    plot(ax2, t, h, 'LineWidth',2)
    grid on
    title("Scalar Angular Momentum as a Function of Time")

    ax3 = subplot(3,1,3);
    plot(ax3, t, eccen, 'LineWidth',2)
    grid on
    title("Eccentricity as a Function of Time")
    
    j = j+1;
end



figure(4)
plot3(Y(:,1), Y(:,2), Y(:,3), 'LineWidth',2)
grid on
title("Spacecraft Orbital Trajector")
xlabel("X [m]")
ylabel("Y [m]")
zlabel("Z [m]")


function dydt = odeFun(t, r)
rPos = r(1:3);
rVel = r(4:6);
mu = 3.986*10^14;

r_dd = -mu/(norm(rPos)^3) * rPos;
dydt = [rVel;  r_dd];
end
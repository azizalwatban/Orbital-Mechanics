clc; clear all; close all


omegaDot = 0.9856/180*pi/24/60/60;
Re = 6378;
J2 = 1.087e-3;
mu = 398600;
func = @(a,e,i) omegaDot + 3/2 * J2 * sqrt(mu) * Re^2 .* cosd(i) ./ (a.^(7/2) *(1-e.^2).^2);

hf = figure()
fimplicit3(func, [Re, Re+3000, 0, 0.3, 90, 180])
xlabel("Semi-major axis a (km)")
ylabel("Eccentricity")
zlabel("Inclination (deg)")
set(gca, 'FontSize', 15)
grid on; 

f = load('catalog_TLEs.mat');
h = f.catalog_TLEs;

for i = 1:length(h)

    temp = h(i);
    d = temp{1,1};
    a(i) = d.semimajoraxis;
    e(i) = d.eccentricity;
    inc(i) = d.inclination;
end

hold on
scatter3(a, e, inc, 'filled',...
    'MarkerEdgeColor','k',...
        'MarkerFaceColor',[0.8 .75 .75])
xlim([Re, Re+3000])
ylim([0, 0.3])
zlim([90, 180])

a1 = linspace(6378, 6378+3000, 200);
e1 = linspace(0, 0.3, 200);
i1 = linspace(90, 180, 200);






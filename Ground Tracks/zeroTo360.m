

function y = zeroTo360(x,unit)

if nargin == 1
    unit = 0;
elseif nargin > 2
    error('Too many inputs')
end

if unit
    deg = 2*pi;
else
    deg = 360;
end

y = zeros(1,length(x));

for j = 1:length(x)
	if (x(j) >= deg)
        x(j) = x(j) - fix(x(j)/deg)*deg;
	elseif (x(j) < 0)
        x(j) = x(j) - (fix(x(j)/deg) - 1)*deg;
	end
	y(j) = x(j);
end

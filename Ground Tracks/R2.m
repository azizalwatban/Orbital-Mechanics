function A = R2(x)
% This function creates a rotation matrix about the 2-axis (or the Y-axis)

if nargin > 1
    error('Too many inputs.  See help file')
end

A = [cos(x)  0      -sin(x);
     0       1      0;
     sin(x)  0      cos(x)];

end
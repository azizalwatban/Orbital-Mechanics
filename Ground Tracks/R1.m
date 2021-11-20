function A = R1(x)
% This function creates a rotation matrix about the 1-axis (or the X-axis)

if nargin > 1
    error('Too many inputs.  See help file')
end

A = [1      0       0;
     0      cos(x)  sin(x);
     0      -sin(x) cos(x)];

end
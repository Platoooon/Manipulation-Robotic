function [Rot_RTL]=Rotation(xi,theta,phi)
Rot_RTL=eye(4);

Rotation_x=[1,0,0;0,cos(xi),-sin(xi);0,sin(xi),cos(xi)];
Rotation_y=[cos(theta),0,sin(theta);0,1,0;-sin(theta),0,cos(theta)];
Rotation_z=[cos(phi),-sin(phi),0;sin(phi),cos(phi),0;0,0,1];

Rot_RTL(1:3,1:3)=Rotation_z*Rotation_y*Rotation_x;
end
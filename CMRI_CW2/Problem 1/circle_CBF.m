%% circle_CBF
clear all; close all;clc;

% init the parameter
N=16;  M=8;                                                           
f0=1500;   c=1500;    lamd=c/f0;   k=2*pi/lamd;
d0=0.5*lamd;     Delta=2*pi/N;     R=d0/Delta; 
phi0=0*pi/180;    phi=(-pi:pi/360:pi);
theta0=45*pi/180;   theta=(-pi/2:pi/360:pi/2); 
thetam=(0:N-1)*Delta;
%exp(1i*k*(R*sin(theta0)*sin(phi0-thetam)))/N;£»
W_circle_one=exp(1i*k*(R*sin(theta0)*sin(phi0-thetam)))/N;                              

%calculate the a_phi and circle_one
for i=1:length(phi)
    a_phi(:,i)=exp(-1i*k*(R*sin(theta0)*sin(phi(i)-thetam)));
    circle_one(i)=W_circle_one*a_phi(:,i); 
 
end

% axis([-180,180,-20,0]);
% set(gca,'xtick',[-180:60:180],'ytick',[-20:5:0]);
figure(1);                                                                %Beam pattern of circular array£»
circle_one=20*log10(abs(circle_one));                       
plot(phi*180/pi,circle_one);
title('Beam pattern of circular array');xlabel('position/¡ã');ylabel('beam/dB');

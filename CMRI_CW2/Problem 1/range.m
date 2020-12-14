%% CBF azimuth spectrum
A=5;fs=5000;snr=10;d=1;
Nfft=1024;
theta1=15*pi/180;theta2=35*pi/180;
t=(0:1/fs:(N-1)/fs);

% Generating single frequency signal;
s1=A*exp(1i*2*pi*f0*t); s2=A*exp(1i*2*pi*f0*t);

%The delay of different elements;
as1=exp(1i*k*d*sin(theta1)); as2=exp(1i*k*d*sin(theta2));

%The received signals with different array elements with time delay;
xs1=as1'*s1;  xs2=as2'*s2;
% s1n=wgn(xs1,snr,'measure');
%Received signal covariance matrix;
Rx1=xs1*xs1';     Rx2=xs2*xs2';

% calculate the w, P_thetal and P_theta2
for j=1:length(theta)
    w(:,j)=exp(-1i*k*d*sin(theta(j)))./N;
    P_theta1(j)=w(:,j)'*Rx1*w(:,j); 
    P_theta2(j)=w(:,j)'*Rx2*w(:,j);
end

P_theta1=10*log10(abs(P_theta1));
P_theta2=10*log10(abs(P_theta2));

% axis([-90,90,-80,0]);
% set(gca,'xtick',[-90:30:90],'ytick',[-80:20:0]);
plottheta=(-pi/2:pi/180:pi/2);
plot(plottheta*180/pi,P_theta1,'b',plottheta*180/pi,P_theta2,'r');
xlabel('Position/бу');ylabel('Azimuth spectrum/dB');title('CBF azimuth spectrum');legend('15бу','35бу');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%12 layers of cylindrical array, each layer of 32 elements circular array

f=1500;c=1500;lamd=c/f;d0=0.5*lamd;
N=10;M=5;phim=2*pi/N;
r_m=zeros(3,M*N);m=1;
for j=1:M
   R=d0/phim;    hm=(j-1)*d0;                                              %Cylindrical array;
%  R=0.5*(M-j+1)*d0/phim;hm=(j-1)*d0/4;                                    %Circular array;
for i=1:N
r_m(:,m)=[R*cos(i*phim),R*sin(i*phim),hm];
m=m+1;
end
end
figure(2);
plot3(r_m(1,:),r_m(2,:),r_m(3,:),'ok');
hold on
grid on

theta0=30*pi/180;theta=(0:pi/180:pi);
phi0=30*pi/180;phi=(-pi:pi/180:pi);
k=2*pi/lamd;
e0_vector=[sin(theta0)*cos(phi0),sin(theta0)*sin(phi0),cos(theta0)];
W_cylinder=exp(-1i*k*e0_vector*r_m);
for ii=1:length(theta)
    for jj=1:length(phi)
       e_vector=[sin(theta(ii))*cos(phi(jj)),sin(theta(ii))*sin(phi(jj)),cos(theta(ii))];
       a_cylinder(:,jj)=exp(1i*k* e_vector*r_m);
       F_cylinder(ii,jj)=W_cylinder* a_cylinder(:,jj);
    end
end
figure(3);
% F_cylinder=20*log10(abs(F_cylinder)/max(max(abs(F_cylinder))));
F_cylinder=(abs(F_cylinder)/max(max(abs(F_cylinder))));
% threshold = 40;                                                           %Set the threshold;
% F_cylinder = (F_cylinder+threshold).*((F_cylinder+threshold)>zeros(size(F_cylinder,1),size(F_cylinder,2)))-threshold;
mesh(phi*180/pi,theta*180/pi,F_cylinder);
%   title('Beam pattern of cylindrical array');
 title('Beam pattern of cylindrical array');
xlabel('position/бу');ylabel('pitch/бу');zlabel('beam/dB');
% axis([-180,180,0,90,-threshold ,0]);set(gca,'xtick',[-180:60:180],'ytick',[0:30:90],'ztick',[-threshold :20:0]);

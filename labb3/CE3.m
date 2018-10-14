clear
N=[10 20 40];
tau=[0.5,1,1.5,2];
h=1/N(1);
hspan=linspace(0,1,N(1)+1);
A=(1/h^2)*full(gallery('tridiag',N(1),1,-2,1));
A(10,9)=200;
tend=2;
deltt=0.001;
tspan=linspace(deltt,tend,tend/deltt);
u0=zeros(length(N(1)));
u0(1)=1;
u=zeros(N(1),length(tspan));
%u(1,1)=1;
%u(1,tspan<=1)=1;
%b=zeros(1,N(1));
%b(1)=1;
%u(2,:)=A/b;
for tt=2:length(tspan)
    b=zeros(N(1),1);
    if tspan(tt-1)<=1
        b(1)=1/h^2;
    end
    %u(tt-1,:)=A\b';
    u(:,tt)= u(:,tt-1)+deltt*(A*u(:,tt-1)+b);
end
% assignment 1
U=zeros(N(1)+1,length(tspan));
U(1,tspan<=1)=1;
U(2:end,:)=u;
figure
surf(U,'LineStyle','none');
figure
hold on
plot(hspan,U(:,0.5/deltt));
plot(hspan,U(:,1/deltt));
plot(hspan,U(:,1.5/deltt));
plot(hspan,U(:,2/deltt));
hold off
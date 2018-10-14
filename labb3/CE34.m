
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
u0=zeros(N(1),1);
u0(1)=1;
u=zeros(N(1),length(tspan));

option = odeset('RelTol',i);
[TOUT,UOUT] = ode23('ODE23',tspan,u0)

figure
surf(UOUT,'LineStyle','none');
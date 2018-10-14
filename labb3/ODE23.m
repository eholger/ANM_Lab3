function U = ODE(t,u)

N=[10 20 40];
tau=[0.5,1,1.5,2];
h=1/N(1);
hspan=linspace(0,1,N(1)+1);
A=(1/h^2)*full(gallery('tridiag',N(1),1,-2,1));
A(10,9)=200;

b=zeros(N(1),1);
if t<=1
    b(1)=1/h^2;
end

U = A*u+b;


end 
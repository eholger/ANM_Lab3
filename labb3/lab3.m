
N = 10;
%Tridiag
h = 1/N;
T = 1/h^2*(full(gallery('tridiag',N,-1,2,-1)));
u0 = zeros(N,1);
u0(1) = 1;
b = zeros(N,1);
b(1) = 1/h^2;
b(N) = 0;
tend= 4;
u = zeros(N,tend/h);
u(:,1) = u0;

for i = 2:h:tend
    u(i,:) = u(i-1,:) + h*(T*u(i-1,:) + b);
end



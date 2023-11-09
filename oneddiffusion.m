clear all;
close all;

nt = 151; %Number of time steps
tmax = 0.5; %Maximum simulation time
dt = tmax/(nt-1); %Time step size
niu = 0.1;

nx = 79; %Number of total space nodes
xmax = 2; % Maximum space length
dx = xmax/(nx-1); %Width of space step

x =0:dx:xmax; %lenth of step size
c =1; %Constant transport velocity

u = zeros(1,nx); % Prelocating u
un = zeros(1,nx); %Prelocating un is the current temporal point

%Courant-Freidrich-Lewy Number



%initial conditions
for i = 1:nx
    if ((0.5 <= x(i)) && (x(i)<=1))   %setting up the square initial condition
        u(i) = 2;
    else 
        u(i)=1;
    end
end 

% discretization
for it=0:nt % for every unit time the value of u must be calculated
    un = u;
    for i = 2:nx-1 %matlab array index starts with one
  
        u(i)=un(i)+niu*dt/(dx^2)*(un(i+1)-2*un(i)+un(i-1));
   
    end
    h =plot(x,u);
    axis ([0 2 0 3]); %sets the limit to the axes in the plot
    drawnow; 
    refreshdata(h);
    pause(0.08);
        
end 
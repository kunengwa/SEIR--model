function dy=HIV(t,y,LHSmatrix,x,runs)
%% PARAMETERS %%
Parameter_settings_LHS;

mu=LHSmatrix(x,1);
beta=LHSmatrix(x,2);
rho_b=LHSmatrix(x,3);
nu=LHSmatrix(x,4);
rho_s=LHSmatrix(x,5);
theta=LHSmatrix(x,6);
sigma=LHSmatrix(x,7);
delta=LHSmatrix(x,8);
alpha=LHSmatrix(x,9);
pi=LHSmatrix(x,10);
% dummy=LHSmatrix(x,10);

%% The equations
dy = [pi - (mu+rho_b)*y(1)-(nu*y(4)*y(1))/(y(1)+y(2)+y(3)+y(4)+y(5)) - (beta*y(4)*y(1))/(y(1)+y(2)+y(3)+y(4)+y(5)) + rho_s*y(2) ;
      rho_b*y(1) + (nu*y(4)*y(1))/(y(1)+y(2)+y(3)+y(4)+y(5)) - (mu+rho_s)*y(2) - (theta*beta*y(4)*y(2))/(y(1)+y(2)+y(3)+y(4)+y(5));
      (beta*y(4)*y(1))/(y(1)+y(2)+y(3)+y(4)+y(5)) + (theta*beta*y(4)*y(2))/(y(1)+y(2)+y(3)+y(4)+y(5)) - (mu+sigma)*y(3);
      sigma*y(3) - (mu+alpha+delta)*y(4);
      alpha*y(4) - mu*y(5);
      sigma*y(3)];
      
%% The results should be compared to the PRCC results section in
%% Supplementary Material D and Table D.1 for different N (specified by
%% "runs" in the script below
clear all;
close all;
clc;
%% Sample size N
runs=100;
%% Notes alphaa=sigmas; alphab =sigmaa; alphac=sigmab, alphav=sigmav; 
%% LHS MATRIX  %%
Parameter_settings_LHS;
mu_LHS=LHS_Call(0.000038527, mu, 0.000047089 , 0 ,runs,'unif');%baseline = 4.2808e-05..............1
beta_LHS=LHS_Call(0.0135, beta, 0.0165, 0 ,runs,'unif');%baseline = 0.015..............2
rho_b_LHS=LHS_Call(0, rho_b, 1, 0 ,runs,'unif');% baseline =0.0002.....................3
nu_LHS=LHS_Call(0, nu, 1, 0 ,runs,'unif');% baseline =0.005.......4
rho_s_LHS=LHS_Call(0, rho_s, 1, 0 ,runs,'unif');% baseline =0.001......5
theta_LHS=LHS_Call(0, theta, 1, 0 ,runs,'unif');% baseline =0.3.........................6
sigma_LHS=LHS_Call(1/2,sigma,1/14 , 0 ,runs,'unif');% baseline=1/7 ...............7
delta_LHS=LHS_Call(0, delta, 1, 0 ,runs,'unif');% baseline =0.0002............................8
alpha_LHS=LHS_Call(0.003213, alpha, 0.003927, 0 ,runs,'unif');% baseline =0.00357...............9
pi_LHS=LHS_Call(0.3853, pi, 0.4709, 0 ,runs,'unif');% baseline=mu*s0 ...............10

%% LHS MATRIX and PARAMETER LABELS          
LHSmatrix=[mu_LHS beta_LHS rho_b_LHS nu_LHS rho_s_LHS theta_LHS sigma_LHS delta_LHS alpha_LHS pi_LHS];
%% LOOP to run solutions x times choosing different values
for x=1:runs %Run solution x times choosing different values
    f=@ODE_LHS;
    x
    LHSmatrix(x,:);
    [t,y]=ode45(@(t,y)f(t,y,LHSmatrix,x,runs),tspan,Y0,[]); 
    Anew=[t y]; % [time y]
    %% Save the outputs at ALL time points [tspan]
    S_lhs(:,x)=Anew(:,1);
    Sb_lhs(:,x)=Anew(:,2);
    E_lhs(:,x)=Anew(:,3);
    I_lhs(:,x)=Anew(:,4);
    R_lhs(:,x)=Anew(:,5);
    C_lhs(:,x)=Anew(:,6);
    
    %% Save only the outputs at the time points of interest [time_points]:
    %% MORE EFFICIENT
%     Sh_lhs(:,x)=A(time_points,1);
%     Ih_lhs(:,x)=A(time_points,2);
%     Pf_lhs(:,x)=A(time_points,3);
%     Pw_lhs(:,x)=A(time_points,4);
%     Pm_lhs(:,x)=A(time_points,5);
%     Ph_lhs(:,x)=A(time_points,6);
%     PH_lhs(:,x)=A(time_points,7);
%     Sv_lhs(:,x)=A(time_points,8);
%     Iv_lhs(:,x)=A(time_points,9);
%     Pa_lhs(:,x)=A(time_points,10);
%     Pb_lhs(:,x)=A(time_points,11);
%     Pc_lhs(:,x)=A(time_points,12);
%     Pv_lhs(:,x)=A(time_points,13);
%     PV_lhs(:,x)=A(time_points,14);
    
  end
%% Save the workspace
save Model_LHS.mat;
%PRCC_PLOT(LHSmatrix,Pv_lhs,2,PRCC_var,y_var_label(6))
% plot(V_lhs, e1_LHS)
%% CALCULATE PRCC
figure('DefaultLegendFontSize',14,'DefaultLegendFontSizeMode','manual')
hold on
[prcc sign sign_label]=PRCC(LHSmatrix,C_lhs,1:length(tspan),PRCC_var,0.05);
plot(prcc(:,6),'linewidth',2)
plot(prcc(:,7),'linewidth',2)
plot(prcc(:,8),'linewidth',2)
plot(prcc(:,9),'linewidth',2)
plot(prcc(:,10),'linewidth',2)
xlabel('Time (days)','fontweight','bold','fontsize',14)
ylabel('PRCCS for C','fontweight','bold','fontsize',14)
legend('\theta','\sigma', '\delta', '\alpha', '\pi')
box on
hold off


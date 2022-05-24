%Created by Kunengwa Tembo
%Date: 11/05/2022
%Place: AIMS
%% Parameter values
mu= 4.2808e-05; beta=0.015; rho_b=0.002; nu=0.005;rho_s=0.001; theta=0.3; 
sigma=1/7; delta=0.0002; alpha=0.00357; s0=10000; pi = mu*s0;

    
%% Parameter Labels 
PRCC_var={'\mu', '\beta', '\rho_b', '\nu', '\rho_s', '\theta', ...
    '\sigma', '\delta', '\alpha', '\pi', 'dummy'};% 
%% TIME SPAN OF THE SIMULATION
t_end=1500; % length of the simulations
tspan=(0:1:t_end);   % time points where the output is calculated
 %time_points=[250 400]; time points of interest for the US analysis

%% INITIAL CONDITION FOR THE ODE MODEL
S = 10000; Sb = 0; E = 0; I= 100; R=0; C=100;

Y0 = [S,Sb,E,I,R,C]; 

%% Variables Labels
y_var_label={'S','S_b','E','I','R','C'};


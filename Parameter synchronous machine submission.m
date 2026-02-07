clc;
clear;
close all

P = 64;
J = 35.1e6; % unit: J.s^2
Vabc_s = 20e3*sqrt(2)/sqrt(3); % unit: V (line to line voltage)
f = 60; % unit: Hz
% theta_r0 = 30*pi/180;
theta_r0 = 0;
theta_e0 = theta_r0*P/2;
w=112.5;
wb = 112.5*2*pi/60; % rated/base frequency unit: rad/s
web = P/2*wb;

Rs = 0.00234;
Rpkq1 = 0.01675; % open circuit
Rpkq2 = 0.01675;
Rpf = 0.00050;
Rpkd = 0.01736;

Lq = 0.5911/web;
Ld = 1.0467/web;
Lls = 0.1478/web;
Lmd = Ld - Lls;
Lmq = Lq - Lls;

Epf=(Vabc_s*sqrt(2))/sqrt(3); %% peak value of the no-load voltage = Vq
%%Epf=26.1e3; results from calculation

%%Vfd = 6; % assumed according to the output graph
Vfd = Epf*Rpf/(Lmd*web); 

Lplkq1 = 0.1267/web; % open circuit
Lplkq2 = 0.1267/web;
Lplf = 0.2523/web;
Lplkd = 0.1970/web;

%% R martrix
R= [Rs 0 0 0 0 0 0; 
    0 Rs 0 0 0 0 0; 
    0 0 Rs 0 0 0 0; 
    0 0 0 Rpkq1 0 0 0; 
    0 0 0 0 Rpkq2 0 0; 
    0 0 0 0 0 Rpf 0; 
    0 0 0 0 0 0 Rpkd]

%% L Matrix
L= [Lq 0 0 Lmq Lmq 0 0; 
    0 Ld 0 0 0 Lmd Lmd; 
    0 0 Lls 0 0 0 0; 
    Lmq 0 0 Lplkq1+Lmq Lmq 0 0; 
    Lmq 0 0 Lmq Lplkq2+Lmq 0 0; 
    0 Lmd 0 0 0 Lplf+Lmd Lmd; 
    0 Lmd 0 0 0 Lmd Lplkd+Lmd]

%%L inverse matrix
Linv= inv(L);

%% J matrix
Jmat= [0 1 0 0 0 0 0;
      -1 0 0 0 0 0 0;
       0 0 0 0 0 0 0;
       0 0 0 0 0 0 0;
       0 0 0 0 0 0 0;
       0 0 0 0 0 0 0;
       0 0 0 0 0 0 0]
JL = Jmat*L;

%% initial current calculation %%
% here assume initial current is equal to steady state current
% Vqs = Vabc_s*cos(theta_e0 - P/2*theta_r0);
% Vds = -Vabc_s*sin(theta_e0 - P/2*theta_r0);
% syms ids iqs;
% fcn1 = Rs*iqs + web*Ld*ids -Vqs;
% fcn2 = Rs*ids - web*Lq*iqs -Vds;
% [ids,iqs] = solve(fcn1,fcn2);
% ids = double(ids);
% iqs = double(iqs);
ids = 0;
iqs = sqrt(7.9674e+03);
i_f = Vfd/Rpf;



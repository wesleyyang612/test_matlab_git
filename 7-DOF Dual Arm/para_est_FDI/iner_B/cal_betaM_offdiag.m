clear;clc;
load betaM_diag.mat
load betaM_offdiag_lumped.mat

syms beta1 beta2 beta3 beta4 beta5 real
syms beta7 beta8 beta9 beta10 beta11 real
syms beta13 beta14 beta15 beta16 beta17 real
syms beta19 beta20 beta21 beta22 beta23 real


eq61 = -beta5+beta31 == betaM_offdiag_J6(1);
eq62 = -beta11  == betaM_offdiag_J6(2);
eq63 = -beta17 == betaM_offdiag_J6(3);
eq64 = -beta23  == betaM_offdiag_J6(4);

eq51 = beta4-beta30+beta31 == betaM_offdiag_J5(1);
eq52 = beta10+beta23 == betaM_offdiag_J5(2);
eq53 = beta17-beta22 == betaM_offdiag_J5(3);
eq54 = -beta11+beta16 == betaM_offdiag_J5(4);


eq41 = -beta3-beta4+beta5+beta29-beta31 == betaM_offdiag_J4(1);
eq42 = -beta9-beta11+beta16 == betaM_offdiag_J4(2);
eq43 = -beta10-beta15-beta23 == betaM_offdiag_J4(3);
eq44 = -beta21+beta22-beta17 == betaM_offdiag_J4(4);

eq31 = beta2+beta5+beta29-beta28-beta30 == betaM_offdiag_J3(1);
eq32 = beta8+beta17+beta21-beta22  == betaM_offdiag_J3(2); 
eq33 = -beta10-beta15-beta20-beta23  == betaM_offdiag_J3(3);
eq34 = beta9+beta11+beta14-beta16 == betaM_offdiag_J3(4);

eq21 = -beta1-beta2+beta3+beta4-beta5+beta27+beta29+beta31 == betaM_offdiag_J2(1);
eq22 = -beta7-beta9-beta11-beta14+beta16 == betaM_offdiag_J2(2);
eq23 = -beta8+beta13-beta17-beta21-beta10-beta15+beta22 == betaM_offdiag_J2(3);
eq24 = beta19-beta20+beta23 == betaM_offdiag_J2(4);


eq = [eq21,eq22,eq23,eq24, eq31,eq32,eq33,eq34, eq41,eq42,eq43,eq44, eq51,eq52,eq53,eq54, eq61,eq62,eq63,eq64];
var = [ beta1 beta2 beta3 beta4 beta5 beta7 beta8 beta9 beta10 beta11 beta13 beta14 beta15 beta16 beta17 beta19 beta20 beta21 beta22 beta23 ];
sol = solve(eq,var);



%% ½á¹û
beta1 = double(sol.beta1);
beta2 = double(sol.beta2);
beta3 = double(sol.beta3);
beta4 = double(sol.beta4);
beta5 = double(sol.beta5);

beta7 = double(sol.beta7);
beta8 = double(sol.beta8);
beta9 = double(sol.beta9);
beta10 = double(sol.beta10);
beta11 = double(sol.beta11);

beta13 = double(sol.beta13);
beta14 = double(sol.beta14);
beta15 = double(sol.beta15);
beta16 = double(sol.beta16);
beta17 = double(sol.beta17);

beta19 = double(sol.beta19);
beta20 = double(sol.beta20);
beta21 = double(sol.beta21);
beta22 = double(sol.beta22);
beta23 = double(sol.beta23);

save betaM_offdiag.mat beta1 beta2 beta3 beta4 beta5  beta7 beta8 beta9 beta10 beta11 beta13 beta14 beta15 beta16 beta17 beta19 beta20 beta21 beta22 beta23











clear;clc;close all

%% 2��
jnt=2;
flexiv_Inertia_B;
betaM_offdiag_J2 = betaM_offdiag;

%% 3��
jnt=3;
flexiv_Inertia_B;
betaM_offdiag_J3 = betaM_offdiag;

%% 4��
jnt=4;
flexiv_Inertia_B;
betaM_offdiag_J4 = betaM_offdiag;

%% 5��
jnt=5;
flexiv_Inertia_B;
betaM_offdiag_J5 = betaM_offdiag;

%% 6��
jnt=6;
flexiv_Inertia_B;
betaM_offdiag_J6 = betaM_offdiag;


%%
save betaM_offdiag_lumped.mat betaM_offdiag_J2 betaM_offdiag_J3 betaM_offdiag_J4 betaM_offdiag_J5 betaM_offdiag_J6

%% ����beta����ȥ���ԶԽ��
% beta5  =  betaM_offdiag_J6(1);
% beta11 =  betaM_offdiag_J6(2);
% beta17 =  betaM_offdiag_J6(3);
% beta23 =  betaM_offdiag_J6(4);
















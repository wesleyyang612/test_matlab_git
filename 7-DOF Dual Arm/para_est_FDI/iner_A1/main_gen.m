clear;close all;clc;
%第一构型数据，关节角全是0
main_dualArm_Inertia_A1;
%第二构型数据，下一关节角是pi/2
pi2_main_dualArm_Inertia_A1;

%生成惯性参数
gen_betaM_diag;
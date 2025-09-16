clear;clc;close all;
acc_percent = 0.1*[1,2,3,4,5,6,7,8,9,10]';

%% 初始零位构型
p_init = [0,0,0,0,0,0,0];

%% limits
% 机器人提供的限位
% qmin=deg2rad([-160,-130,-170,-107,-170,-80,-170]);
% qmax=deg2rad([160,130,170,154,170,260,170]);
% 实际使用的限位
%第一初始构型的限位
qmin=deg2rad([-150,-80,-150,-80,-150,-80,-80]);
qmax=deg2rad([150,80,150,80,150,80,80]);
vmax=deg2rad([108*0.4,108*0.4,180*0.4,180*0.4,180*0.8,180*0.8,180*0.8]);
amax=[10,10,15,15,15,15,15]/2;

% % %第二初始构型的限位
% qmin=deg2rad([-50,-80,-90,-80,-90,-80,-80]);
% qmax=deg2rad([90,80,90,80,90,80,80]);
% vmax=deg2rad([108*0.4,108*0.4,180*0.4,180*0.4,180*0.8,180*0.8,180*0.8]);
% amax=[10,10,15,15,15,15,15]/2;

%% J1
jnt = 1;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;

%% J2
jnt = 2;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;

%% J3
jnt = 3;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J4
jnt = 4;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J5
jnt = 5;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J6
jnt = 6;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J7
jnt = 7;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;






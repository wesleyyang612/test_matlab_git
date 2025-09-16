clear;clc;close all;
vel_percent = 0.1*[1,2,3,4,5,6,7,8,9,10]'*0.5;
% vel_percent = 0.1*[1,2,3,4,9,10]'*0.9;

%% 初始零位构型
p_init = [0,0,0,0,0,0,0];

%% limits
% 机器人提供的限位
% qmin=deg2rad([-160,-130,-170,-107,-170,-80,-170]);
% qmax=deg2rad([160,130,170,154,170,260,170]);
% 实际使用的限位
qmin=deg2rad([-150,-40,-90,-80,-150,-80,-80]);
qmax=deg2rad([150,40,90,80,150,80,80]);
vmax=deg2rad([108,108,180,180,180,180,180]);
amax=[10,10,15,15,15,15,15]/2;


%% J1
jnt = 1;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J2
jnt = 2;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J3
jnt = 3;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J4
jnt = 4;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J5
jnt = 5;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J6 : 
jnt = 6;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J7 : 
jnt = 7;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;
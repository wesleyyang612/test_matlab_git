clear;clc;close all;


% 实际使用的限位
vmax=deg2rad([108,108,180,180,180,180,180])*0.5;
amax=[10,10,15,15,15,15,15]/2;

acc_vel_rate = amax./vmax;
jerk_acc_rate = [10;10;10;10;10;10;10];
max_vel = vmax;

percent_data=10:10:90;
percent_num=length(percent_data);


%% J1,J2,J3,J4,J5,J6，J7
pos_neg = deg2rad([-80,-80,-80,80,-80,-80,-80]);
pos_pos = deg2rad([80,80,80,-80,80,80,80]);

gen_test_traj_muti;



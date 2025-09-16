%% 7轴
clear;close all;clc;
i=7;
jnt = 7;                  %哪个关节
load time_grav_fric_ident_J7.mat
filename = 'dualarm_data_write_grav_fric_ident_J7.txt';
txt2data_dualArm;
qd_write7 = qd(:,i);

read_data = load('dualarm_data_read_grav_fric_ident_J7.txt');
qd_read7 = read_data(i,:)';

figure
plot(t,qd_read7,'r-',t,qd_write7,'yo')
norm(qd_read7-qd_write7)




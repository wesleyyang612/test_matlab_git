clear;close all;clc;
fig_cnt = 1;

%% 1轴
jnt = 1;                  %哪个关节
load time_grav_fric_ident_J1.mat
% filename = 'write_filewrite_filedualarm_data_write_grav_fric_ident_J1.txt';
filename = 'dualarm_data_write_grav_fric_ident_J1.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

%% 2轴
jnt = 2;                  %哪个关节
load time_grav_fric_ident_J2.mat
filename = 'dualarm_data_write_grav_fric_ident_J2.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

%% 3轴
jnt = 3;                  %哪个关节
load time_grav_fric_ident_J3.mat
filename = 'dualarm_data_write_grav_fric_ident_J3.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

%% 4轴
jnt = 4;                  %哪个关节
load time_grav_fric_ident_J4.mat
filename = 'dualarm_data_write_grav_fric_ident_J4.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

%% 5轴
jnt = 5;                  %哪个关节
load time_grav_fric_ident_J5.mat
filename = 'dualarm_data_write_grav_fric_ident_J5.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

%% 6轴
jnt = 6;                  %哪个关节
load time_grav_fric_ident_J6.mat
filename = 'dualarm_data_write_grav_fric_ident_J6.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

%% 7轴
jnt = 7;                  %哪个关节
load time_grav_fric_ident_J7.mat
filename = 'dualarm_data_write_grav_fric_ident_J7.txt';
txt2data_dualArm;
dualArm_FricGravRipIdent;

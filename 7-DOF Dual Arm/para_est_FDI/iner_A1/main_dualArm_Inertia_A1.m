%% 1轴
clc
clear;clc;close all
jnt = 1;
filename = 'dualArm_data_write_inertia_ident_A1_J1.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 1;                  %哪个关节
load time_inertia_ident_A1_J1.mat
dualArm_Inertia_A1;
diag_inertia_J1=(f1.p1+f2.p1)/2;
acc_data_J1 = acc_data;
iner_data_J1 = iner_data;
save('betaM_diag_inertia_J1.mat','diag_inertia_J1','acc_data_J1','iner_data_J1')



%% 2轴
clear;clc;close all
jnt =2;
filename = 'dualArm_data_write_inertia_ident_A1_J2.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 2;                  %哪个关节
load time_inertia_ident_A1_J2.mat
dualArm_Inertia_A1;
diag_inertia_J2=(f1.p1+f2.p1)/2;
acc_data_J2 = acc_data;
iner_data_J2 = iner_data;
save('betaM_diag_inertia_J2.mat','diag_inertia_J2','acc_data_J2','iner_data_J2')


%% 3轴
clear;clc;close all
jnt =3;
filename = 'dualArm_data_write_inertia_ident_A1_J3.txt';
% filename = 'write_filedualArm_data_write_inertia_ident_A1_J3_single2.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 3;                  %哪个关节
load time_inertia_ident_A1_J3.mat
dualArm_Inertia_A1;
diag_inertia_J3=(f1.p1+f2.p1)/2;
acc_data_J3 = acc_data;
iner_data_J3 = iner_data;
save('betaM_diag_inertia_J3.mat','diag_inertia_J3','acc_data_J3','iner_data_J3')

%% 4轴
clear;clc;close all
jnt = 4;
filename = 'dualArm_data_write_inertia_ident_A1_J4.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 4;                  %哪个关节
load time_inertia_ident_A1_J4.mat
dualArm_Inertia_A1;
diag_inertia_J4=(f1.p1+f2.p1)/2;
acc_data_J4 = acc_data;
iner_data_J4 = iner_data;
save('betaM_diag_inertia_J4.mat','diag_inertia_J4','acc_data_J4','iner_data_J4')


%% 5轴
clear;clc;close all
jnt=5;
filename = 'dualArm_data_write_inertia_ident_A1_J5.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 5;                  %哪个关节
load time_inertia_ident_A1_J5.mat
dualArm_Inertia_A1;
diag_inertia_J5=(f1.p1+f2.p1)/2;
acc_data_J5 = acc_data;
iner_data_J5 = iner_data;
save('betaM_diag_inertia_J5.mat','diag_inertia_J5','acc_data_J5','iner_data_J5')

%% 6轴
clear;clc;close all
jnt = 6;
filename = 'dualArm_data_write_inertia_ident_A1_J6.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 6;                  %哪个关节
load time_inertia_ident_A1_J6.mat
dualArm_Inertia_A1;
diag_inertia_J6=(f1.p1+f2.p1)/2;
acc_data_J6 = acc_data;
iner_data_J6 = iner_data;
save('betaM_diag_inertia_J6.mat','diag_inertia_J6','acc_data_J6','iner_data_J6')


%% 7轴
clear;clc;close all
jnt = 7;
filename = 'dualArm_data_write_inertia_ident_A1_J7.txt';
% filename = 'write_filedualArm_data_write_inertia_ident_A1_J7_single2.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 7;                  %哪个关节
load time_inertia_ident_A1_J7.mat
dualArm_Inertia_A1;
diag_inertia_J7=(f1.p1+f2.p1)/2;
acc_data_J7 = acc_data;
iner_data_J7 = iner_data;
save('betaM_diag_inertia_J7.mat','diag_inertia_J7','acc_data_J7','iner_data_J7')


%% 生成betaM_diag.mat
% gen_betaM_diag
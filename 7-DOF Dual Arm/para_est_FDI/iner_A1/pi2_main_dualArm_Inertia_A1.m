%% 1轴
clear;clc;close all
jnt=1;
filename = 'dualArm_data_write_inertia_ident_A1_J_pi21.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 1;                  %哪个关节
load time_inertia_ident_A1_J_pi21.mat
pi2_dualArm_Inertia_A1;
diag_inertia_J_pi21=(f1.p1+f2.p1)/2;
acc_data_J_pi21 = acc_data;
iner_data_J_pi21 = iner_data;
save('betaM_diag_inertia_J_pi21.mat','diag_inertia_J_pi21','acc_data_J_pi21','iner_data_J_pi21')



%% 2轴
clear;clc;close all
jnt=2;
filename = 'dualArm_data_write_inertia_ident_A1_J_pi22.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 2;                  %哪个关节
load time_inertia_ident_A1_J_pi22.mat
pi2_dualArm_Inertia_A1;
diag_inertia_J_pi22=(f1.p1+f2.p1)/2;
acc_data_J_pi22 = acc_data;
iner_data_J_pi22 = iner_data;
save('betaM_diag_inertia_J_pi22.mat','diag_inertia_J_pi22','acc_data_J_pi22','iner_data_J_pi22')


%% 3轴
clear;clc;close all
jnt=3;
filename = 'dualArm_data_write_inertia_ident_A1_J_pi23.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 3;                  %哪个关节
load time_inertia_ident_A1_J_pi23.mat
pi2_dualArm_Inertia_A1;
diag_inertia_J_pi23=(f1.p1+f2.p1)/2;
acc_data_J_pi23 = acc_data;
iner_data_J_pi23 = iner_data;
save('betaM_diag_inertia_J_pi23.mat','diag_inertia_J_pi23','acc_data_J_pi23','iner_data_J_pi23')

%% 4轴
clear;clc;close all
jnt=4;
filename = 'dualArm_data_write_inertia_ident_A1_J_pi24.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 4;                  %哪个关节
load time_inertia_ident_A1_J_pi24.mat
pi2_dualArm_Inertia_A1;
diag_inertia_J_pi24=(f1.p1+f2.p1)/2;
acc_data_J_pi24 = acc_data;
iner_data_J_pi24 = iner_data;
save('betaM_diag_inertia_J_pi24.mat','diag_inertia_J_pi24','acc_data_J_pi24','iner_data_J_pi24')


%% 5轴
clear;clc;close all
jnt=5;
filename = 'dualArm_data_write_inertia_ident_A1_J_pi25.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 5;                  %哪个关节
load time_inertia_ident_A1_J_pi25.mat
pi2_dualArm_Inertia_A1;
diag_inertia_J_pi25=(f1.p1+f2.p1)/2;
acc_data_J_pi25 = acc_data;
iner_data_J_pi25 = iner_data;
save('betaM_diag_inertia_J_pi25.mat','diag_inertia_J_pi25','acc_data_J_pi25','iner_data_J_pi25')

%% 6轴
clear;clc;close all
jnt=6;
filename = 'dualArm_data_write_inertia_ident_A1_J_pi26.txt';
txt2data_dualArm;
dualArm_data_filtering;

clear;close all
jnt = 6;                  %哪个关节
load time_inertia_ident_A1_J_pi26.mat
pi2_dualArm_Inertia_A1;
diag_inertia_J_pi26=(f1.p1+f2.p1)/2;
acc_data_J_pi26 = acc_data;
iner_data_J_pi26 = iner_data;
save('betaM_diag_inertia_J_pi26.mat','diag_inertia_J_pi26','acc_data_J_pi26','iner_data_J_pi26')



%% 生成betaM_diag.mat
% gen_betaM_diag
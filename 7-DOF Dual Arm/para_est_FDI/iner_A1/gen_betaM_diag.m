clear;clc;
load betaG_dualArm.mat
load betaM_diag_inertia_J1.mat
load betaM_diag_inertia_J2.mat
load betaM_diag_inertia_J3.mat
load betaM_diag_inertia_J4.mat
load betaM_diag_inertia_J5.mat
load betaM_diag_inertia_J6.mat
load betaM_diag_inertia_J7.mat

load betaM_diag_inertia_J_pi21.mat
load betaM_diag_inertia_J_pi22.mat
load betaM_diag_inertia_J_pi23.mat
load betaM_diag_inertia_J_pi24.mat
load betaM_diag_inertia_J_pi25.mat
load betaM_diag_inertia_J_pi26.mat


L1=0.085;
L2=0.25;
L3=0.21;
L4=0.062;


beta_G = [beta32 beta33 beta34 beta35 beta36 beta37 beta38 beta39 beta40 beta41 beta42 beta43 beta44 beta45]';

%%Ia3,4
beta46=0.2644;beta47=0.2644;
%%Ia5,6,7
beta48=0.0125;beta49=0.0125;beta50=0.0125;

beta31=diag_inertia_J7-beta50;
beta31=0;
beta30=diag_inertia_J6-2*L4*beta38-beta49;
beta6=diag_inertia_J_pi26+2*L4*beta45-beta30-beta49;
beta29=diag_inertia_J_pi25-2*L4*beta38-beta31-beta48;
beta5=diag_inertia_J5-beta6-beta29-beta48;
beta28=diag_inertia_J4-(2*L4*beta38+2*L3*(beta37+beta38))-beta30-beta47;
beta4=diag_inertia_J_pi24-(2*L4*beta38+2*L3*(beta37+beta38))-beta28-beta31-beta47;
beta27=diag_inertia_J3-beta5-beta6-beta29-beta46;
beta3=diag_inertia_J_pi23-(2*L4*beta38+2*L3*(beta37+beta38))-beta27-beta4-beta31-beta46;
beta26=diag_inertia_J2-(2*L4*beta38+2*L2*(beta37+beta38-beta42)+2*L3*(beta37+beta38))-beta28-beta30;
beta2=diag_inertia_J_pi22-(2*L4*beta38+2*L2*(beta37+beta38-beta42)+2*L3*(beta37+beta38))-beta26-...
    -beta3-beta4-beta31;
beta25=diag_inertia_J1-beta5-beta6-beta27-beta29;
beta1=diag_inertia_J_pi21-(2*L4*beta38+2*L2*(beta37+beta38-beta42)+2*L3*(beta37+beta38))-beta25-...
    beta2-beta3-beta4-beta31;


DEBUG = 0.035;




save betaM_diag_dualArm.mat beta1 beta2 beta3 beta4 beta5 beta6 beta25 beta26 beta27 beta28 beta29 beta30 beta31




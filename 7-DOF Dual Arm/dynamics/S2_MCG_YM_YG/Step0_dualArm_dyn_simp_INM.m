   %% syms def
clear;clc;
syms q1 q2 q3 q4 q5 q6 q7 real
syms L1 L2 L3 L4 L5 L6 LL real
syms g real
syms beta1 beta2 beta3 beta4 beta5 beta6 beta7 beta8 beta9 beta10 real
syms beta11 beta12 beta13 beta14 beta15 beta16 beta17 beta18 beta19 beta20 real
syms beta21 beta22 beta23 beta24 beta25 beta26 beta27 beta28 beta29 beta30 real
syms beta31 beta32 beta33 beta34 beta35 beta36 beta37 beta38 beta39 beta40 real
syms beta41 beta42 beta43 beta44 beta45 beta46 beta47 beta48 beta49 beta50 real
syms gc gs real
syms qdd1 qdd2 qdd3 qdd4 qdd5 qdd6 qdd7

% vel=0
q = [q1;q2;q3;q4;q5;q6;q7];
qd1 = sym(0);qd2 = sym(0);qd3 = sym(0);qd4 = sym(0);qd5 = sym(0);qd6 = sym(0);qd7 = sym(0);

DOF = 7;


%% def betaM betaG
%beta_str    = {'beta1','beta2','beta3','beta4','beta5','beta7','beta8','beta9','beta10','beta11','beta13','beta14','beta15','beta16','beta17','beta19','beta20','beta21','beta22','beta23','beta25','beta26','beta27','beta28','beta29','beta30','beta31','beta32','beta33','beta34','beta35','beta36','beta38','beta39','beta40','beta41','beta42'};
% betaG_str   = {'beta32','beta33','beta34','beta35','beta36','beta37','beta38','beta39','beta40','beta41','beta42','beta43','beta44','beta45'};
betaM_str   = {'beta1','beta2','beta3','beta4','beta5','beta7','beta8','beta9','beta10','beta11','beta13','beta14','beta15','beta16','beta17','beta19','beta20','beta21','beta22','beta23','beta25','beta26','beta27','beta28','beta29','beta30','beta31','beta32','beta33','beta34','beta35','beta36'};
%beta    = [beta1,beta2,beta3,beta4,beta5,beta7,beta8,beta9,beta10,beta11,beta13,beta14,beta15,beta16,beta17,beta19,beta20,beta21,beta22,beta23,beta25,beta26,beta27,beta28,beta29,beta30,beta31,beta32,beta33,beta34,beta35,beta36,beta38,beta39,beta40,beta41,beta42];
% betaG   = [beta32,beta33,beta34,beta35,beta36,beta37,beta38,beta39,beta40,beta41,beta42,beta43,beta44,beta45];
betaM   = [beta1,beta2,beta3,beta4,beta5,beta7,beta8,beta9,beta10,beta11,beta13,beta14,beta15,beta16,beta17,beta19,beta20,beta21,beta22,beta23,beta25,beta26,beta27,beta28,beta29,beta30,beta31,beta32,beta33,beta34,beta35,beta36];


%% obtain the regression of base parameter set
% regrouped paras
m1 = sym(0);m2 = sym(0);m3 = sym(0);m4 = sym(0);m5 = sym(0);m6 = sym(0);m7 = sym(0);
mz1 = sym(0);mz2 = sym(0);mz3 = sym(0);mz4 = sym(0);mz5 = sym(0);mz6 = sym(0);mz7 = sym(0);

% I1xx=sym(0);I2xx=sym(0);I3xx=sym(0);I4xx=sym(0);I5xx=sym(0);I6xx=sym(0);I7xx=sym(0);
% I1xy=sym(0);I2xy=sym(0);I3xy=sym(0);I4xy=sym(0);I5xy=sym(0);I6xy=sym(0);I7xy=sym(0);
% I1xz=sym(0);I2xz=sym(0);I3xz=sym(0);I4xz=sym(0);I5xz=sym(0);I6xz=sym(0);I7xz=sym(0);
% I1yy=sym(0);I2yy=sym(0);I3yy=sym(0);I4yy=sym(0);I5yy=sym(0);I6yy=sym(0);I7yy=sym(0);
% I1yz=sym(0);I2yz=sym(0);I3yz=sym(0);I4yz=sym(0);I5yz=sym(0);I6yz=sym(0);I7yz=sym(0);
% I1zz=sym(0);I2zz=sym(0);I3zz=sym(0);I4zz=sym(0);I5zz=sym(0);I6zz=sym(0);I7zz=sym(0);

% payload = 0
mL= 0;mxL= 0;myL= 0;mzL= 0;ILxx= 0;ILxy= 0;ILxz= 0;ILyy= 0;ILyz= 0;ILzz= 0;


I1yy = sym(0);I2yy = sym(0);I3yy = sym(0);I4yy = sym(0);I5yy =sym(0);I6yy = sym(0);I7yy = sym(0);
% independent paras
I1xx = sym(0);I1xy = sym(0);I1xz = sym(0);I1yz = sym(0);mx1 = sym(0);my1 = sym(0);
Ia1 = sym(0);Ia2 = sym(0);
% base parameter set
% XX
I2xx=beta1;I3xx=beta2;I4xx=beta3;I5xx=beta4;I6xx=beta5;I7xx=beta6;
% XY
I2xy=beta7;I3xy=beta8;I4xy=beta9;I5xy=beta10;I6xy=beta11;I7xy=beta12;
% XZ
I2xz=beta13;I3xz=beta14;I4xz=beta15;I5xz=beta16;I6xz=beta17;I7xz=beta18;
% YZ
I2yz=beta19;I3yz=beta20;I4yz=beta21;I5yz=beta22;I6yz=beta23;I7yz=beta24;
% ZZ
I1zz=beta25;I2zz=beta26;I3zz=beta27;I4zz=beta28;I5zz=beta29;I6zz=beta30;I7zz=beta31;

% % XX
% I2xx=beta1;I3xx=beta2;I4xx=beta3;I5xx=beta4;I6xx=beta5;I7xx=beta6;
% % XY
% I2xy=beta7;I3xy=beta8;I4xy=beta9;I5xy=beta10;I6xy=beta11;I7xy=beta12;
% % XZ
% I2xz=beta13;I3xz=beta14;I4xz=beta15;I5xz=beta16;I6xz=beta17;I7xz=beta18;
% % YZ
% I2yz=beta19;I3yz=beta20;I4yz=beta21;I5yz=beta22;I6yz=beta23;I7yz=beta24;
% % ZZ
% I1zz=beta25;I2zz=beta26;I3zz=beta27;I4zz=beta28;I5zz=beta29;I6zz=beta30;I7zz=beta31;


% MX
mx1=beta32;mx2=beta33;mx3=beta34;mx4=beta35;mx5=beta36;mx6=beta37;mx7=beta38;
% MY
my1=beta39;my2=beta40;my3=beta41;my4=beta42;my5=beta43;my6=beta44;my7=beta45;
% IA
% Ia3=sym(0);Ia4=sym(0);Ia5=sym(0);Ia6=sym(0);Ia7=sym(0);
Ia3=beta46;Ia4=beta47;Ia5=beta48;Ia6=beta49;Ia7=beta50;

% Function description:

	S2=sin(q2);
	C2=cos(q2);
	S3=sin(q3);
	C3=cos(q3);
	S4=sin(q4);
	C4=cos(q4);
	S5=sin(q5);
	C5=cos(q5);
	S6=-cos(q6);
	C6=sin(q6);
	S7=sin(q7);
	C7=cos(q7);
	PAS218=L5.*myL;
	PAS228=-(L5.*mxL);
	PAS318=L5.*mzL;
	PAS338=-(L5.*mxL);
	XXP7=I7xx + ILxx;
	XYP7=I7xy + ILxy - PAS218;
	XZP7=I7xz + ILxz - PAS318;
	YYP7=I7yy + ILyy + L5.^2.*mL - 2.*PAS228;
	YZP7=I7yz + ILyz;
	ZZP7=I7zz + ILzz + L5.^2.*mL - 2.*PAS338;
	MXP7=L5.*mL + mx7 + mxL;
	MYP7=my7 + myL;
	MZP7=mz7 + mzL;
	MP7=m7 + mL;
	AS17=C7.*MXP7 - MYP7.*S7;
	AS37=C7.*MYP7 + MXP7.*S7;
	AJ117=-((I7xy + ILxy - PAS218).*S7) + C7.*XXP7;
	AJ127=C7.*XYP7 - S7.*YYP7;
	AJ137=C7.*XZP7 - S7.*YZP7;
	AJ217=-I7xz - ILxz + PAS318;
	AJ227=-I7yz - ILyz;
	AJ317=C7.*(I7xy + ILxy - PAS218) + S7.*XXP7;
	AJ327=S7.*XYP7 + C7.*YYP7;
	AJ337=S7.*XZP7 + C7.*YZP7;
	AJA117=AJ117.*C7 - AJ127.*S7;
	AJA217=AJ217.*C7 - AJ227.*S7;
	AJA317=AJ317.*C7 - AJ327.*S7;
	AJA337=AJ327.*C7 + AJ317.*S7;
	PAS217=-(L4.*MZP7);
	PAS227=-(AS17.*L4);
	PAS317=AS37.*L4;
	PAS337=-(AS17.*L4);
	XXP6=AJA117 + I6xx;
	XYP6=AJA217 + I6xy - PAS217;
	XZP6=AJA317 + I6xz - PAS317;
	YYP6=I6yy + L4.^2.*MP7 - 2.*PAS227 + ZZP7;
	YZP6=-AJ337 + I6yz;
	ZZP6=AJA337 + I6zz + L4.^2.*MP7 - 2.*PAS337;
	MXP6=AS17 + L4.*MP7 + mx6;
	MYP6=my6 - MZP7;
	MZP6=AS37 + mz6;
	MP6=m6 + MP7;
	AS16=C6.*MXP6 - MYP6.*S6;
	AS36=-(C6.*MYP6) - MXP6.*S6;
	AJ116=-((AJA217 + I6xy - PAS217).*S6) + C6.*XXP6;
	AJ126=C6.*XYP6 - S6.*YYP6;
	AJ136=C6.*XZP6 - S6.*YZP6;
	AJ216=AJA317 + I6xz - PAS317;
	AJ226=-AJ337 + I6yz;
	AJ316=-(C6.*(AJA217 + I6xy - PAS217)) - S6.*XXP6;
	AJ326=-(S6.*XYP6) - C6.*YYP6;
	AJ336=-(S6.*XZP6) - C6.*YZP6;
	AJA116=AJ116.*C6 - AJ126.*S6;
	AJA216=AJ216.*C6 - AJ226.*S6;
	AJA316=AJ316.*C6 - AJ326.*S6;
	AJA336=-(AJ326.*C6) - AJ316.*S6;
	XXP5=AJA116 + I5xx;
	XYP5=AJA216 + I5xy;
	XZP5=AJA316 + I5xz;
	YYP5=I5yy + ZZP6;
	YZP5=AJ336 + I5yz;
	ZZP5=AJA336 + I5zz;
	MXP5=AS16 + mx5;
	MYP5=my5 + MZP6;
	MZP5=AS36 + mz5;
	MP5=m5 + MP6;
	AS15=C5.*MXP5 - MYP5.*S5;
	AS35=C5.*MYP5 + MXP5.*S5;
	AJ115=-((AJA216 + I5xy).*S5) + C5.*XXP5;
	AJ125=C5.*XYP5 - S5.*YYP5;
	AJ135=C5.*XZP5 - S5.*YZP5;
	AJ215=-AJA316 - I5xz;
	AJ225=-AJ336 - I5yz;
	AJ315=C5.*(AJA216 + I5xy) + S5.*XXP5;
	AJ325=S5.*XYP5 + C5.*YYP5;
	AJ335=S5.*XZP5 + C5.*YZP5;
	AJA115=AJ115.*C5 - AJ125.*S5;
	AJA215=AJ215.*C5 - AJ225.*S5;
	AJA315=AJ315.*C5 - AJ325.*S5;
	AJA335=AJ325.*C5 + AJ315.*S5;
	PAS115=-(L3.*MZP5);
	PAS125=-(AS15.*L3);
	PAS325=-(AS35.*L3);
	PAS335=-(L3.*MZP5);
	XXP4=AJA115 + I4xx + L3.^2.*MP5 - 2.*PAS115;
	XYP4=AJA215 + I4xy - PAS125;
	XZP4=AJA315 + I4xz;
	YYP4=I4yy + ZZP5;
	YZP4=-AJ335 + I4yz - PAS325;
	ZZP4=AJA335 + I4zz + L3.^2.*MP5 - 2.*PAS335;
	MXP4=AS15 + mx4;
	MYP4=-(L3.*MP5) + my4 - MZP5;
	MZP4=AS35 + mz4;
	MP4=m4 + MP5;
	AS14=C4.*MXP4 - MYP4.*S4;
	AS34=-(C4.*MYP4) - MXP4.*S4;
	AJ114=-((AJA215 + I4xy - PAS125).*S4) + C4.*XXP4;
	AJ124=C4.*XYP4 - S4.*YYP4;
	AJ134=C4.*XZP4 - S4.*YZP4;
	AJ214=AJA315 + I4xz;
	AJ224=-AJ335 + I4yz - PAS325;
	AJ314=-(C4.*(AJA215 + I4xy - PAS125)) - S4.*XXP4;
	AJ324=-(S4.*XYP4) - C4.*YYP4;
	AJ334=-(S4.*XZP4) - C4.*YZP4;
	AJA114=AJ114.*C4 - AJ124.*S4;
	AJA214=AJ214.*C4 - AJ224.*S4;
	AJA314=AJ314.*C4 - AJ324.*S4;
	AJA334=-(AJ324.*C4) - AJ314.*S4;
	XXP3=AJA114 + I3xx;
	XYP3=AJA214 + I3xy;
	XZP3=AJA314 + I3xz;
	YYP3=I3yy + ZZP4;
	YZP3=AJ334 + I3yz;
	ZZP3=AJA334 + I3zz;
	MXP3=AS14 + mx3;
	MYP3=my3 + MZP4;
	MZP3=AS34 + mz3;
	MP3=m3 + MP4;
	AS13=C3.*MXP3 - MYP3.*S3;
	AS33=C3.*MYP3 + MXP3.*S3;
	AJ113=-((AJA214 + I3xy).*S3) + C3.*XXP3;
	AJ123=C3.*XYP3 - S3.*YYP3;
	AJ133=C3.*XZP3 - S3.*YZP3;
	AJ213=-AJA314 - I3xz;
	AJ223=-AJ334 - I3yz;
	AJ313=C3.*(AJA214 + I3xy) + S3.*XXP3;
	AJ323=S3.*XYP3 + C3.*YYP3;
	AJ333=S3.*XZP3 + C3.*YZP3;
	AJA113=AJ113.*C3 - AJ123.*S3;
	AJA213=AJ213.*C3 - AJ223.*S3;
	AJA313=AJ313.*C3 - AJ323.*S3;
	AJA333=AJ323.*C3 + AJ313.*S3;
	PAS113=-(L2.*MZP3);
	PAS123=-(AS13.*L2);
	PAS323=-(AS33.*L2);
	PAS333=-(L2.*MZP3);
	XXP2=AJA113 + I2xx + L2.^2.*MP3 - 2.*PAS113;
	XYP2=AJA213 + I2xy - PAS123;
	XZP2=AJA313 + I2xz;
	YYP2=I2yy + ZZP3;
	YZP2=-AJ333 + I2yz - PAS323;
	ZZP2=AJA333 + I2zz + L2.^2.*MP3 - 2.*PAS333;
	AJ312=-(C2.*(AJA213 + I2xy - PAS123)) - S2.*XXP2;
	AJ322=-(S2.*XYP2) - C2.*YYP2;
	AJ332=-(S2.*XZP2) - C2.*YZP2;
	AJA332=-(AJ322.*C2) - AJ312.*S2;
	ZZP1=AJA332 + I1zz;
	EC12=-(C3.*MYP3) - MXP3.*S3;
	EC32=C3.*MXP3 - MYP3.*S3;
	NC12=AJ133 - EC32.*L2;
	NC32=AJ333 + EC12.*L2;
	NC33=-(NC12.*S2) + C2.*ZZP3;
	ED12=-(C4.*MYP4) - MXP4.*S4;
	ED13=C3.*ED12;
	ED33=ED12.*S3;
	ND13=AJ134.*C3 - ED33.*L2 - S3.*ZZP4;
	ND33=ED13.*L2 + AJ134.*S3 + C3.*ZZP4;
	ND34=AJ334.*C2 - ND13.*S2;
	EE12=-(C5.*MYP5) - MXP5.*S5;
	EE32=C5.*MXP5 - MYP5.*S5;
	NE12=AJ135 - EE32.*L3;
	NE32=AJ335 + EE12.*L3;
	EE13=C4.*EE12;
	NE13=C4.*NE12 + S4.*ZZP5;
	NE33=-(NE12.*S4) + C4.*ZZP5;
	EE14=C3.*EE13 - EE32.*S3;
	EE34=C3.*EE32 + EE13.*S3;
	NE14=-(EE34.*L2) + C3.*NE13 - NE32.*S3;
	NE34=EE14.*L2 + C3.*NE32 + NE13.*S3;
	NE35=C2.*NE33 - NE14.*S2;
	EF12=-(C6.*MYP6) - MXP6.*S6;
	EF32=-(C6.*MXP6) + MYP6.*S6;
	EF13=C5.*EF12;
	EF33=EF12.*S5;
	NF13=AJ136.*C5 - EF33.*L3 - S5.*ZZP6;
	NF33=EF13.*L3 + AJ136.*S5 + C5.*ZZP6;
	EF14=C4.*EF13 + EF32.*S4;
	NF14=C4.*NF13 + AJ336.*S4;
	NF34=AJ336.*C4 - NF13.*S4;
	EF15=C3.*EF14 - EF33.*S3;
	EF35=C3.*EF33 + EF14.*S3;
	NF15=-(EF35.*L2) + C3.*NF14 - NF33.*S3;
	NF35=EF15.*L2 + C3.*NF33 + NF14.*S3;
	NF36=C2.*NF34 - NF15.*S2;
	EG12=-(C7.*MYP7) - MXP7.*S7;
	EG32=C7.*MXP7 - MYP7.*S7;
	NG22=-(EG32.*L4) - ZZP7;
	EG13=C6.*EG12;
	EG33=-(EG12.*S6);
	NG13=AJ137.*C6 - NG22.*S6;
	NG33=-(C6.*NG22) - AJ137.*S6;
	EG14=C5.*EG13 - EG32.*S5;
	EG34=C5.*EG32 + EG13.*S5;
	NG14=-(EG34.*L3) + C5.*NG13 - AJ337.*S5;
	NG34=AJ337.*C5 + EG14.*L3 + NG13.*S5;
	EG15=C4.*EG14 + EG33.*S4;
	NG15=C4.*NG14 + NG33.*S4;
	NG35=C4.*NG33 - NG14.*S4;
	EG16=C3.*EG15 - EG34.*S3;
	EG36=C3.*EG34 + EG15.*S3;
	NG16=-(EG36.*L2) + C3.*NG15 - NG34.*S3;
	NG36=EG16.*L2 + C3.*NG34 + NG15.*S3;
	NG37=C2.*NG35 - NG16.*S2;
	A(1,1)=Ia1 + ZZP1;
	A(2,1)=AJ332;
	A(3,1)=NC33;
	A(4,1)=ND34;
	A(5,1)=NE35;
	A(6,1)=NF36;
	A(7,1)=NG37;
	A(2,2)=Ia2 + ZZP2;
	A(3,2)=NC32;
	A(4,2)=ND33;
	A(5,2)=NE34;
	A(6,2)=NF35;
	A(7,2)=NG36;
	A(3,3)=Ia3 + ZZP3;
	A(4,3)=AJ334;
	A(5,3)=NE33;
	A(6,3)=NF34;
	A(7,3)=NG35;
	A(4,4)=Ia4 + ZZP4;
	A(5,4)=NE32;
	A(6,4)=NF33;
	A(7,4)=NG34;
	A(5,5)=Ia5 + ZZP5;
	A(6,5)=AJ336;
	A(7,5)=NG33;
	A(6,6)=Ia6 + ZZP6;
	A(7,6)=AJ337;
	A(7,7)=Ia7 + ZZP7;
    qdd=[qdd1;qdd2;qdd3;qdd4;qdd5;qdd6;qdd7];

    tic
    for i=1:1:7
    tau_inertia(i)=A(i,:)*qdd;
    end
    
    toc
    %%
    % tau_inertia7_subs = subs(tau_inertia(7), ...
    %     [q1, q2, q3, q4,q6, qdd1, qdd2, qdd3, qdd4,qdd6], [0, 0, 0, 0,0, 0,0,0,0,0]);
    % tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)
    % 
    % tau_inertia6_subs = subs(tau_inertia(6), ...
    %     [q1, q2, q3, q4, q5, qdd1, qdd2, qdd3, qdd4, qdd5], [0, 0, 0, 0, 0,0, 0,0,0,0]);
    % tau_inertia6=collect(simplify(tau_inertia6_subs),betaM)
    % 
    % tau_inertia5_subs = subs(tau_inertia(5), ...
    %     [q1, q2, q3, q4, q7, qdd1, qdd2, qdd3, qdd4, qdd7], [0, 0, 0, 0, 0,0, 0,0,0,0]);
    % tau_inertia5=collect(simplify(tau_inertia5_subs),betaM)
    % 
    % tau_inertia4_subs = subs(tau_inertia(4), ...
    %     [q1, q2, q3, q6, q7, qdd1, qdd2, qdd3, qdd6, qdd7], [0, 0, 0, 0, 0,0, 0,0,0,0]);
    % tau_inertia4=collect(simplify(tau_inertia4_subs),betaM)
    % 
    % tau_inertia3_subs = subs(tau_inertia(3), ...
    %     [q1, q2, q5, q6, q7, qdd1, qdd2, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0,0, 0,0,0,0]);
    % tau_inertia3=collect(simplify(tau_inertia3_subs),betaM)
    % 
    % tau_inertia2_subs = subs(tau_inertia(2), ...
    %     [q1, q4, q5, q6, q7, qdd1, qdd4, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0,0, 0,0,0,0]);
    % tau_inertia2=collect(simplify(tau_inertia2_subs),betaM)
    % 
    % tau_inertia1_subs = subs(tau_inertia(1), ...
    %     [q3, q4, q5, q6, q7, qdd3, qdd4, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0,0, 0,0,0,0]);
    % tau_inertia1=collect(simplify(tau_inertia1_subs),betaM)
%%
    tau_inertia7_subs = subs(tau_inertia(7), ...
        [q1, q2, q3, q4,q5,q6, qdd1, qdd2, qdd3, qdd4,qdd5,qdd6], [0, 0, 0, 0,0,0, 0,0,0,0,0,0]);
    tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)

    tau_inertia6_subs = subs(tau_inertia(6), ...
        [q1, q2, q3, q4, q5, q7,qdd1, qdd2, qdd3, qdd4, qdd5,qdd7], [0, 0, 0, 0, 0,0, 0,0,0,0,0,0]);
    tau_inertia6=collect(simplify(tau_inertia6_subs),betaM)

    tau_inertia6_subs = subs(tau_inertia(6), ...
        [q1, q2, q3, q4, q5, q7,qdd1, qdd2, qdd3, qdd4, qdd5,qdd7], [0, 0, 0, 0, 0,pi/2, 0,0,0,0,0,0]);
    tau_inertia6=collect(simplify(tau_inertia6_subs),betaM)

    tau_inertia5_subs = subs(tau_inertia(5), ...
        [q1, q2, q3, q4, q6, q7,qdd1, qdd2, qdd3, qdd4, qdd6, qdd7], [0, 0, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia5=collect(simplify(tau_inertia5_subs),betaM)

    tau_inertia5_subs = subs(tau_inertia(5), ...
        [q1, q2, q3, q4, q6, q7,qdd1, qdd2, qdd3, qdd4, qdd6, qdd7], [0, 0, 0, 0, pi/2, 0,0,0,0,0,0,0]);
    tau_inertia5=collect(simplify(tau_inertia5_subs),betaM)

    tau_inertia4_subs = subs(tau_inertia(4), ...
        [q1, q2, q3, q5, q6, q7,qdd1, qdd2, qdd3, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia4=collect(simplify(tau_inertia4_subs),betaM)

     tau_inertia4_subs = subs(tau_inertia(4), ...
        [q1, q2, q3, q5, q6, q7,qdd1, qdd2, qdd3, qdd5, qdd6, qdd7], [0, 0, 0, pi/2, 0, 0,0,0,0,0,0,0]);
    tau_inertia4=collect(simplify(tau_inertia4_subs),betaM)

    tau_inertia3_subs = subs(tau_inertia(3), ...
        [q1, q2, q4, q5, q6, q7,qdd1, qdd2, qdd4, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia3=collect(simplify(tau_inertia3_subs),betaM)

     tau_inertia3_subs = subs(tau_inertia(3), ...
        [q1, q2, q4, q5, q6, q7,qdd1, qdd2, qdd4, qdd5, qdd6, qdd7], [0, 0, pi/2, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia3=collect(simplify(tau_inertia3_subs),betaM)

    tau_inertia2_subs = subs(tau_inertia(2), ...
        [q1, q3, q4, q5, q6, q7,qdd1, qdd3, qdd4, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia2=collect(simplify(tau_inertia2_subs),betaM)

    tau_inertia2_subs = subs(tau_inertia(2), ...
        [q1, q3, q4, q5, q6, q7,qdd1, qdd3, qdd4, qdd5, qdd6, qdd7], [0, pi/2, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia2=collect(simplify(tau_inertia2_subs),betaM)

    tau_inertia1_subs = subs(tau_inertia(1), ...
        [q2, q3, q4, q5, q6, q7,qdd2, qdd3, qdd4, qdd5, qdd6, qdd7], [0, 0, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia1=collect(simplify(tau_inertia1_subs),betaM)

        tau_inertia1_subs = subs(tau_inertia(1), ...
        [q2, q3, q4, q5, q6, q7,qdd2, qdd3, qdd4, qdd5, qdd6, qdd7], [pi/2, 0, 0, 0, 0, 0,0,0,0,0,0,0]);
    tau_inertia1=collect(simplify(tau_inertia1_subs),betaM)

    % tau_inertia7_subs = subs(tau_inertia(7), [q1, q2, q3, q4, q5, q6], [0, 0, 0, 0, 0, 0]);
    % tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)
    % 
    % tau_inertia7_subs = subs(tau_inertia(7), [q1, q2, q3, q4, q5, q6], [0, 0, 0, 0, 0, 0]);
    % tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)
    % 
    % tau_inertia7_subs = subs(tau_inertia(7), [q1, q2, q3, q4, q5, q6], [0, 0, 0, 0, 0, 0]);
    % tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)
    % 
    % tau_inertia7_subs = subs(tau_inertia(7), [q1, q2, q3, q4, q5, q6], [0, 0, 0, 0, 0, 0]);
    % tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)
    % 
    % tau_inertia7_subs = subs(tau_inertia(7), [q1, q2, q3, q4, q5, q6], [0, 0, 0, 0, 0, 0]);
    % tau_inertia7=collect(simplify(tau_inertia7_subs),betaM)

    % tau_inertia1=collect(tau_inertia(1),betaM)
    % tau_inertia1=collect(tau_inertia(1),betaM)
  


save save_dualArmLeft_dyn_INM.mat




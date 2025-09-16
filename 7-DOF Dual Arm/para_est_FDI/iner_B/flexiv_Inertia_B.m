%% 
jnt_ax=1;   %随动轴
filename = ['flexiv_data_write_inertial_ident_J',num2str(jnt),'_B.txt'];
txt2data_flexiv;
flexiv_data_filtering_notsavemat;
close all
time_mat_name = ['time_inertial_ident_J',num2str(jnt),'_B.mat'];
load(time_mat_name);
load betaG.mat
load betaM_diag.mat
g=-9.81;

%%   取指引点
TT = save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+save_T_neg2pos.T4+save_T_neg2pos.T5+save_T_neg2pos.T6+save_T_neg2pos.T7;
for i = 1:3
    offset_time = TT*2*(i-1);
    select_T_neg2pos_vel_left(i)  = save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+offset_time;
    select_T_neg2pos_vel_right(i) = save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+save_T_neg2pos.T4+offset_time;
    select_T_pos2neg_vel_left(i)  = 2*TT-save_T_pos2neg.T7-save_T_pos2neg.T6-save_T_pos2neg.T5-save_T_pos2neg.T4+offset_time;
    select_T_pos2neg_vel_right(i) = 2*TT-save_T_pos2neg.T7-save_T_pos2neg.T6-save_T_pos2neg.T5+offset_time;    
end

for i = 1:3
    index_neg2pos{i} = find(t>=select_T_neg2pos_vel_left(i)&t<=select_T_neg2pos_vel_right(i));
    index_pos2neg{i} = find(t>=select_T_pos2neg_vel_left(i)&t<=select_T_pos2neg_vel_right(i));
end
len = min([length(index_neg2pos{1}),length(index_pos2neg{1}),length(index_neg2pos{2}),length(index_pos2neg{2}),length(index_neg2pos{3}),length(index_pos2neg{3})]);
for i = 1:3
    index_neg2pos{i} = index_neg2pos{i}(1:len);
    index_pos2neg{i} = index_pos2neg{i}(1:len);
end
%% 偏移43个点抵消延迟
if jnt == 1
    offset_cnt = 43;
elseif jnt == 2
    offset_cnt = 43;
elseif jnt == 3
    offset_cnt = 43;
elseif jnt == 4
    offset_cnt = 30;
elseif jnt == 5
    offset_cnt = 43;
elseif jnt == 6
    offset_cnt = 43;
elseif jnt == 7
    offset_cnt = 43;
end
for i = 1:3
    index_neg2pos{i} = index_neg2pos{i}+offset_cnt;   
    index_pos2neg{i} = index_pos2neg{i}+offset_cnt;
end



%% 按索引点取加减速段
%plot(t_select,vel_select)
% figure(fig_cnt)
% fig_cnt=fig_cnt+1;
for i = 1:3
    t_select_neg2pos{i} = t(index_neg2pos{i});
    vel_select_neg2pos_ax{i} = q_dot_filtered(index_neg2pos{i},jnt_ax);
    pos_select_neg2pos_ax{i} = q_filtered(index_neg2pos{i},jnt_ax);
    acc_select_neg2pos_ax{i} = q_ddot_filtered(index_neg2pos{i},jnt_ax);
    acc_select_neg2pos{i} = q_ddot_filtered(index_neg2pos{i},jnt);
    vel_select_neg2pos{i} = q_dot_filtered(index_neg2pos{i},jnt);
    pos_select_neg2pos{i} = q_filtered(index_neg2pos{i},jnt);
    tau_select_neg2pos{i} = jointacttorque_filtered(index_neg2pos{i},jnt);
    figure(1); plot(pos_select_neg2pos{i});hold on;
    figure(2); plot(vel_select_neg2pos{i});hold on;
    figure(3); plot(acc_select_neg2pos{i});hold on;
    figure(4); plot(tau_select_neg2pos{i});hold on;
    t_select_pos2neg{i} = t(index_pos2neg{i});
    vel_select_pos2neg_ax{i} = q_dot_filtered(index_pos2neg{i},jnt_ax);
    pos_select_pos2neg_ax{i} = q_filtered(index_pos2neg{i},jnt_ax);
    acc_select_pos2neg_ax{i} = q_ddot_filtered(index_pos2neg{i},jnt_ax);
    acc_select_pos2neg{i} = q_ddot_filtered(index_pos2neg{i},jnt);
    vel_select_pos2neg{i} = q_dot_filtered(index_pos2neg{i},jnt);
    pos_select_pos2neg{i} = q_filtered(index_pos2neg{i},jnt);
    tau_select_pos2neg{i} = jointacttorque_filtered(index_pos2neg{i},jnt);
    figure(1); plot(flip(pos_select_pos2neg{i}));hold on;ylabel('pos');
    figure(2); plot(flip(vel_select_pos2neg{i}));hold on;ylabel('vel');
    figure(3); plot(flip(acc_select_pos2neg{i}));hold on;ylabel('acc');
    figure(4); plot(flip(tau_select_pos2neg{i}));hold on;ylabel('tau');
    figure(5); plot(pos_select_neg2pos{i}-flip(pos_select_pos2neg{i}));hold on;ylabel('posDiff');
end

close all

%% 将三段加速段的结果取平均
if jnt==4 %第四轴的实验结果有问题，前两个周期有一些错误数据，只用最后第三个周期
    vel_neg2pos_ax = (vel_select_neg2pos_ax{3}+vel_select_neg2pos_ax{3}+vel_select_neg2pos_ax{3})/3;
    pos_neg2pos_ax = (pos_select_neg2pos_ax{3}+pos_select_neg2pos_ax{3}+pos_select_neg2pos_ax{3})/3;
    acc_neg2pos_ax = (acc_select_neg2pos_ax{3}+acc_select_neg2pos_ax{3}+acc_select_neg2pos_ax{3})/3;
    pos_neg2pos = (pos_select_neg2pos{3}+pos_select_neg2pos{3}+pos_select_neg2pos{3})/3;
    vel_neg2pos = (vel_select_neg2pos{3}+vel_select_neg2pos{3}+vel_select_neg2pos{3})/3;
    acc_neg2pos = (acc_select_neg2pos{3}+acc_select_neg2pos{3}+acc_select_neg2pos{3})/3;
    tau_neg2pos = (tau_select_neg2pos{3}+tau_select_neg2pos{3}+tau_select_neg2pos{3})/3;

    vel_pos2neg_ax = (vel_select_pos2neg_ax{3}+vel_select_pos2neg_ax{3}+vel_select_pos2neg_ax{3})/3;
    pos_pos2neg_ax = (pos_select_pos2neg_ax{3}+pos_select_pos2neg_ax{3}+pos_select_pos2neg_ax{3})/3;
    acc_pos2neg_ax = (acc_select_pos2neg_ax{3}+acc_select_pos2neg_ax{3}+acc_select_pos2neg_ax{3})/3;
    pos_pos2neg = (pos_select_pos2neg{3}+pos_select_pos2neg{3}+pos_select_pos2neg{3})/3;
    vel_pos2neg = (vel_select_pos2neg{3}+vel_select_pos2neg{3}+vel_select_pos2neg{3})/3;
    acc_pos2neg = (acc_select_pos2neg{3}+acc_select_pos2neg{3}+acc_select_pos2neg{3})/3;
    tau_pos2neg = (tau_select_pos2neg{3}+tau_select_pos2neg{3}+tau_select_pos2neg{3})/3;
else
   vel_neg2pos_ax = (vel_select_neg2pos_ax{1}+vel_select_neg2pos_ax{2}+vel_select_neg2pos_ax{3})/3;
    pos_neg2pos_ax = (pos_select_neg2pos_ax{1}+pos_select_neg2pos_ax{2}+pos_select_neg2pos_ax{3})/3;
    acc_neg2pos_ax = (acc_select_neg2pos_ax{1}+acc_select_neg2pos_ax{2}+acc_select_neg2pos_ax{3})/3;
    pos_neg2pos = (pos_select_neg2pos{1}+pos_select_neg2pos{2}+pos_select_neg2pos{3})/3;
    vel_neg2pos = (vel_select_neg2pos{1}+vel_select_neg2pos{2}+vel_select_neg2pos{3})/3;
    acc_neg2pos = (acc_select_neg2pos{1}+acc_select_neg2pos{2}+acc_select_neg2pos{3})/3;
    tau_neg2pos = (tau_select_neg2pos{1}+tau_select_neg2pos{2}+tau_select_neg2pos{3})/3;

    vel_pos2neg_ax = (vel_select_pos2neg_ax{1}+vel_select_pos2neg_ax{2}+vel_select_pos2neg_ax{3})/3;
    pos_pos2neg_ax = (pos_select_pos2neg_ax{1}+pos_select_pos2neg_ax{2}+pos_select_pos2neg_ax{3})/3;
    acc_pos2neg_ax = (acc_select_pos2neg_ax{1}+acc_select_pos2neg_ax{2}+acc_select_pos2neg_ax{3})/3;
    pos_pos2neg = (pos_select_pos2neg{1}+pos_select_pos2neg{2}+pos_select_pos2neg{3})/3;
    vel_pos2neg = (vel_select_pos2neg{1}+vel_select_pos2neg{2}+vel_select_pos2neg{3})/3;
    acc_pos2neg = (acc_select_pos2neg{1}+acc_select_pos2neg{2}+acc_select_pos2neg{3})/3;
    tau_pos2neg = (tau_select_pos2neg{1}+tau_select_pos2neg{2}+tau_select_pos2neg{3})/3; 
end


%% 对齐加减速段计算惯性力
acc_data=(acc_neg2pos+flip(acc_pos2neg))/2;
pos_data=(pos_neg2pos+flip(pos_pos2neg))/2;
vel_data_ax=(vel_pos2neg_ax+flip(vel_pos2neg_ax));
acc_data_ax = (acc_neg2pos_ax+flip(acc_pos2neg_ax))/2;
% q4=pos_data;
q1_dot=vel_data_ax;
q1_ddot=acc_data_ax;
% q4_ddot=acc_data;
dq1 = q1_dot;
ddq1 = q1_ddot;

%% 
L1=0.155+0.21;
L2=0.205+0.19;
L3=0.195+0.19;
L4=0.11;
L5=0.02;
beta_G = [beta32 beta33 beta34 beta35 beta36 beta38 beta39 beta40 beta41 beta42]';


%% 计算重力矩
i=1;
ze = zeros(length(pos_neg2pos),1);
if jnt == 2
    q2 = pos_neg2pos;
    Gravity_pos = sin(q2)*(beta34 + beta35 + beta38 - beta42) - cos(q2)*(beta32 + beta33 - beta36 + beta40);
    q2 = pos_pos2neg;
    Gravity_neg = sin(q2)*(beta34 + beta35 + beta38 - beta42) - cos(q2)*(beta32 + beta33 - beta36 + beta40);
    q2 = pos_neg2pos;
    Y_G_B = [ ze, L2*dq1.^2.*cos(2*q2), dq1.^2.*(L5*cos(2*q2) - L2*sin(2*q2)), -dq1.^2.*(L3*cos(2*q2) - L5*cos(2*q2) + L2*sin(2*q2) - L5*sin(2*q2)), -dq1.^2.*(L2*cos(2*q2) - L5*cos(2*q2) - L3*sin(2*q2) + L5*sin(2*q2)), ze, L2*ddq1.*cos(q2), dq1.^2.*(L2*cos(2*q2) + L5*sin(2*q2)), ddq1.*(cos(q2)*(L2 - L5) - sin(q2)*(L3 - L5)), dq1.^2.*(L3*cos(2*q2) - L5*cos(2*q2) + L2*sin(2*q2) - L5*sin(2*q2))];
    Y_GB_beta = Y_G_B*beta_G;
elseif jnt == 3
    q3 = pos_neg2pos;
    Gravity_pos = cos(q3)*(beta39 + beta41) + sin(q3)*(beta33 + beta34 + beta35 - beta42);
    q3 = pos_pos2neg;
    Gravity_neg = cos(q3)*(beta39 + beta41) + sin(q3)*(beta33 + beta34 + beta35 - beta42);
    q3 = pos_neg2pos;
    Y_G_B = [ ze, -L2*ddq1.*cos(q3), -L5*ddq1.*cos(q3), ddq1.*cos(q3)*(L3 - L5), (L5*sin(2*q3) - L3*sin(2*q3)).*dq1.^2 + ddq1.*(L2*cos(q3) - L5*cos(q3)), ze, L2*ddq1.*sin(q3), - L5*sin(2*q3).*dq1.^2 - L2*ddq1.*cos(q3), L3*dq1.^2.*cos(2*q3) - L5*dq1.^2.*cos(2*q3) + L2*ddq1.*sin(q3) - L5*ddq1.*sin(q3), -ddq1.*cos(q3)*(L3 - L5)];
    Y_GB_beta = Y_G_B*beta_G;
elseif jnt == 4
    q4 = pos_neg2pos;
    Gravity_pos = cos(q4)*(beta34 + beta35 - beta42) + sin(q4)*(beta36 - beta40);
    q4 = pos_pos2neg;
    Gravity_neg = cos(q4)*(beta34 + beta35 - beta42) + sin(q4)*(beta36 - beta40); 
    q4 = pos_neg2pos;
    Y_G_B = [ ze, ze, L5*dq1.^2.*sin(q4), -dq1.^2.*(L3*(2*cos(q4).^2 - 1) - L5*sin(q4) + 2*L5*cos(q4).*sin(q4)), -dq1.^2.*(L5*cos(q4) - L5*(2*cos(q4).^2 - 1) + 2*L3*cos(q4).*sin(q4)), ze, ze, L5*dq1.^2.*cos(q4), -ddq1.*(L3*cos(q4) + L5*sin(q4)), dq1.^2.*(L3*(2*cos(q4).^2 - 1) - L5*sin(q4) + 2*L5*cos(q4).*sin(q4))];
    Y_GB_beta = Y_G_B*beta_G;
elseif jnt == 5
    q5 = pos_neg2pos;
    Gravity_pos = beta41*cos(q5) + sin(q5)*(beta35 - beta42);
    q5 = pos_pos2neg;
    Gravity_neg = beta41*cos(q5) + sin(q5)*(beta35 - beta42);
    q5 = pos_neg2pos;
    Y_G_B = [ ze, ze, ze, -ddq1.*cos(q5)*(L3 - L5), ze, ze, ze, ze, ddq1.*sin(q5)*(L3 - L5), ddq1.*cos(q5)*(L3 - L5)];
    Y_GB_beta = Y_G_B*beta_G;
elseif jnt == 6  
    q6 = pos_neg2pos;
    Gravity_pos = beta36*cos(q6) - beta42*sin(q6);
    q6 = pos_pos2neg;
    Gravity_neg = beta36*cos(q6) - beta42*sin(q6);   
    q6 = pos_neg2pos;
    Y_G_B = [ ze, ze, ze, ze, dq1.^2.*sin(q6)*(L3 - L5), ze, ze, ze, ze, dq1.^2.*cos(q6)*(L3 - L5)];
    Y_GB_beta = Y_G_B*beta_G;
end
Gravity_pos = Gravity_pos*g;
Gravity_neg = Gravity_neg*g;

%% 计算M+C项目：包括betaM和betaG，减去了重力G项
iner_tau_MC=(tau_neg2pos+flip(tau_pos2neg))/2-(Gravity_pos+flip(Gravity_neg))/2;
iner_tau = iner_tau_MC-Y_GB_beta;
%iner_data=(tau_neg2pos+flip(tau_pos2neg))/2-g*(Gravity_pos+flip(Gravity_neg))/2;
qx = pos_data;
Phi = [0.5*sin(2*qx).*q1_dot.*q1_dot,cos(2*qx).*q1_dot.*q1_dot,sin(qx).*q1_ddot,cos(qx).*q1_ddot];
U = iner_tau;
betaM_offdiag=pinv(Phi)*U
% beta3=betaM_offdiag(1);
% beta8=betaM_offdiag(2);
% beta13=betaM_offdiag(3);
% beta18=betaM_offdiag(4);

% acc_data_ax = (acc_neg2pos_ax+flip(acc_pos2neg_ax))/2;
%    figure(1)
%    plot(acc_data_ax) 
%    figure(2)
%    plot(iner_data) 
% U=iner_data;
% Y=acc_data_ax;
% % beta3_8_13_18=pinv(Y)*U;
% figure
% plot(iner_tau_MC)
% figure
% plot((tau_neg2pos+flip(tau_pos2neg))/2)
% figure
% plot(g*(Gravity_pos+flip(Gravity_neg))/2)
% figure
% plot(Y_GB_beta)
% figure
% plot(iner_tau)
if jnt == 4
    U(700:1106) = U(700)+(U(700:1106)-U(700))*0.5;
    U(2778:4382) = U(2778:4382)*0.5;
end
figure
plot(U)
hold on
plot(Phi*betaM_offdiag)
legend('U','Phi_beta')

%% save to .mat file
filename = ['jnt',num2str(jnt),'B.mat'];
save(filename,'U','Phi','betaM_offdiag')

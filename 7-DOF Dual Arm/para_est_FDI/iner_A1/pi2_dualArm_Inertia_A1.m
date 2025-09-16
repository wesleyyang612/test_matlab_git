load filtered_data.mat
load betaG_dualArm.mat
g=-9.81;
offset_angle=(90-28.4898)*pi/180;
gs=g*sin(offset_angle);
gc=g*cos(offset_angle);
tau_cof=[4.2,4.2*0.9/2.8,4.2*1.462,4.2*1.462,1.6*3.6239,1.6*3.6239,1.6*3.2139];
%g = 0;

%% 读文件
pos_act = q_filtered(:,jnt);
vel_act = q_dot_filtered(:,jnt);
acc_act = q_ddot_filtered(:,jnt);
jointacttorque_filtered(:,jnt) = jointacttorque_filtered(:,jnt)*tau_cof(jnt);
plot(acc_act)

%% 划分时间段
select_T_neg2pos_acc_left  = zeros(acc_num,1);
select_T_neg2pos_acc_right = zeros(acc_num,1);
select_T_neg2pos_dec_left  = zeros(acc_num,1);
select_T_neg2pos_dec_right = zeros(acc_num,1);
select_T_pos2neg_acc_left  = zeros(acc_num,1);
select_T_pos2neg_acc_right = zeros(acc_num,1);
select_T_pos2neg_dec_left  = zeros(acc_num,1);
select_T_pos2neg_dec_right = zeros(acc_num,1);


% save_delay = [0.057,0.057,0.054,0.052,0.052,0.050,0.052];
% save_delay = [0.057,0.05,0.05,0.05,0.05,0.06,0.05];
% delay = save_delay(jnt);
% tmp = delay+save_T0{1}.T1 +save_T0{1}.T2 +save_T0{1}.T3 +save_T0{1}.T4 +save_T0{1}.T5 +save_T0{1}.T6 +save_T0{1}.T7;
% for i = 1:acc_num 
%     select_T_neg2pos_acc_left(i)  = tmp + save_T_neg2pos{i}.T1;
%     select_T_neg2pos_acc_right(i) = select_T_neg2pos_acc_left(i) + save_T_neg2pos{i}.T2;
%     select_T_neg2pos_dec_left(i)  = select_T_neg2pos_acc_right(i) + save_T_neg2pos{i}.T3 + save_T_neg2pos{i}.T4+save_T_neg2pos{i}.T5;
%     select_T_neg2pos_dec_right(i) = select_T_neg2pos_dec_left(i) + save_T_neg2pos{i}.T6;
%     select_T_pos2neg_acc_left(i)=select_T_neg2pos_dec_right(i)+save_T_neg2pos{i}.T7+save_T_pos2neg{i}.T1;
%     select_T_pos2neg_acc_right(i) = select_T_pos2neg_acc_left(i) + save_T_pos2neg{i}.T2;
%     select_T_pos2neg_dec_left(i)  = select_T_pos2neg_acc_right(i) + save_T_pos2neg{i}.T3 + save_T_pos2neg{i}.T4+save_T_pos2neg{i}.T5;
%     select_T_pos2neg_dec_right(i) = select_T_pos2neg_dec_left(i) + save_T_pos2neg{i}.T6;
%     tmp = select_T_pos2neg_dec_right(i) + save_T_pos2neg{i}.T7;
% end
save_delay = [0.057,0.05,0.05,0.05,0.05,0.06,0.05];
delay = save_delay(jnt);
tmp = delay+save_T0{1}.T;
for i = 1:acc_num 
    select_T_neg2pos_acc_left(i)  = tmp + save_T_neg2pos{i}.T1;
    select_T_neg2pos_acc_right(i) = select_T_neg2pos_acc_left(i) + save_T_neg2pos{i}.T2;
    select_T_neg2pos_dec_left(i)  = select_T_neg2pos_acc_right(i) + save_T_neg2pos{i}.T3 + save_T_neg2pos{i}.T4+save_T_neg2pos{i}.T5;
    select_T_neg2pos_dec_right(i) = select_T_neg2pos_dec_left(i) + save_T_neg2pos{i}.T6;
    select_T_pos2neg_acc_left(i)=select_T_neg2pos_dec_right(i)+save_T_neg2pos{i}.T7+save_T_pos2neg{i}.T1;
    select_T_pos2neg_acc_right(i) = select_T_pos2neg_acc_left(i) + save_T_pos2neg{i}.T2;
    select_T_pos2neg_dec_left(i)  = select_T_pos2neg_acc_right(i) + save_T_pos2neg{i}.T3 + save_T_pos2neg{i}.T4+save_T_pos2neg{i}.T5;
    select_T_pos2neg_dec_right(i) = select_T_pos2neg_dec_left(i) + save_T_pos2neg{i}.T6;
    tmp = tmp+save_T_neg2pos{i}.T+ save_T_pos2neg{i}.T;
end



%%   取指引点
for i = 1:acc_num
    index_neg2pos_acc{i} = find(t>=select_T_neg2pos_acc_left(i)&t<=select_T_neg2pos_acc_right(i));
    index_neg2pos_dec{i} = find(t>=select_T_neg2pos_dec_left(i)&t<=select_T_neg2pos_dec_right(i));
    index_pos2neg_acc{i} = find(t>=select_T_pos2neg_acc_left(i)&t<=select_T_pos2neg_acc_right(i));
    index_pos2neg_dec{i} = find(t>=select_T_pos2neg_dec_left(i)&t<=select_T_pos2neg_dec_right(i));
    len = min([length(index_neg2pos_acc{i}),length(index_neg2pos_dec{i}),length(index_pos2neg_acc{i}),length(index_pos2neg_dec{i})]);
    index_neg2pos_acc{i} = index_neg2pos_acc{i}(1:len);
    index_neg2pos_dec{i} = index_neg2pos_dec{i}(1:len);
    index_pos2neg_acc{i} = index_pos2neg_acc{i}(1:len);
    index_pos2neg_dec{i} = index_pos2neg_dec{i}(1:len);
end

%% 按索引点取匀加减速段
% plot(t_select,vel_select)
delete_low_vel_num = 0;
% figure(fig_cnt)
% fig_cnt=fig_cnt+1;
% if jnt == 1
%     delete_low_vel_num = 0; %删除低加速时失真的点位
% elseif jnt == 4
%     delete_low_vel_num = 0; %删除低加速时失真的点位
% elseif jnt == 6
%     delete_low_vel_num = 0; %删除低加速时失真的点位
% else
%     delete_low_vel_num = 0; %删除低加速时失真的点位   
% end

index_neg2pos_acc = index_neg2pos_acc(delete_low_vel_num+1:10);
index_neg2pos_dec = index_neg2pos_dec(delete_low_vel_num+1:10);
index_pos2neg_acc = index_pos2neg_acc(delete_low_vel_num+1:10);
index_pos2neg_dec = index_pos2neg_dec(delete_low_vel_num+1:10);
acc_num
acc_num_high = acc_num-delete_low_vel_num;
for i = 1:acc_num_high
    t_select_neg2pos_acc{i} = t(index_neg2pos_acc{i});
    vel_select_neg2pos_acc{i} = q_dot_filtered(index_neg2pos_acc{i},jnt);
    pos_select_neg2pos_acc{i} = q_filtered(index_neg2pos_acc{i},jnt);
    acc_select_neg2pos_acc{i} = q_ddot_filtered(index_neg2pos_acc{i},jnt);
    tau_select_neg2pos_acc{i} = jointacttorque_filtered(index_neg2pos_acc{i},jnt);
    % plot(vel_select_neg2pos_acc{i});
    % plot(pos_select_neg2pos_acc{i});
    % plot(tau_select_neg2pos_acc{i});
    plot(acc_select_neg2pos_acc{i});
    hold on
    t_select_neg2pos_dec{i} = t(index_neg2pos_dec{i});
    vel_select_neg2pos_dec{i} = q_dot_filtered(index_neg2pos_dec{i},jnt);
    pos_select_neg2pos_dec{i} = q_filtered(index_neg2pos_dec{i},jnt);
    acc_select_neg2pos_dec{i} = q_ddot_filtered(index_neg2pos_dec{i},jnt);
    tau_select_neg2pos_dec{i} = jointacttorque_filtered(index_neg2pos_dec{i},jnt);
    % plot(vel_select_neg2pos_dec{i});
    % plot(pos_select_neg2pos_dec{i});
    % plot(tau_select_neg2pos_dec{i});
    % hold on
    t_select_pos2neg_acc{i} = t(index_pos2neg_acc{i});
    vel_select_pos2neg_acc{i} = q_dot_filtered(index_pos2neg_acc{i},jnt);
    pos_select_pos2neg_acc{i} = q_filtered(index_pos2neg_acc{i},jnt);
    acc_select_pos2neg_acc{i} = q_ddot_filtered(index_pos2neg_acc{i},jnt);
    tau_select_pos2neg_acc{i} = jointacttorque_filtered(index_pos2neg_acc{i},jnt);
    % plot(vel_select_pos2neg_acc{i});
    % plot(pos_select_pos2neg_acc{i});
    % plot(tau_select_pos2neg_acc{i});
    % hold on
    t_select_pos2neg_dec{i} = t(index_pos2neg_dec{i});
    vel_select_pos2neg_dec{i} = q_dot_filtered(index_pos2neg_dec{i},jnt);
    pos_select_pos2neg_dec{i} = q_filtered(index_pos2neg_dec{i},jnt);
    acc_select_pos2neg_dec{i} = q_ddot_filtered(index_pos2neg_dec{i},jnt);
    tau_select_pos2neg_dec{i} = jointacttorque_filtered(index_pos2neg_dec{i},jnt);
    % plot(vel_select_pos2neg_dec{i});
    % plot(pos_select_pos2neg_dec{i});
    % plot(tau_select_pos2neg_dec{i});
    % hold on
end


close all




%% 对齐匀加减速段计算惯性力
acc_data = zeros(acc_num_high,2);
iner_data = zeros(acc_num_high,2);

% figure(1)
for i = 1:acc_num_high
   
    %% 计算第二构型重力矩，（下一关节角是pi/2）
    if jnt == 1
        q1 = pos_select_neg2pos_acc{i};
        Gravity_pos =beta32*gs*cos(q1) - beta41*gs*sin(q1) - beta43*gs*sin(q1) - beta45*gs*sin(q1) - beta39*gs*sin(q1) + beta37*gs*cos(q1) + beta38*gs*cos(q1) - beta40*gs*cos(q1) - beta42*gs*cos(q1);
        q1 = pos_select_neg2pos_dec{i};
        Gravity_neg =beta32*gs*cos(q1) - beta41*gs*sin(q1) - beta43*gs*sin(q1) - beta45*gs*sin(q1) - beta39*gs*sin(q1) + beta37*gs*cos(q1) + beta38*gs*cos(q1) - beta40*gs*cos(q1) - beta42*gs*cos(q1);
    elseif jnt == 2
        q2 = pos_select_neg2pos_acc{i};
        Gravity_pos =  beta37*gc*sin(q2) + beta38*gc*sin(q2) - beta40*gc*sin(q2) - beta42*gc*sin(q2) + beta33*gc*cos(q2) - beta41*gc*cos(q2) - beta43*gc*cos(q2) - beta45*gc*cos(q2);
       
        q2 = pos_select_neg2pos_dec{i};
        Gravity_neg =  beta37*gc*sin(q2) + beta38*gc*sin(q2) - beta40*gc*sin(q2) - beta42*gc*sin(q2) + beta33*gc*cos(q2) - beta41*gc*cos(q2) - beta43*gc*cos(q2) - beta45*gc*cos(q2);
        % Gravity_neg=-20*ones(size(Gravity_pos));
    elseif jnt == 3
        q3 = pos_select_neg2pos_acc{i};
        Gravity_pos =   beta34*gs*cos(q3) - beta43*gs*sin(q3) - beta45*gs*sin(q3) - beta41*gs*sin(q3) + beta37*gs*cos(q3) + beta38*gs*cos(q3) - beta42*gs*cos(q3);
        q3 = pos_select_neg2pos_acc{i};
        Gravity_neg =   beta34*gs*cos(q3) - beta43*gs*sin(q3) - beta45*gs*sin(q3) - beta41*gs*sin(q3) + beta37*gs*cos(q3) + beta38*gs*cos(q3) - beta42*gs*cos(q3);
    elseif jnt == 4
        q4 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta37*gc*sin(q4) + beta38*gc*sin(q4) - beta42*gc*sin(q4) + beta35*gc*cos(q4) - beta43*gc*cos(q4) - beta45*gc*cos(q4);
        q4 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta37*gc*sin(q4) + beta38*gc*sin(q4) - beta42*gc*sin(q4) + beta35*gc*cos(q4) - beta43*gc*cos(q4) - beta45*gc*cos(q4);
    elseif jnt == 5
        q5 = pos_select_neg2pos_acc{i};
        Gravity_pos =  beta36*gs*cos(q5) - beta45*gs*sin(q5) - beta43*gs*sin(q5) + beta37*gs*cos(q5) + beta38*gs*cos(q5);
        q5 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta36*gs*cos(q5) - beta45*gs*sin(q5) - beta43*gs*sin(q5) + beta37*gs*cos(q5) + beta38*gs*cos(q5);
    elseif jnt == 6
        q6 = pos_select_neg2pos_acc{i};
        Gravity_pos =beta37*gc*sin(q6) - beta45*gc*sin(q6) + beta44*gc*cos(q6);
        q6 = pos_select_neg2pos_dec{i};
        Gravity_neg =beta37*gc*sin(q6) - beta45*gc*sin(q6) + beta44*gc*cos(q6);
    % elseif jnt == 7
    %     q6 = pos_select_neg2pos_acc{i};
    %     Gravity_pos = beta37*gc*sin(q6) + beta38*gc*sin(q6) + beta44*gc*cos(q6);
    %     q6 = pos_select_neg2pos_dec{i};
    %     Gravity_neg = beta37*gc*sin(q6) + beta38*gc*sin(q6) + beta44*gc*cos(q6);
    end
    Gravity_pos = Gravity_pos
    Gravity_neg = Gravity_neg

    % Gravity_pos = Gravity_pos*g;
    % Gravity_neg = Gravity_neg*g;
        
   %% 算惯性力（减去重力矩） 
   iner_ad{i}=(tau_select_neg2pos_acc{i}+flip(tau_select_pos2neg_dec{i}))/2 - Gravity_pos;
   iner_da{i}=(tau_select_neg2pos_dec{i}+flip(tau_select_pos2neg_acc{i}))/2 - Gravity_neg;
   % iner_ad{i}=(tau_select_neg2pos_acc{i}+flip(tau_select_pos2neg_dec{i}))/2;
   % iner_da{i}=(tau_select_neg2pos_dec{i}+flip(tau_select_pos2neg_acc{i}))/2;
   % plot(acc_select_neg2pos_acc{i},iner_ad{i}) 
   % hold on
   % plot(acc_select_pos2neg_acc{i},iner_da{i})
   % hold on
   figure(1)
   plot(acc_select_neg2pos_acc{i}) 
   hold on
   plot(acc_select_pos2neg_dec{i}) 
   hold on
   title('acc')
   figure(2)
   plot(acc_select_neg2pos_dec{i}) 
   hold on
   plot(acc_select_pos2neg_acc{i}) 
   hold on
   title('acc')
   figure(3)
   plot(pos_select_neg2pos_acc{i}-flip(pos_select_pos2neg_dec{i})) 
   hold on
   title('posDiff')
%    plot(pos_select_pos2neg_dec{i}) 
%    hold on
   figure(4)
   plot(pos_select_neg2pos_dec{i}) 
   hold on
   plot(pos_select_pos2neg_acc{i}) 
   hold on
   title('pos')
   figure(5)
   plot(iner_ad{i}) 
   hold on
   plot(iner_da{i})
   hold on
   title('ienrtia torque')
   iner_data(i,1)=mean(iner_ad{i});
   iner_data(i,2)=mean(iner_da{i});
   acc_data(i,1)=mean(acc_select_neg2pos_acc{i});
   acc_data(i,2)=mean(acc_select_pos2neg_acc{i});

end

figure(6)
f1=fit(acc_data(:,1),iner_data(:,1),'poly1')
plot(f1,acc_data(:,1),iner_data(:,1),'-o');
xlabel('acc(rad/s?)')
ylabel('iner(Nm)')
title(['joint ',num2str(jnt),' friction identification'])
hold on
f2=fit(acc_data(:,2),iner_data(:,2),'poly1')
plot(f2,acc_data(:,2),iner_data(:,2),'-o');
xlabel('acc(rad/s?)')
ylabel('iner(Nm)')
title(['joint ',num2str(jnt),' inertia identification'])




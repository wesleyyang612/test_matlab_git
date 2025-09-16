load filtered_data.mat
load betaG_dualArm.mat
g=-9.81;
offset_angle=(90-28.4898)*pi/180;
gs=g*sin(offset_angle);
gc=g*cos(offset_angle);
tau_cof=[4.2*0.9/2.8,4.2*0.9/2.8,4.2*1.462,4.2*1.462,1.6*3.6239,1.6*3.6239,1.6*3.2139];
% sign=[1,-1,1,1,1,1,1];

%% 读文件
pos_act = q_filtered(:,jnt);
vel_act = sign(jnt)*q_dot_filtered(:,jnt);
acc_act = sign(jnt)*q_ddot_filtered(:,jnt);

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



save_delay = [0.07,0.07,0.07,0.06,0.06,0.06,0.03];
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
   
    %% 计算第一构型重力矩，（其余角都是0）
    if jnt == 1
        q1 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta32*gs*cos(q1) - beta41*gs*sin(q1) - beta43*gs*sin(q1) - beta45*gs*sin(q1) - beta39*gs*sin(q1) + beta33*gs*cos(q1) + beta34*gs*cos(q1) + beta35*gs*cos(q1) + beta36*gs*cos(q1) + beta44*gs*cos(q1);
        q1 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta32*gs*cos(q1) - beta41*gs*sin(q1) - beta43*gs*sin(q1) - beta45*gs*sin(q1) - beta39*gs*sin(q1) + beta33*gs*cos(q1) + beta34*gs*cos(q1) + beta35*gs*cos(q1) + beta36*gs*cos(q1) + beta44*gs*cos(q1);
    elseif jnt == 2
        q2 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta37*gc*sin(q2) + beta38*gc*sin(q2) - beta40*gc*sin(q2) - beta42*gc*sin(q2) + beta33*gc*cos(q2) + beta34*gc*cos(q2) + beta35*gc*cos(q2) + beta36*gc*cos(q2) + beta44*gc*cos(q2);
        q2 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta37*gc*sin(q2) + beta38*gc*sin(q2) - beta40*gc*sin(q2) - beta42*gc*sin(q2) + beta33*gc*cos(q2) + beta34*gc*cos(q2) + beta35*gc*cos(q2) + beta36*gc*cos(q2) + beta44*gc*cos(q2);

   elseif jnt == 3
        q3 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta34*gs*cos(q3) - beta43*gs*sin(q3) - beta45*gs*sin(q3) - beta41*gs*sin(q3) + beta35*gs*cos(q3) + beta36*gs*cos(q3) + beta44*gs*cos(q3);
        q3 = pos_select_neg2pos_acc{i};
        Gravity_neg = beta34*gs*cos(q3) - beta43*gs*sin(q3) - beta45*gs*sin(q3) - beta41*gs*sin(q3) + beta35*gs*cos(q3) + beta36*gs*cos(q3) + beta44*gs*cos(q3);
      % %% 单轴使用
      %   Gravity_pos=0;Gravity_neg=0;
    elseif jnt == 4
        q4 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta37*gc*sin(q4) + beta38*gc*sin(q4) - beta42*gc*sin(q4) + beta35*gc*cos(q4) + beta36*gc*cos(q4) + beta44*gc*cos(q4);
        q4 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta37*gc*sin(q4) + beta38*gc*sin(q4) - beta42*gc*sin(q4) + beta35*gc*cos(q4) + beta36*gc*cos(q4) + beta44*gc*cos(q4);
    elseif jnt == 5
        q5 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta36*gs*cos(q5) - beta45*gs*sin(q5) - beta43*gs*sin(q5) + beta44*gs*cos(q5);
        q5 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta36*gs*cos(q5) - beta45*gs*sin(q5) - beta43*gs*sin(q5) + beta44*gs*cos(q5);
    elseif jnt == 6
        q6 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta37*gc*sin(q6) + beta38*gc*sin(q6) + beta44*gc*cos(q6);
        q6 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta37*gc*sin(q6) + beta38*gc*sin(q6) + beta44*gc*cos(q6);
    elseif jnt == 7
        q6 = pos_select_neg2pos_acc{i};
        Gravity_pos = beta37*gc*sin(q6) + beta38*gc*sin(q6) + beta44*gc*cos(q6);
        q6 = pos_select_neg2pos_dec{i};
        Gravity_neg = beta37*gc*sin(q6) + beta38*gc*sin(q6) + beta44*gc*cos(q6);
        % %% 单轴使用
        % Gravity_pos=0;Gravity_neg=0;
    end
    Gravity_pos = Gravity_pos
    Gravity_neg = Gravity_neg

        
   %% 算惯性力（减去重力矩） 
   iner_ad{i}=(tau_select_neg2pos_acc{i}+flip(tau_select_pos2neg_dec{i}))/2 - Gravity_pos;
   iner_da{i}=(tau_select_neg2pos_dec{i}+flip(tau_select_pos2neg_acc{i}))/2 - Gravity_neg;

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
text(-3,0,num2str(f1.p1))
title(['joint ',num2str(jnt),' friction identification'])
hold on
f2=fit(acc_data(:,2),iner_data(:,2),'poly1')
plot(f2,acc_data(:,2),iner_data(:,2),'-o');
xlabel('acc(rad/s?)')
ylabel('iner(Nm)')
title(['joint ',num2str(jnt),' inertia identification'])
text(3,0,num2str(f2.p1))




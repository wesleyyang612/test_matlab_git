% data = load(filename);
% sign=[1,-1,1,1,1,1,1];
% % tau_cof=[4.2,4.2,4.2*1.462,4.2*1.462,1.6*3.6239,1.6*3.6239,1.6*3.2139];
% sample = data(:,1);
% %t = data(:,2);
% t = data(:,1)*0.01;
% offset = 2;
% q              = data(:,offset+1:offset+7);   offset = offset + 7;
% q_dot          = data(:,offset+1:offset+7);   offset = offset + 7;  
% q_dot          = deg2rad(q_dot)*sign(jnt);
% jointacttorque = data(:,offset+1:offset+7);   offset = offset + 7;
% jointacttorque(:,2)=-jointacttorque(:,2);
% jointacttorque(:,7)=-jointacttorque(:,7);
% qd             = data(:,offset+1:offset+7);   offset = offset + 7;
% qd_dot         = data(:,offset+1:offset+7);   offset = offset + 7;
% qd_ddot        = data(:,offset+1:offset+7);   offset = offset + 7;
% clear data
data = load(filename);
sign=[1,-1,1,1,1,1,-1];
% tau_cof=[4.2,4.2,4.2*1.462,4.2*1.462,1.6*3.6239,1.6*3.6239,1.6*3.2139];
sample = data(:,1);
%t = data(:,2);
t = data(:,1)*0.01;
offset = 2;
q              = data(:,offset+1:offset+7);   offset = offset + 7;
q_dot          = data(:,offset+1:offset+7);   offset = offset + 7;  
% q_dot          = deg2rad(deg2rad(q_dot))*sign(jnt);
q_dot          = deg2rad(q_dot)*sign(jnt);
jointacttorque = data(:,offset+1:offset+7);   offset = offset + 7;
jointacttorque(:,2)=-jointacttorque(:,2);
% jointacttorque(:,7)=-jointacttorque(:,7);
qd             = data(:,offset+1:offset+7);   offset = offset + 7;
qd_dot         = data(:,offset+1:offset+7);   offset = offset + 7;

qd_ddot        = data(:,offset+1:offset+7);   offset = offset + 7;
clear data
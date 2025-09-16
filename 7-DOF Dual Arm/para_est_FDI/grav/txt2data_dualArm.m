
data = load(filename);
sample = data(:,1);
%t = data(:,2);
t = data(:,1)*0.01;
offset = 2;
q              = (data(:,offset+1:offset+7));   offset = offset + 7;
q_dot          = deg2rad(data(:,offset+1:offset+7));   offset = offset + 7;  
jointacttorque = data(:,offset+1:offset+7);   offset = offset + 7;
jointacttorque(:,2)=-jointacttorque(:,2);
jointacttorque(:,7)=-jointacttorque(:,7);
qd             = data(:,offset+1:offset+7);   offset = offset + 7;
qd_dot         = data(:,offset+1:offset+7);   offset = offset + 7;
qd_ddot        = data(:,offset+1:offset+7);   offset = offset + 7;

clear data

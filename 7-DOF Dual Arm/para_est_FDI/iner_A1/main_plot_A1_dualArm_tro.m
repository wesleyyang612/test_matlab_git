clear;clc;close all
load betaM_diag_inertia_J1.mat
load betaM_diag_inertia_J2.mat
load betaM_diag_inertia_J3.mat
load betaM_diag_inertia_J4.mat
load betaM_diag_inertia_J5.mat
load betaM_diag_inertia_J6.mat
load betaM_diag_inertia_J7.mat


acc_data_A1{1} = acc_data_J1;
acc_data_A1{2} = acc_data_J2;
acc_data_A1{3} = acc_data_J3;
acc_data_A1{4} = acc_data_J4;
acc_data_A1{5} = acc_data_J5;
acc_data_A1{6} = acc_data_J6;
acc_data_A1{7} = acc_data_J7;
iner_data_A1{1} = iner_data_J1;
iner_data_A1{2} = iner_data_J2;
iner_data_A1{3} = iner_data_J3;
iner_data_A1{4} = iner_data_J4;
iner_data_A1{5} = iner_data_J5;
iner_data_A1{6} = iner_data_J6;
iner_data_A1{7} = iner_data_J7;



%%  A1
fig1 = figure(1)
fig1.Position = [300, 200, 500, 300];
for i = 1:7
    subplot(2,4,i)      
    f1=fit(acc_data_A1{i}(:,1),iner_data_A1{i}(:,1),'poly1')
    plot(f1,acc_data_A1{i}(:,1),iner_data_A1{i}(:,1),'-o');
    hold on
    legend off
    f2=fit(acc_data_A1{i}(:,2),iner_data_A1{i}(:,2),'poly1')
    plot(f2,acc_data_A1{i}(:,2),iner_data_A1{i}(:,2),'-o');
    xlabel(['$\ddot{q}_',num2str(i),'(rad/s^2)$'],'Interpreter','latex')
    ylabel(['$\tau_{m',num2str(i),'}(Nm)$'],'Interpreter','latex')
    if i == 7
        legend('raw data','fitted','location','best')
        ylim([-1,1])
    else
        legend off
    end
    axis tight
    grid on
    x = acc_data_A1{i}(end,1)/2.1;
    y = iner_data_A1{i}(end,1)/2.7;
    str1 = sprintf('%.2f', f1.p1);
    text(x,y,str1);
    x = acc_data_A1{i}(end,2)/2;
    y = iner_data_A1{i}(end,2)/1.4;
    str2 = sprintf('%.2f', f2.p1);
    text(x,y,str2);
    if i == 7
        ylim([-0.5,0.5])
        grid on
    end
end




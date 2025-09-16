clear;clc;close all;

%% save to .mat file
%ylim_data = {[-8,8],[-14,14]};
figure
for jnt = 2:6
    subplot(2,3,jnt-1)
    load(['jnt',num2str(jnt),'B.mat'])
    t = (1:length(U))*0.001;
    plot(t,U,t,Phi*betaM_offdiag)
    legend('isolated','fitted','location','best')
    xlabel('$t(s)$','interpreter','latex')
    ylabel(['$\tau_{n',num2str(jnt),'}(Nm)$'],'interpreter','latex')
    grid minor
    %ylim(ylim_data{jnt-1})
end

close all
clc

figure
plot(time,xc(:,1),time,xc(:,2),'LineWidth',2)
xlabel('Time(sec)')
ylabel('x_c (mm)')
grid on

figure
plot(time,xc(:,1),time,alpha,'LineWidth',2)
xlabel('Time(sec)')
ylabel('\theta_1 (deg)')
grid on

figure
plot(time,xc(:,1),time,theta,'LineWidth',2)
xlabel('Time(sec)')
ylabel('\theta_2 (deg)')
grid on
% 
% figure
% plot(time,xc(:,1),time,x_dot,'LineWidth',2)
% xlabel('Time(sec)')
% ylabel('dx_c (mm)')
% grid on
% 
% figure
% plot(time,xc(:,1),time,alpha_dot,'LineWidth',2)
% xlabel('Time(sec)')
% ylabel('d\theta_1 (deg)')
% grid on
% 
% figure
% plot(time,xc(:,1),time,theta_dot,'LineWidth',2)
% xlabel('Time(sec)')
% ylabel('d\theta_2 (deg)')
% grid on
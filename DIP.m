% % Single Pendulum switch
% type = "single"; 

% % Double Pendulum switch
type= "double";

params_calc;
    
d = [m0+m1+m2;
    (0.5*m1+m2)*L1;
    0.5*m2*L2;
    (m2+m1/3)*L1*L1;
    0.5*m2*L1*L2;
    m2*L2*L2/3;
    (0.5*m1+m2)*g*L1;
    0.5*m2*g*L2];

d1 = m0+m1+m2;
d2 = (0.5*m1+m2)*L1;
d3 = 0.5*m2*L2;
d4 = (m2+m1/3)*L1*L1;
d5 = 0.5*m2*L1*L2;
d6 = m2*L2*L2/3;
f1 = (0.5*m1+m2)*g*L1;
f2 = 0.5*m2*g*L2;

% phi =[1.2432;0.0601;0.0489;0.0012;0.0071;0.0039;0.3216;0.2910];
% d1=phi(1);d2=phi(2);d3=phi(3);d4=phi(4);d5=phi(5);d6=phi(6);f1=phi(7);f2=phi(8);
Euu=f1+f2;

theta1 = 0; theta2 = 0;
D0=[d1, d2*cos(theta1), d3*cos(theta2);
   d2*cos(theta1), d4, d5*cos(theta1-theta2);
   d3*cos(theta2), d5*cos(theta1-theta2), d6];
dG=[0,0,0;0,-f1,0;0,0,-f2];

% Define the State Space System
A=[zeros(3),eye(3);-inv(D0)*dG,zeros(3)];
B=[zeros(3,1);inv(D0)*[1;0;0]];
C=eye(6); 
D = zeros(6,1);
% sys=ss(A,B,C,D);
% Compute the feedback k
% K=lqr(sys,Q,R);
% K(3)=-K(3); K(6)=-K(6);
% K
% nx = 6;    %Number of states
% ny = 1;    %Number of outputs
% Qn = [4 2 4 2 0 0 0;
%       0 4 2 4 2 0 0;
%       0 0 4 2 4 2 0;
%       0 0 0 4 2 4 2;
%       0 0 0 0 2 1 2;
%       0 0 0 0 0 1 0
%       0 0 0 0 0 0 1];
% Rn = diag([0.7 0.7 0.7 0.7 0.7]);
% R = 1;
% QXU = blkdiag(0.1*eye(nx),R);
% QWV = blkdiag(Qn,Rn);
% QI = eye(ny);
% KLQG = lqg(sys,QXU,QWV);

Ai = A; Ai( 7,7 ) = 0; Ai( 7,1 ) = 1;
Bi=B; Bi( 7,1 ) = 0;
Ci = eye(7,7);
Di = zeros(7,1);
if(type == "single")
    Q = diag([50 500 500 0.1 0.1 0.1 0.5]);
else
    Q = 6.2*diag([50 500 500 0.1 0.1 0.1 0.5]);
end
R=1;
[ K, S, E ] = lqr( Ai, Bi, Q, R );

if(type == "single")
    Ks=1;
    % K(3)=-K(3); K(6)=-K(6); K(5)=-K(5); K(7)=0;
    K(1)=-K(1); K(4)=-K(4); K(2)=-K(2); 
else
    % K(5)=10*K(5);
    Ks=-1;
end

K

alpha0=deg2rad(5);
theta0=deg2rad(0);

m0=0.57+0.37;
m1=0.072;
m2=0.127;
L1=0.2096;
l1=L1/2;
L2=0.3365;
l2=L1/2;
g=9.81;

Kv=62.5; Kp=47.2; Kd=27.3;
% from radians to degrees
K_R2D = 180 / pi;
% from degrees to radians
K_D2R = 1 / K_R2D;
% from Inch to Meter
K_IN2M = 0.0254;
% from Meter to Inch
K_M2IN = 1 / K_IN2M;
% from rad/s to RPM
K_RDPS2RPM = 60 / ( 2 * pi );
% from RPM to rad/s
K_RPM2RDPS = 1 / K_RDPS2RPM;
% from oz-force to N
K_OZ2N = 0.2780139;
% from N to oz-force
K_N2OZ = 1 / K_OZ2N;
Rm = 2.6;
% Motor Armature Inductance (H)
Lm = 180e-6;
% Motor Torque Constant (N.m/A)
Kt = 1.088 * K_OZ2N * K_IN2M; 
% Motor ElectroMechanical Efficiency [ = Tm * w / ( Vm * Im ) ]
eta_m = 1;
% Motor Back-EMF Constant (V.s/rad)
Km = 0.804e-3 * K_RDPS2RPM; % = .00767
% Rotor Inertia (kg.m^2)
Jm = 5.523e-5 * K_OZ2N * K_IN2M; % = 3.9e-7
Mc2 = 0.57;
Mw = 0.37;
Mc = m0; Mp = m1 + m2;
Lp = L1 + L2;
lp = Lp/2;
Jp = Mp * Lp^2 / 12;
% Planetary Gearbox Gear Ratio
Kg = 3.71;
% Planetary Gearbox Efficiency
eta_g = 1;
% Cart Motor Pinion number of teeth
N_mp = 24;
% Motor Pinion Radius (m)
r_mp = 0.5 / 2 * K_IN2M; 
% Cart Position Pinion number of teeth
N_pp = 56;
% Position Pinion Radius (m)
r_pp = 1.167 /2 * K_IN2M; 
% Rack Pitch (m/teeth)
Pr = 1e-2 / 6.01; 
% Cart Encoder Resolution (m/count)
K_EC = Pr * N_pp / ( 4 * 1024 ); 
% Pendulum Encoder Resolution (rad/count)
K_EP = 2 * pi / ( 4 * 1024 ); 

VMAX_DAC = 6;
VMAX_AMP = 6;

wcf = 2 * pi * 10.0;    % filter cutting frequency
zetaf = 0.9;            % filter damping ratio
wcf_1 = 2 * pi * 50;    % filter cutting frequency for cart velocity (encoder channel #0)
zetaf_1 = 0.9;          % filter damping ratio for cart velocity
wcf_2 = 2 * pi * 10;    % filter cutting frequency for velocity of encoder channels #1,2 
zetaf_2 = 0.9;          % filter damping ratio - encoder channels #1,2
% Lumped Mass of the Cart System (accounting for the rotor inertia)
Jeq = Mc + eta_g * Kg^2 * Jm / r_mp^2;
% Reference Energy (J)
Er = 2*Mp*lp*9.81;
% Maximum force for 5 V
Fc_max = (eta_m*eta_g*Kg*Kt*5)/(Rm*r_mp);
% Maximum acceleration of pivot (m/s^2)
a_max = (Fc_max / Jeq);
epsilon=deg2rad(20);
Euu = Er;
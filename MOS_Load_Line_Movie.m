VGS = linspace(0.7,2.6); % VGS ranges from 0.7V to 2.6V, 100 data points.

VDS = 0:0.01:3.3; % VDS ranges from 0 to 3.3V in 0.01V steps; 331 points.
VDS0 = 2; % Initial guess for VDS used by "fsolve" in finding Q-point.

% MOSFET parameter values (need for sat/triode boundary plot). 
mu_n = 0.05; % Electron mobility.
Cox = 3.5e-3; % MOSFET gate oxide capacitance.
W = 4e-6; % MOSFET gate width.
L = 0.6e-6; % MOSFET gate length.

Sat = 1e3/2*mu_n*Cox*W/L*VDS.^2; % NMOS saturation/triode region boundary.

ID = zeros(1,331); % Pre-allocate ID for speed, otherwise it's re-sized 
%                    on each iteration of loops below (slow).
IDload = zeros(1,331); % Pre-allocate IDload for speed.
options = optimset('Algorithm','levenberg-marquardt','Display','off');
VDD = 3.3; % Positive rail is 3.3V.
RD = 3.3e3; % Load resistor is 3.3k ohms.

% Generate load line (same for all frames):
for n = 1:331 % Sweep Drain-Source voltage.
    IDload(n) = (-VDS(n)/RD + VDD/RD)*1e3; % Load line (mA).
end
% This loop generates 100 movie frames, one for each VGS value.
for k = 1:100 % Step Gate-Source voltage.

% Generate I-V characteristics:
for n = 1:331 % Sweep Drain-Source voltage.
    ID(n) = MOS_IV(VGS(k),VDS(n))*1e3; % I-V characteristics (mA).
end

% Calculate Q-point values:
VDSQ = fsolve(@(VDS)MOS_IV(VGS(k),VDS)*1e6-(-VDS/RD + VDD/RD)*1e6, ...
                VDS0,options);% uA scale for fsolve tolerance.
IDQ = MOS_IV(VGS(k),VDSQ)*1e3;     

if k >= 2
VDSQm1 = fsolve(@(VDS)MOS_IV(VGS(k-1),VDS)*1e6-(-VDS/RD + VDD/RD)*1e6, ...
                VDS0,options);% uA scale for fsolve tolerance.
end
% Plot I-V characteristics, Q-point and load line:
plot(VDS, ID, 'r', VDSQ, IDQ, 'ko', VDS, IDload, 'b', ...
     VDS, Sat,'k:');
h = gcf; % Get current figure handle.
axis([0 3.3 0 1]);
xlabel(['{V}_{DS} (V)  [{V}_{DSQ} = ', num2str(VDSQ),' (V)]']); 
ylabel(['{I}_{D} (mA)  [{I}_{DQ} = ', num2str(IDQ), ' (mA)]']);
title(['I-V Characeristics & Load Line:  {V}_{GS} = ', num2str(VGS(k)),' (V)']);

if k >= 2
text(2,0.9,'\Delta {V}_{DS}/\Delta {V}_{GS} = ')
text(2.75,0.905,num2str((VDSQ-VDSQm1)/(VGS(k)-VGS(k-1))))
end

M(k) = getframe(h);
end

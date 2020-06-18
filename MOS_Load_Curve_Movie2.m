VGS = linspace(0.7,2.6); % VGS ranges from 0.7V to 2.6V, 100 data points.

VDS = 0:0.01:3.3; % VDS ranges from 0 to 3.3V in 0.01V steps; 331 points.
Vin = 0:0.01:3.3; % Used to generate voltage transfer characteristics.
VDS0 = 2; % Initial guess for VDS used by "fsolve" in finding v.t.c.

% MOSFET parameter values (need for sat/triode boundary plot). 
mu_n = 0.05; % Electron mobility.
Cox = 3.5e-3; % MOSFET gate oxide capacitance.
W = 4e-6; % MOSFET gate width.
L = 0.6e-6; % MOSFET gate length.

Sat = 1e3/2*mu_n*Cox*W/L*VDS.^2; % NMOS saturation/triode region boundary.

ID = zeros(1,331); % Pre-allocate ID for speed, otherwise it's re-sized 
%                    on each iteration of loops below (slow).
IDload = zeros(1,331); % Pre-allocate IDload for speed.
options = optimset('Display','off');
%options = optimset('Algorithm','levenberg-marquardt','Display','off');
Vout = zeros(1,331); % Pre-allocate Vout for speed.

% Generate  voltage transfer characteristics (same for all frames):
for n = 1:331  % Sweep Drain-Source voltage.
    Vout(n) = fsolve(@(VDS)MOS_IV(Vin(n),VDS)*1e6 - ... 
                     MOS_IV(3.3-Vin(n),3.3-VDS)*1e6,VDS0,options); % v.t.c.
                 % uA scale for fsolve tolerance.
end

% This loop generates 100 movie frames, one for each VGS value.
for k = 1:100 % Step Gate-Source voltage.

% Generate I-V characteristics and load curve (mA scale):
for n = 1:331 % Sweep Drain-Source voltage.
    ID(n) = MOS_IV(VGS(k),VDS(n))*1e3; % I-V characteristics.
    IDload(n) = MOS_IV(3.3-VGS(k),3.3-VDS(n))*1e3; % Load curve.
end

% Calculate Q-point values:
VDSQ = fsolve(@(VDS)MOS_IV(VGS(k),VDS)*1e6 - ... 
               MOS_IV(3.3-VGS(k),3.3-VDS)*1e6,VDS0,options);
IDQ = MOS_IV(VGS(k),VDSQ)*1e3;     

if k >= 2
VDSQm1 = fsolve(@(VDS)MOS_IV(VGS(k-1),VDS)*1e6 - ... 
               MOS_IV(3.3-VGS(k-1),3.3-VDS)*1e6,VDS0,options);% uA scale for fsolve tolerance.
end

% Plot I-V characteristics, Q-point and load curve:
subplot(2,1,1);
plot(VDS, ID, 'r', VDSQ, IDQ, 'ko', VDS, IDload, 'b', ...
     VDS, Sat,'r:', 3.3-VDS, Sat, 'b:');
h = gcf; % Get current figure handle.
axis([0 3.3 0 1]);
xlabel(['V_{DS} (V)  [V_{DSQ} = ', num2str(VDSQ),' (V)]']); 
ylabel(['I_{D} (mA)  [I_{DQ} = ', num2str(IDQ), ' (mA)]']);
title(['I-V Characeristics & Load Curve:  V_{GS} = ', num2str(VGS(k)),' (V)']);

if k >= 2
text(2,0.9,'\Delta {V}_{DS}/\Delta {V}_{GS} = ')
text(2.75,0.905,num2str((VDSQ-VDSQm1)/(VGS(k)-VGS(k-1))))
end

% Plot voltage transfer characheristics:
subplot(2,1,2);
plot(Vin, Vout, 'g', VGS(k), VDSQ, 'ko');
axis([0 3.3 0 3.3]);
xlabel(['{V}_{in} (V)  [V_{in Q} = ', num2str(VGS(k)),' (V)]']); 
ylabel(['{V}_{out} (V)  [V_{out Q} = ', num2str(VDSQ),' (V)]']); 
title('Voltage Transfer Characteristics');

M(k) = getframe(h);
end

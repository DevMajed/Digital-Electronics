function ID = MOS_IV(VGS,VDS)
%MOS_IV: compute MOSFET drain current given drain and gate voltage.
%   Uses SPICE Level 1 model.

% Set MOSFET parameter values
Vtn = 0.7; % NMOS threshold voltage.
mu_n = 0.05; % Electron mobility.
Cox = 3.5e-3; % MOSFET gate oxide capacitance.
W = 4e-6; % MOSFET gate width.
L = 0.6e-6; % MOSFET gate length.
lambda = 0.07; % Channel length modulation parameter.

% Drain current computation code follows:
if VGS < Vtn
    ID = 0; % MOSFET is off.
elseif VDS < VGS - Vtn
    ID = mu_n*W/L*Cox*((VGS-Vtn)*VDS-VDS^2/2); % Triode region.
else 
    ID = mu_n*Cox/2*W/L*(VGS-Vtn)^2*(1+lambda*(VDS-VGS+Vtn)); % Active region.
    
    format short eng;
    
end


data = [1 0 0 0 1 0 1 1 1 0 1 0]; 
% Digital message signal  
fs = 50; 
% Sampling rate - This will define the resoultion   
t = 0: 1/fs : 1; 
% Time for one bit   
carrier_amplitude = 5;
carrier_freq = 2;  
phase_0 = 0; 
% Phase of carrier for 0 
phase_1 = pi/2; 
% Phase of carrier for 1   
carrier_0 = carrier_amplitude * sin(2*pi*carrier_freq*t + phase_0); 
% Carrier for 0 
carrier_1 = carrier_amplitude * sin(2*pi*carrier_freq*t + phase_1); 
% Carrier for 1     
time = [];
% This time variable is just for plot 
digital_signal = []; psk_modulated = [];   
for i= 1:1:numel(data)      
    % The PSK Signal   
    psk_modulated = [psk_modulated (data(i)==0)*carrier_0+(data(i)==1)*carrier_1]; 
     % The Original Digital Signal     
     digital_signal = [digital_signal (data(i)==0)*zeros(1,length(t)) + (data(i)==1)*ones(1,length(t))];        
     time = [time t];    
     t =  t + 1;     
end
% Plot the Original Digital Signal   
subplot(2,1,1); 
plot(time,digital_signal,'r','LineWidth',2); 
xlabel('Time (bit period)');
ylabel('Amplitude'); 
title('Original Digital Signal'); 
axis([0 time(end) -0.5 1.5]); grid on;  
% Plot the PSK modulated Signal 
subplot(2,1,2);
plot(time,psk_modulated,'LineWidth',2);
xlabel('Time (bit period)');
ylabel('Amplitude');
title('PSK Signal with two Phase angles'); 
axis([0 time(end) -carrier_amplitude carrier_amplitude]);
grid  on;
 
 
data = [1 0 1 0 1 0 0 0 1 0 1 1 0 1 0 1 0 1 0 1 ];
% Digital message signal 
fs = 50;
% Sampling rate - This will define the resoultion  
t = 0: 1/fs : 1;
% Time for one bit  
carrier_freq = 1;  
carrier_amplitude_1 = 4; 
% Carrier amplitude for 00 and 01 
carrier_amplitude_2 = 12; 
% Carrier amplitude for 10 and 11 
carrier_phase_1 = 0; 
% Carrier phase for 00 and 10 
carrier_phase_2 = pi/2; 
% Carrier phase for 01 and 11   
carrier_1 = carrier_amplitude_1 * sin(2*pi*carrier_freq*t + carrier_phase_1);
% Carrier for 00 
carrier_2 = carrier_amplitude_1 * sin(2*pi*carrier_freq*t + carrier_phase_2);
% Carrier for 01 
carrier_3 = carrier_amplitude_2 * sin(2*pi*carrier_freq*t + carrier_phase_1); 
% Carrier for 10
carrier_4 = carrier_amplitude_2 * sin(2*pi*carrier_freq*t + carrier_phase_2); 
% Carrier for 11 
 time = []; 
 % This time variable is just for plot 
 digital_signal = []; 
 qam_modulated = [];  
 for i= 1:2:numel(data)          
     % The QAM Signal    
     if(data(i) == 0 && data(i+1) == 0)       
         qam_modulated = [qam_modulated carrier_1 carrier_1];     
     elseif(data(i) == 0 && data(i+1) == 1)        
         qam_modulated = [qam_modulated carrier_2 carrier_2];   
     elseif(data(i) == 1 && data(i+1) == 0)       
         qam_modulated = [qam_modulated carrier_3 carrier_3];    
     elseif(data(i) == 1 && data(i+1) == 1)       
         qam_modulated = [qam_modulated carrier_4 carrier_4];     
     end
 end
   for i= 1:1:numel(data)         
       % The Original Digital Signal   
       digital_signal = [digital_signal (data(i)==0)*zeros(1,length(t)) + (data(i)==1)*ones(1,length(t))];       
       time = [time t];     t =  t + 1;   end 
   % Plot the Original Digital Signal   
   subplot(2,1,1); 
   plot(time,digital_signal,'r','LineWidth',2);
   xlabel('Time (bit period)');
   ylabel('Amplitude');
   title('Original Digital Signal');
   axis([0 time(end) -0.5 1.5]); grid on;  
   % Plot the QAM modulated Signal 
 subplot(2,1,2); 
 plot(time,qam_modulated,'LineWidth',2);
 xlabel('Time (bit period)');
 ylabel('Amplitude'); 
 title('QAM Signal with two amplitudes and two phase angles '); 
 axis([0 time(end) -carrier_amplitude_2 carrier_amplitude_2]);
 grid  on; 
 
 
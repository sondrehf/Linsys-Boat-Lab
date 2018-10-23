%Constants
A_1 = 29.3582;
A_2 = 0.8826;
w_1 = 0.005;
w_2 = 0.05;
T = sqrt((A_2^2*w_2^2 - A_1^2*w_1^2)/(A_1^2*w_1^4 - A_2^2*w_2^4)); 
K = A_1*w_1*sqrt(1+T^2*w_1^2);

%model of the system
s = tf('s');
G = K/(s*(1+T*s))*1/s;

%plot of responses
plot(compass.time, compass.signals.values,'r');
hold on;
plot(model.time, model.signals.values,'b');
legend('Ship response','Model response');
xlabel('Time[sec]');
ylabel('Compass angle[deg]');
title('Ship response vs Model response');
grid on;
hold off;
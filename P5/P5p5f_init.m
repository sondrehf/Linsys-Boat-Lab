%% GET REQUIRED MATRICES
run P5p5c_init.m

%% VARYING Q_k
Q_k = [30 0; 0 10^(-6)] * 0.001;
%Push into workspace
assignin('base', 'Q_k', Q_k);
%Vary the struct
data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
%Push into workspace
assignin('base', 'data', data);
%% RUNNING SIMULINK MODEL
filename = 'P5p5d';

if (filename == 'P5p5d')
    sim('P5p5d.slx', 5000);
    run P5p5d_init
else 
    sim('P5p5e.slx', 5000);
    run P5p5e_init
end
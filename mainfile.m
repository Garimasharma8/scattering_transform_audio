clear all
close all
clc
%t = 0:1/1e3:2;
%y = chirp(t,100,1,200,'quadratic');

load handel;    % loads the signal into y
%y=ah;
N = length(y);
T = 2^12; %original =2^12
%Fs=fs;
filt_opt = default_filter_options('audio', T);
Wop = wavelet_factory_1d(N, filt_opt);
S = scat(y, Wop);
[Wop,filters] = wavelet_factory_1d(N, filt_opt);
figure;
for m = 1:2
    subplot(1,2,m);
    hold on; 
    for k = 1:length(filters{m}.psi.filter)
        plot(realize_filter(filters{m}.psi.filter{k}, N)); 
    end
    hold off;
    ylim([0 1.5]);
    xlim([1 5*N/8]);
end
filt_opt.Q = [8 8];
filt_opt.J = T_to_J(T, filt_opt);
S{1+m}.signal{k};
j1 = 23;


%%
%figure;
%scattergram(S{2},[],S{3},j1);
figure;
%title('Scattergram of first and second-order coefficients');
subplot(2,1,1);
img{1} = scattergram_layer(S{1+1},[]);
j1 = 23;
img{2} = scattergram_layer(S{1+2},j1);
time = (1:size(img{1},2))/size(img{1},2) * N/Fs;
imagesc(time,1:size(img{1},1),img{1});
title('Scattergram of first and second-order coefficients');
xlabel('Time (s)');
ylabel('Scale number j1');
colorbar;
subplot(2,1,2);
imagesc(time,1:size(img{2},1),img{2});
xlabel('Time (s)');
ylabel('Scale number j2');
colorbar;

%%
S = renorm_scat(S);
S = log_scat(S);
%figure; 
%scattergram(S{2},[],S{3},j1);
[S_table, meta] = format_scat(S);
logrenorm_S = log_scat(renorm_scat(S));
img_logrenorm{1} = scattergram_layer(logrenorm_S{1+1},[]);
j1 = 23; % arbitrary choice
img_logrenorm{2} = scattergram_layer(logrenorm_S{1+2},j1);
time = (1:size(img_logrenorm{1},2))/size(img_logrenorm{1},2) * N/Fs;
figure;
subplot(2,1,1);
imagesc(time,1:size(img_logrenorm{1},1),img_logrenorm{1});
title('Scattergram of log renormalized coefficients');
xlabel('Time (s)');
ylabel('Scale number j1');
colorbar;
subplot(2,1,2);
imagesc(time,1:size(img_logrenorm{2},1),img_logrenorm{2});
xlabel('Time (s)');
ylabel('Scale number j2');
colorbar;
clear all
close all
clc
%%
addpath(genpath('/Users/garimasharma/Downloads/data-to-share-covid-19-sounds/ComParE2021-CCS-CSS-Data/CSS/wav/positive'));
for i=1:507
fname=strcat('P',num2str(i));
audioname=strcat(fname,'.wav');
[x{i},fs{i}]=audioread(audioname);
x{i}=x{i}(:,1);
N{i}=length(x{i});
T=2^16; % (original %2^14 for or 16000 samples for 1 sec )
filt_opt{i} = default_filter_options('audio', T);
Wop{i} = wavelet_factory_1d(N{i}, filt_opt{i});
S{i}=scat(x{i},Wop{i});
[Wop{i},filters{i}]=wavelet_factory_1d(N{i},filt_opt{i});
[S_table1{i}, meta{i}] = format_scat(S{i}); %scattering coefficients for covid cough

end

%%
filt_opt{i}.Q = [8 8];
filt_opt{i}.J = T_to_J(T, filt_opt{i});
%S{1+m}.signal{k};
j1 = 23;

%% for Healthy cough

addpath(genpath('/Users/garimasharma/Downloads/data-to-share-covid-19-sounds/ComParE2021-CCS-CSS-Data/CSS/wav/negative'));
for l=1:126
fname=strcat('N',num2str(l));
audioname=strcat(fname,'.wav');
[y{l},fsy{l}]=audioread(audioname);
y{l}=y{l}(:,1);
Ny{l}=length(y{l});
T=2^16;
filt_opty{l} = default_filter_options('audio', T);
Wopy{l} = wavelet_factory_1d(Ny{l}, filt_opty{l});
Sy{l}=scat(y{l},Wopy{l});
[Wopy{l},filtersy{l}]=wavelet_factory_1d(Ny{l},filt_opty{l});
[S_table2{l}, metay{l}] = format_scat(Sy{l}); %scattering coefficients for non-covid cough
end

%% asthama cough
addpath(genpath('/Users/garimasharma/Downloads/data-to-share-covid-19-sounds/KDD_paper_data/asthmaandroidwithcough/cough'));
for m=1:90
fname=strcat('AC',num2str(m));
audioname=strcat(fname,'.wav');
[y3{m},fs3{m}]=audioread(audioname);
y3{m}=y3{m}(:,1);
N3{m}=length(y3{m});
T=2^16;
filt_opt3{m} = default_filter_options('audio', T);
Wop3{m} = wavelet_factory_1d(N3{m}, filt_opt3{m});
S3{m}=scat(y3{m},Wop3{m});
[Wop3{m},filters3{m}]=wavelet_factory_1d(N3{m},filt_opt3{m});
[S_table3{m}, meta3{m}] = format_scat(S3{m}); %scattering coefficients for non-covid cough
end

%% for covid android no cough

addpath(genpath('/Users/garimasharma/Downloads/data-to-share-covid-19-sounds/KDD_paper_data/covidandroidnocough/cough'));
for n=1:51
fname=strcat('CNC',num2str(n));
audioname=strcat(fname,'.wav');
[y4{n},fs4{n}]=audioread(audioname);
y4{n}=y4{n}(:,1);
N4{n}=length(y4{n});
T=2^16;
filt_opt4{n} = default_filter_options('audio', T);
Wop4{n} = wavelet_factory_1d(N4{n}, filt_opt4{n});
S4{n}=scat(y4{n},Wop4{n});
[Wop4{n},filters4{n}]=wavelet_factory_1d(N4{n},filt_opt4{n});
[S_table4{n}, meta4{n}] = format_scat(S4{n}); %scattering coefficients for non-covid cough
end

%% for healthy no cough
addpath(genpath('/Users/garimasharma/Downloads/data-to-share-covid-19-sounds/KDD_paper_data/healthyandroidnosymp/cough'));
for p=1:118
fname=strcat('HNC',num2str(p));
audioname=strcat(fname,'.wav');
[y5{p},fs5{p}]=audioread(audioname);
y5{p}=y5{p}(:,1);
N5{p}=length(y5{p});
T=2^16;
filt_opt5{p} = default_filter_options('audio', T);
Wop5{p} = wavelet_factory_1d(N5{p}, filt_opt5{p});
S5{p}=scat(y5{p},Wop5{p});
[Wop5{p},filters5{p}]=wavelet_factory_1d(N5{p},filt_opt5{p});
[S_table5{p}, meta5{p}] = format_scat(S5{p}); %scattering coefficients for non-covid cough
end

%% Classification using learner application

data1=cell2mat(S_table);
data2=cell2mat(S_tabley);
group=zeros(708,1); group(355:708,1)=1;
Table1=table([data1(:,1:1648);data2],group);

group2= zeros(3497,1); group2(1850:3497,1)=1;
Table2=table(data,group2);

%% visulization of features

% LBP histogram error 1. Covid vs non-covid 2. Covid v/s covid
error1=(S_table{1}-S_tabley{1}(:,1:21)).^2;
error2=(S_table{1}-S_table{2}).^2;
bar([error1;error2],'grouped')

%% 5 class cough classificaton

S11=cell2mat(S_table1)';
S12=cell2mat(S_table2)';
S13=cell2mat(S_table3)';
S14=cell2mat(S_table4)';
S15=cell2mat(S_table5)';

data1=[S11;S12;S13;S14;S15];
group=zeros(924,1); group(140:275)=1; group(276:466,1)=2; group(467:658,1)=3;
group(659:924,1)=4;
T11=table(data1,group);

% tsne visulaization
D11=[group,data1];
Y = tsne(D11,'Algorithm','barneshut','NumPCAComponents',10,'perplexity',50);
figure
gscatter(Y(:,1),Y(:,2),group)

rng default % for fair comparison
Y3 = tsne(D11,'Algorithm','barneshut','NumPCAComponents',10,'NumDimensions',3);
figure
scatter3(Y3(:,1),Y3(:,2),Y3(:,3),15,group,'filled');
view(-93,14)

%% 3 class cough

data2=[S11;S12;S13];
group2=zeros(466,1);group2(140:275)=1;group2(276:466,1)=2;
T12=table(data2,group2);

D12=[group2,data2];
Y = tsne(D12,'Algorithm','barneshut','NumPCAComponents',10,'perplexity',50);
figure
gscatter(Y(:,1),Y(:,2),group2)

rng default % for fair comparison
Y3 = tsne(D12,'Algorithm','barneshut','NumPCAComponents',10,'NumDimensions',3);
figure
scatter3(Y3(:,1),Y3(:,2),Y3(:,3),15,group2,'filled');
view(-93,14)

%% scattergram of white noise 

L=100000; %Sample length for the random signal
mu=0;
sigma=1;
noise=sigma*randn(L,1)+mu;

N=L;
% Set up default filter bank with averaging scale of 4096 samples.
T = 2^14;
filt_opt = default_filter_options('audio', T);
[Wop, filters] = wavelet_factory_1d(L, filt_opt);
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

S = scat(noise, Wop);
Fs=16000;
img{1} = scattergram_layer(S{1+1},[]);
j1 = 23;
img{2} = scattergram_layer(S{1+2},j1);
time = (1:size(img{1},2))/size(img{1},2) * N/Fs;

figure;
%title('Scattergram of first and second-order coefficients');
subplot(2,1,1);
imagesc(time,1:size(img{1},1),img{1});
title('Scattergram of first and second-order coefficients');
xlabel('Time (s)');
ylabel('Scale number \lambda 1');
colorbar;
subplot(2,1,2);
imagesc(time,1:size(img{2},1),img{2});
xlabel('Time (s)');
ylabel('Scale number \lambda 2');
colorbar;

logrenorm_S = log_scat(renorm_scat(S));

% Display the transformed coefficients.
img_logrenorm{1} = scattergram_layer(logrenorm_S{1+1},[]);
j1 = 23; % arbitrary choice
img_logrenorm{2} = scattergram_layer(logrenorm_S{1+2},j1);
time = (1:size(img_logrenorm{1},2))/size(img_logrenorm{1},2) * N/Fs;

figure;
subplot(2,1,1);
imagesc(time,1:size(img_logrenorm{1},1),img_logrenorm{1});
title('Scattergram of log renormalized coefficients');
xlabel('Time (s)');
ylabel('Scale number \lambda 1');
colorbar;
subplot(2,1,2);
imagesc(time,1:size(img_logrenorm{2},1),img_logrenorm{2});
xlabel('Time (s)');
ylabel('Scale number \lambda 2');
colorbar;
%colormap(1-colormap(gray));

figure;
spectrogram(noise,128,120,128,'yaxis');

%% Scattering of single tone signal
f=10;
t=0:0.01:10;
signal= 2*sin(2*pi*f*t);
L=length(signal);
N=L;
T = 2^14;
filt_opt = default_filter_options('audio', T);
[Wop, filters] = wavelet_factory_1d(L, filt_opt);
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

S = scat(signal, Wop);
Fs=1600;
img{1} = scattergram_layer(S{1+1},[]);
j1 = 23;
img{2} = scattergram_layer(S{1+2},j1);
time = (1:size(img{1},2))/size(img{1},2) * N/Fs;

figure;
%title('Scattergram of first and second-order coefficients');
subplot(2,1,1);
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

%% toy signal

t = (-1:0.01:100)';

impulse = t==0;
unitstep = t>=0;
ramp = t.*unitstep;
quad = t.^2.*unitstep;

N=length(impulse); T=2^14; % for chirp signal use T=2^12;
filt_opt = default_filter_options('dyadic', T);
Wop= wavelet_factory_1d(N, filt_opt);
S=scat(impulse,Wop);
[Wop,filters]=wavelet_factory_1d(N,filt_opt);
[S_table1, meta] = format_scat(S);

Fs=8000;
img{1} = scattergram_layer(S{1+1},[]);
j1 = 23;
img{2} = scattergram_layer(S{1+2},j1);
time = (1:size(img{1},2))/size(img{1},2) * N/Fs;

figure;
%title('Scattergram of first and second-order coefficients');
subplot(2,1,1);
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
%% test on chirp signal
fs = 44100;
t = 0:1/fs:5;
x = chirp(t, 1000, 5, 10000);
N=length(x); T=2^12;
filt_opt = default_filter_options('dyadic', T);
Wop= wavelet_factory_1d(N, filt_opt);
S=scat(x',Wop);
[Wop,filters]=wavelet_factory_1d(N,filt_opt);
[S_table1, meta] = format_scat(S);

Fs=8000;
img{1} = scattergram_layer(S{1+1},[]);
j1 = 23;
img{2} = scattergram_layer(S{1+2},j1);
time = (1:size(img{1},2))/size(img{1},2) * N/Fs;

figure;
%title('Scattergram of first and second-order coefficients');
subplot(2,1,1);
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

figure;
spectrogram(x',128,120,128,'yaxis');


%% Scattering on SLI dataset 

addpath(genpath('/Users/garimasharma/Downloads/Lanna_speech_database_children/All healthy files/'));
for m=1:1656
fname=strcat('H',num2str(m));
audioname=strcat(fname,'.wav');
[y3{m},fs3{m}]=audioread(audioname);
y3{m}=y3{m}(:,1);
N3{m}=length(y3{m});
T=2^12;
filt_opt3{m} = default_filter_options('audio', T);
Wop3{m} = wavelet_factory_1d(N3{m}, filt_opt3{m});
S3{m}=scat(y3{m},Wop3{m});
[Wop3{m},filters3{m}]=wavelet_factory_1d(N3{m},filt_opt3{m});
[S_table3{m}, meta3{m}] = format_scat(S3{m}); %scattering coefficients for non-covid cough
end

addpath(genpath('/Users/garimasharma/Downloads/Lanna_speech_database_children/All patient files'));
for n=1:2173
fname=strcat('P',num2str(n));
audioname=strcat(fname,'.wav');
[y4{n},fs4{n}]=audioread(audioname);
y4{n}=y4{n}(:,1);
N4{n}=length(y4{n});
T=2^12;
filt_opt4{n} = default_filter_options('audio', T);
Wop4{n} = wavelet_factory_1d(N4{n}, filt_opt4{n});
S4{n}=scat(y4{n},Wop4{n});
[Wop4{n},filters4{n}]=wavelet_factory_1d(N4{n},filt_opt4{n});
[S_table4{n}, meta4{n}] = format_scat(S4{n}); %scattering coefficients for non-covid cough
end

%% 

S13=cell2mat(S_table3)';
S14=cell2mat(S_table4)';
data = [S13;S14];
group = zeros(47222,354); group(15247:47222,1)=1;
T1 = table(data,group);

D12=[group,data];
Y = tsne(D12,'Algorithm','barneshut','NumPCAComponents',10,'perplexity',50);
figure
gscatter(Y(:,1),Y(:,2),group2)

rng default % for fair comparison
Y3 = tsne(D12,'Algorithm','barneshut','NumPCAComponents',10,'NumDimensions',3);
figure
scatter3(Y3(:,1),Y3(:,2),Y3(:,3),15,group2,'filled');
view(-93,14)
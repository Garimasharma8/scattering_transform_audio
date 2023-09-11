% garima Main file
% scalogram of same class audio texture

[data1,fs1]=audioread('/Users/garimasharma/Desktop/Texture analysis/Sample audio texture files/McDermott_Simoncelli_2011_168_Sound_Textures/Natural/Fire1.wav');
[data2,fs2]=audioread('/Users/garimasharma/Desktop/Texture analysis/Sample audio texture files/McDermott_Simoncelli_2011_168_Sound_Textures/Natural/Fire2.wav');

[cfs1,frq1] = cwt(data1(1:10000),fs1);
tms1 = (0:numel(data1(1:10000))-1)/fs1;
[cfs2,frq2] = cwt(data2(1:10000),fs1);
tms2 = (0:numel(data2(1:10000))-1)/fs1;



figure
subplot(2,1,1)
surface(tms1,log(frq1),abs(cfs1))
axis tight
shading flat
xlabel('Time (s)')
ylabel('log-Frequency')
set(gca,'yscale','log')
subplot(2,1,2)
surface(tms2,log(frq2),abs(cfs2))
axis tight
shading flat
xlabel('Time (s)')
ylabel('log-Frequency')
set(gca,'yscale','log')

%% scalogram for covid coughs 
[cfs1,frq1] = cwt(CC1(:,1),fs);
tms1 = (0:numel(CC1(:,1))-1)/fs;
[cfs2,frq2] = cwt(CC2(:,1),fs);
tms2 = (0:numel(CC2(:,1))-1)/fs;



figure
subplot(2,1,1)
surface(tms1,(frq1),abs(cfs1))
axis tight
shading flat
xlabel('Time (s)')
ylabel('log-Frequency')
set(gca,'yscale','log')
subplot(2,1,2)
surface(tms2,(frq2),abs(cfs2))
axis tight
shading flat
xlabel('Time (s)')
ylabel('log-Frequency')
set(gca,'yscale','log')

figure; subplot(211); spectrogram(CC1(1:40000,1), 128,120,128,'yaxis'); subplot(212);
spectrogram(CC2(1:40000,1), 128,120,128,'yaxis');
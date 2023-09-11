folder='/Users/garimasharma/Downloads/2019/dysarthria UAspeech/F02'
audio_files=dir(fullfile(folder,'*.m'))
for k=1:numel(audio_files)
    filename=audio_files(k).name;
end

    


%folder='C:\Users\malek\Documents\MATLAB'
%audio_files=dir(fullfile(folder,'*.m'))

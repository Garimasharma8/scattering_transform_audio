# scattering_transform_audio
joint t-f scattering transform for biomedical audio signals
This repository has MATLAB codes to get joint time-frequency scattering coefficients that represents the texture present in the biomedical audio sounds with pathology. 
The main function is scattering_may.m. 
To run the MATLAB code for your database, you need to change the path to the data, choose adequate values for T, Q, and F. 
T: with-in class invariance limits, typically it is in millisecs for speech, and longer for environment sounds. 
Q: Quality factor for the layered structure of joint t-f scattering transform. Typically it is [8,1]
F: Number of octaves require dto model the biomedical audio. 


Thsi repository has the MATLAB code used to get joint t-f scattering coeffients for biomedical audio signal with some pathological conditions. 
The main matlab file is “scattering may.m” and its supporting folder is scanet-2.0. The supporting files are also copied in this folder. This main file has all the
sections and its functionality explained in the code file itself.
There is an additional file "scatteringappermay.m" that can also be used as a main file, this MATLAB code has option to select the hyperparameters for this work such as: 
T: with in class invariacne, typically in millisecs for speech and longer for environmental sounds
F: No. of octaves required to model audio signal
Q: Quality factor, typically is [8,1], but mutable

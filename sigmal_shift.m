% Signals, Spectra, & Signal Processing
% UNIVERSITY OF CEBU LAPU-LAPU AND MANDAUE
% Plot Continuous-Time and Discrete-Time Signals with time shifting, revearsal and scaling
% Continuous-time Piecewise Functions:
%                   2 sin (pi/4)t            0 < or =  t  < or =  4 
%                              -t           -2 < or =  t  < or =  0
%                               2           -4 < or =  t  < or = -2
%
% piecewise values set in different variables
x1 = 0:.2:4;                                        % Limits of the first piecewise function 2 sin(pi/4)t
x2 = -2:.5:0;                                       % Limits of the second piecewise function -t
x3 = -4:-2;                                         % Limits of the third piecewise function 2
y1 = (2*(sin((pi/4)*x1)));                          % First piecewise function which is a curve
y2 = -x2;                                           % Second piecewise function which is a slope
y3 = [2 2 2];                                       % Third piecewise function which is a horizontal
% Starts plotting the piecewise function to see the signal output
                                            % creates a figure
figure (1);subplot(2,2,1);                                     % creates a subplot with 2 rows and 2 columns and this is at the first row and column
plot(x1,y1,x2,y2,x3,y3,'LineWidth', 3);             % plots the signal 
xlabel('time');                                     % sets the X-axis label for the graph
ylabel('f(t)');                                     % sets the Y-axis label for the graph
title('Original Continuous-Time Signal');           % sets the title for the graph
grid on;                                            % turns the grid lines on
hold on;                                            % holds the current graph for additional data
axis1 = [0 0];                                      % values for the Y-axis (vertical line)
axis2 = [-1 2.5];                                   % values for the Y-axis (vertical line)
axis3 = [-5 5];                                     % values for the X-axis (Horizontal line)
axis4 = [0 0];                                      % values for the X-axis (Horizontal line)
plot(axis1,axis2,axis3,axis4,'LineWidth', 1);       % plots the cross in cartesian plane
hold off;                                           % takes the hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%          Time-shift signal code          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dlg = inputdlg({'Time Shift ( + or - numbers / fraction )','Scale (positive number/fraction)','Reverse (negative or positive number)'},...  % creates a dialog box that asks for input
             'Continuous-time', [1 50; 1 50; 1 50]);        % continuation of the code for dialog box
%% gg= str2double(dlg(1,1));                             % converts the string input from the dialog box into a number
[aa,bb] = numden (sym(dlg(1,1)));
t = aa/bb;
ts1 = [0 0];                                         % values for the Y-axis (vertical line)
ts2 = [-1 2.5];                                      % values for the Y-axis (vertical line)
ts3 = [(-5-(t)) (5-(t))];                            % values for the X-axis (Horizontal line)
ts4 = [0 0];                                         % values for the X-axis (Horizontal line)
if t < 0 ;                                           % if statement condition if "t" is less than zero (negative)
    subplot(2,2,2);                                  % creates a subplot with 2 rows and 2 columns and this is at the second column and first row
    
    plot((x1-(t)),y1,(x2-(t)),y2,(x3-(t)),y3,'LineWidth',4);   % plots the data that has been time shifted according to the desired value
    grid on;                                                    % turns the grid lines on
    xlabel('time');                                     % sets the X-axis label for the graph
    ylabel('f(t)');                                     % sets the Y-axis label for the graph
    title('Time-Shifted Continuous-Time Signal');       % sets the title for the graph
    
    hold on;
    plot(ts1,ts2,ts3,ts4,'LineWidth',1);             % plots the cross in cartesian plane
    hold off;                                        % takes the hold off
else                                                 % else statement condition if "t" is greater than zero (positive)
    subplot(2,2,2);                                  % creates a subplot with 2 rows and 2 columns and this is at the second column and first row
    plot ((x1-t),y1,(x2-t),y2,(x3-t),y3,'LineWidth', 4);        % plots the data that has been time-shifted according to the desired value
    grid on;                                         % turns the grid lines on
    xlabel('time');                                  % sets the X-axis label for the graph
    ylabel('f(t)');                                  % sets the Y-axis label for the graph
    title('Time-Shifted Continuous-Time Signal');    % sets the title for the graph
    hold on;
    plot(ts1,ts2,ts3,ts4,'LineWidth',1);             % plots the cross in cartesian plane
    hold off;                                        % takes the hold off
end                                                  % end of if function
%pause(20);                                           % pause the program for 20 seconds
%clear;                                               % clears all data
%clc;                                                 % clears the command window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%           Scaling signal code          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n,d] = numden(sym(dlg(2,1)));                       % separates the numerator and denominator 
t2 = n/d;                                            % equates t2 with the input number
tc1 = [0 0];                                         % values for the Y-axis (vertical line)
tc2 = [-1 2.5];                                      % values for the Y-axis (vertical line)
tc3 = [-5 5];                                        % values for the X-axis (Horizontal line)
tc4 = [0 0];                                         % values for the X-axis (Horizontal line)
if t2 == n/d;                                        % if condition statement
    subplot(2,2,3);                                  % subplot in row 2, column 1
    plot(((x1-(t))*(d/n)),y1,((x2-(t))*(d/n)),y2,((x3-(t))*(d/n)),y3,'LineWidth',4);    % plots the signal
    
    grid on;                                         % turns the grid on
    grid minor;                                      % turns minor grid on
    xlabel('time');                                  % x-axis label
    ylabel('f(t)');                                  % y-axis label
    title('Scaled Continuous-Time Signal');          % title of the graph
    
    hold on;                                         % holds the current graph for adding options
    plot (tc1,tc2,(tc3*(d/n)),tc4,'LineWidth',1);    % plots the data to be added
    hold off;                                        % takes the hold off
    
else
    subplot(2,2,3);                                  % subplot in row 2, column 1
    plot (((x1-t)*(n/d)),y1,((x2-t)*(n/d)),y2,((x3-t)*(n/d)),y3,'LineWidth', 4);    % plots the signal
    
    grid on;                                         % turns the grid on
    grid minor;                                      % turns minor grid on
    xlabel('time');                                  % x-axis label
    ylabel('f(t)');                                  % y-axis label
    title('Scaled Continuous-Time Signal');          % title of the graph
    hold on;                                         % holds the current graph for adding options
    plot (tc1,tc2,(tc3*(n/d)),tc4,'LineWidth',1);    % plots the data to be added
    hold off;                                        % takes the hold off
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%           Reverse signal code          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t3 = str2double(dlg(3,1));
if t3 < 0 && t2 == n/d;
    subplot(2,2,4);
%    plot(-(x1*(d/n)),y1,-(x2*(d/n)),y2,-(x3*(d/n)),y3,'LineWidth', 3);
    plot(-((x1-(t))*(d/n)),y1,-((x2-(t))*(d/n)),y2,-((x3-(t))*(d/n)),y3,'LineWidth',4);    % plots the signal
    
    grid on;
    grid minor;
    xlabel('time');
    ylabel('f(t)');
    title('Reversed Continuous-Time Signal');
    
    hold on;
    plot (-(tc1),tc2,-(tc3*(d/n)),tc4,'LineWidth',1);
    hold off;
    
elseif t3 > 0 && t2 == n/d;
    
    subplot(2,2,4);
%    plot((x1*(d/n)),y1,(x2*(d/n)),y2,(x3*(d/n)),y3,'LineWidth', 3);
 
    plot (-((x1-t)*(d/n)),y1,-((x2-t)*(d/n)),y2,-((x3-t)*(d/n)),y3,'LineWidth', 4);    % plots the signal
    
    grid on;
    grid minor;
    xlabel('time');
    ylabel('f(t)');
    title('Reversed Continuous-Time Signal');
    h = msgbox('no reversing done!');
    
    hold on;
    plot (-(tc1),tc2,-(tc3*(d/n)),tc4,'LineWidth',1);
    hold off;
    h = msgbox('no reversing done!');
    
elseif t3 < 0 && t2 == d/n;
    
    subplot(2,2,4);
%    plot(-(x1*(n/d)),y1,-(x2*(n/d)),y2,-(x3*(n/d)),y3,'LineWidth', 3);
    
    plot (-((x1-t)*(n/d)),y1,-((x2-t)*(n/d)),y2,-((x3-t)*(n/d)),y3,'LineWidth', 4);    % plots the signal
    
    grid on;
    grid minor;
    xlabel('time');
    ylabel('f(t)');
    title('Scaled Continuous-Time Signal');
    hold on;
    plot (tc1,tr2,(tc3*(n/d)),tc4,'LineWidth',1);
    hold off;
    
else 
    
    subplot(2,2,4);
%    plot((x1*(n/d)),y1,(x2*(n/d)),y2,(x3*(n/d)),y3,'LineWidth', 3);
    plot (-((x1-t)*(n/d)),y1,-((x2-t)*(n/d)),y2,-((x3-t)*(n/d)),y3,'LineWidth', 4);    % plots the signal
    grid on;
    grid minor;
    xlabel('time');
    ylabel('f(t)');
    title('Scaled Continuous-Time Signal');
    h = msgbox('no reversing done!');
    hold on;
    plot (tc1,tc2,(tc3*(n/d)),tc4,'LineWidth',1);
    hold off;
    
end
%% run support_file.m;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%     Discrete - Time Signal Processing       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% discrete-time Piecewise Functions:
%                   2 sin (pi/4)t            0 < or =  t  < or =  4 
%                              -t           -2 < or =  t  < or =  0
%                               2           -4 < or =  t  < or = -2
%
% piecewise values set in different variables
xx1 = 0:.5:4;                                        % Limits of the first piecewise function 2 sin(pi/4)t
xx2 = -2:.5:0;                                       % Limits of the second piecewise function -t
xx3 = -4:-2;                                         % Limits of the third piecewise function 2
yy1 = (2*(sin((pi/4)*xx1)));                          % First piecewise function which is a curve
yy2 = -xx2;                                           % Second piecewise function which is a slope
yy3 = [2 2 2];                                       % Third piecewise function which is a horizontal
% Starts plotting the piecewise function to see the signal output
figure (2);                                             % creates a figure
subplot(2,2,1);                                     % creates a subplot with 2 rows and 2 columns and this is at the first row and column
stem(xx1,yy1,'filled');
hold on;
stem (xx2,yy2,'filled');
hold on;
stem(xx3,yy3,'filled');                                      % plots the signal 
xlabel('n');                                     % sets the X-axis label for the graph
ylabel('x(n)');                                     % sets the Y-axis label for the graph
title('Original Discrete-Time Signal');           % sets the title for the graph
grid on;                                            % turns the grid lines on
hold on;                                            % holds the current graph for additional data
axxis1 = [0 0];                                      % values for the Y-axis (vertical line)
axxis2 = [-1 2.5];                                   % values for the Y-axis (vertical line)
axxis3 = [-5 5];                                     % values for the X-axis (Horizontal line)
axxis4 = [0 0];                                      % values for the X-axis (Horizontal line)
plot(axxis1,axxis2,axxis3,axxis4,'LineWidth', 1);       % plots the cross in cartesian plane
hold off;                                           % takes the hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%          Time-shift signal code          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[aa1,bb1] = numden (sym(dlg(1,1)));                   % converts the string input from the dialog box into a number or fraction
tt = aa1/bb1;
tts1 = [0 0];                                         % values for the Y-axis (vertical line)
tts2 = [-1 2.5];                                      % values for the Y-axis (vertical line)
tts3 = [(-5-(t)) (5-(t))];                            % values for the X-axis (Horizontal line)
tts4 = [0 0];                                         % values for the X-axis (Horizontal line)
if tt < 0 ;                                           % if statement condition if "t" is less than zero (negative)
    subplot(2,2,2);                                  % creates a subplot with 2 rows and 2 columns and this is at the second column and first row
    
    stem(xx1-(tt),yy1,'filled');
    hold on;
    stem(xx2-(tt),yy2,'filled');
    hold on;
    stem(xx3-(tt),yy3,'filled');   % plots the data that has been time shifted according to the desired value
    grid on;                                                    % turns the grid lines on
    xlabel('n');                                     % sets the X-axis label for the graph
    ylabel('x(n)');                                     % sets the Y-axis label for the graph
    title('Time-Shifted Discrete-Time Signal');       % sets the title for the graph
    
    hold on;
    plot(tts1,tts2,tts3,tts4,'LineWidth',1);             % plots the cross in cartesian plane
    hold off;                                        % takes the hold off
else                                                 % else statement condition if "t" is greater than zero (positive)
    subplot(2,2,2);                                  % creates a subplot with 2 rows and 2 columns and this is at the second column and first row
    stem ((xx1-tt),yy1,'filled')
    hold on;
    stem((xx2-tt),yy2,'filled');
    hold on;
    stem((xx3-tt),yy3,'filled');        % plots the data that has been time-shifted according to the desired value
    grid on;                                         % turns the grid lines on
    xlabel('n');                                  % sets the X-axis label for the graph
    ylabel('x(n)');                                  % sets the Y-axis label for the graph
    title('Time-Shifted Discrete-Time Signal');    % sets the title for the graph
    hold on;
    plot(tts1,tts2,tts3,tts4,'LineWidth',1);             % plots the cross in cartesian plane
    hold off;                                        % takes the hold off
end                                                  % end of if function
%pause(20);                                           % pause the program for 20 seconds
%clear;                                               % clears all data
%clc;                                                 % clears the command window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%           Scaling signal code          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nn,dd] = numden(sym(dlg(2,1)));
tt2 = nn/dd;
ttc1 = [0 0];                                         % values for the Y-axis (vertical line)
ttc2 = [-1 2.5];                                      % values for the Y-axis (vertical line)
ttc3 = [-5 5];                                        % values for the X-axis (Horizontal line)
ttc4 = [0 0];                                         % values for the X-axis (Horizontal line)
if tt2 == nn/dd;
    subplot(2,2,3);
    % plots the data that has been time shifted according to the desired value
    stem(((xx1-(tt)))*(dd/nn),yy1,'filled');
    hold on;
    stem(((xx2-(tt))*(dd/nn)),yy2,'filled');
    hold on;
    stem(((xx3-(tt))*(dd/nn)),yy3,'filled');
        
    grid on;                                         % turns the grid on
    grid minor;                                      % turns minor grid on
    
    xlabel('n');
    ylabel('x(n)');
    title('Scaled Discrete-Time Signal');
    
    hold on;
    plot (ttc1,ttc2,(ttc3*(dd/nn)),ttc4,'LineWidth',1);
    hold off;
    
else
    subplot(2,2,3);
    % plots the data that has been time-shifted according to the desired value
    stem((((xx-tt))*(nn/dd)),yy1,'filled');
    hold on;
    stem((((xx2-tt))*(nn/dd)),yy2,'filled');
    hold on;
    stem((((xx3-tt))*(nn/dd)),yy3,'filled');
    
    grid on;
    xlabel('n');
    ylabel('x(n)');
    title('Scaled Discrete-Time Signal');
    hold on;
    plot (ttc1,ttc2,(ttc3*(nn/dd)),ttc4,'LineWidth',1);
    hold off;
    
end

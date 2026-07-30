data=readtable("C:\Users\AIZAZ BADRU\OneDrive\Documents\MATLAB\2\yolo_log_ver5_20260325.csv");

u=data.rc_value;        % Control input (throttle velocity)
y=data.y1;              % System output (altitude in cm)

ts=mean(diff(data.time));% Average sampling time
myDroneD=iddata(y,u,ts);% Format as iddata object

systemIdentification;   % Open System Identification App

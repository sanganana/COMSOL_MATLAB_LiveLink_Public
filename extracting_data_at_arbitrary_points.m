clc
clear

% Connect to COMSOL (replace 'COMSOL_Server' with the actual server name)
%mphconnect('COMSOL_Server');

model = mphload('F:\Pawan_MSDD_Data\COMSOL_Data_Files\Drug_release_from_hydrogel\new_cases\case3\case3.mph');

% % Assuming the velocity field is in a dataset named 'Velocity'
% %velocity_data = mphget(model, 'Velocity', 'u'); % Replace 'u' with the velocity component
% 
data_u = mpheval(model,'u');    %struct of u    %%not needed
ud1 = data_u.d1;                                %%not needed

interpolated_data = mphinterp(model,'u','coord',[1.0051E-4;1.8784E-4]);%0.0017080
% rows are for different time instants
%1.0051E-4;1.8784E-4 are x and y coordinates of probe point where
%interpolation is done
%'u' is the variable name % no need to do data_u.d1

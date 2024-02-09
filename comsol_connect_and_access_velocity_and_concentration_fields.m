clc
clear

% Connect to COMSOL (replace 'COMSOL_Server' with the actual server name)
%mphconnect('COMSOL_Server');

model = mphload('F:\Pawan_MSDD_Data\COMSOL_Data_Files\Drug_release_from_hydrogel\new_cases\case3\case3.mph');

% Assuming the velocity field is in a dataset named 'Velocity'
%velocity_data = mphget(model, 'Velocity', 'u'); % Replace 'u' with the velocity component

data_u = mpheval(model,'u');    %struct of u
data_v = mpheval(model,'v');    %struct of v
data_w = mpheval(model,'w');    %struct of w
data_x = mpheval(model,'x');    %struct of x
data_y = mpheval(model,'y');    %struct of y
%data_z = mpheval(model,'z');   %struct of z    %non-existent in 2D simulations

% data_u or similar other struct have fields: 
% data_u.expr: expression name evaluated
% data_u.d1:    
%% data_u.p:     node point coordinate information. The number of rows in p is the number of space dimensions.
% data_u.t:     indices to columns in p of a simplex mesh, each column in t representing a simplex
% data_u.ve:    indices to mesh elements for each node point
% data_u.unit:  list of the unit for each expression

%% no need to extract data_x and data_y since coordinates are already available on data_u.p
%%
%======details of mpheval=====================================================================
% pd = mpheval(model,{e1,...,en},...) returns the post data pd for the
% expressions e1,...,en.
% The output value pd is a structure with fields expr, p, t, ve, unit and fields for data
% values.
% • The field expr contains the expression name evaluated.
% • For each expression e1,...,en a field with the name d1,... dn is added with the
% numerical values. The columns in the data value fields correspond to node point
% coordinates in columns in p. The data contains only the real part of complex-valued
% expressions.
% • The field p contains node point coordinate information. The number of rows in p
% is the number of space dimensions.
% • The field t contains the indices to columns in p of a simplex mesh, each column in
% t representing a simplex.
% • The field ve contains indices to mesh elements for each node point.
% • The field unit contains the list of the unit for each expression.
%==============================================================================================
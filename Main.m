%% Main.m  
clc;  
clear;  
  
%% Data Generator Method 1  
% sparsity_X = 0.4;  
% Y = randi(10,M,P);  
% X = floor(sprand(N,P,sparsity_X)*10);  
  
%% Data Generator Method 2 
train_data = [1 1 1 1 0 0;2 2 0 0 0 0;3 3 0 0 0 0;0 0 3 3 1 1;0 0 0 0 2 2];  %Y 5x6  其中5是特征数，6是数据数目

T = 2; %稀疏度
dict_size = 4;

%% Main Iteration  
[D,X] = MOD(train_data,T,0.001,dict_size);

% testing
test_data=[0,0,0,1,1;1,2,3,0,0;1,1,1,1,1]'; 
x_test=OMP(test_data,D,T);
test_data_r=D*x_test;
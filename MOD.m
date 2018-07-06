
function [ D , X ] = MOD( Y ,K ,ErrorThreshold,dict_size )  
%MOD Summary of this function goes here  
%   Detailed explanation goes here  
%   Sample_Data is Y  
%   Coefficient is X  
%   Dictionary is D  
%   sparsity is K  
  
disp('Run Method of directions');  
iteration_time = 1;  
error = ErrorThreshold+1;  
seq_rand = randperm(size(Y,2));
D = Y(:,seq_rand(1:dict_size));
D=[0,1,1,1;0,2,0,2;0,3,0,3;1,0,3,0;2,0,0,0];  
while error>=ErrorThreshold;  
    disp(['iteration time = ' num2str(iteration_time)]);  
%     D = Regression(Y,X);  
    X = OMP(Y,D,K);  
    [ D,X ]= ksvd(Y,D,X);
    
    iteration_time = iteration_time+1;  
    error = sum(sum(abs(Y-D*X)))  
end  
  
end  
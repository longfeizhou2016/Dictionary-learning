%   @Function: Dictionary learning & KSVD 
%   this function is a simple implementation of the ksvd method
%   @CreateTime: 2018-07-06  
%   @Author: Longfei Zhou 
%   @https://github.com/longfeizhou2016/Dictionary-learning  

function [ X ] = OMP( Y,D,K )  
% Y is the sample data to be recovered M*P  
% D is the dictionary M*N  
% X is the sparse coefficient N*P  
% K is the sparsity  
  
if nargin==2  
    K = size(D,2);  
end;  
  
M = size(D,1);  
P = size(Y,2);  
N = size(D,2);  
m = K*2;  % execute iterations  
  
for idx = 1:P  
    % recover the idx-th column sample  
    y = Y(:,idx);  
    residual = y;  
    Aug_D = [];  
    D1 = D;  
      
    for times = 1:m;  
        product = abs(D1'*residual);  
        [~,pos] = max(product); %  最大投影系数对应的位置  
        Aug_D = [Aug_D, D1(:,pos)];  
        D1(:,pos) = zeros(M,1);    %去掉选中的列  
        indx(times) = pos;  
        Aug_x = (Aug_D'*Aug_D)^-1*Aug_D'*y; %  最小二乘,使残差最小,i.e. x = pinv(Aug_D)*y  
        residual = y - Aug_D*Aug_x;  
          
        if sum(residual.^2)<1e-6  
            break;  
        end  
    end  
    temp = zeros(N,1);  
    temp(indx(1:times)) = Aug_x;  
%     X(:,idx) = sparse(temp); 
    X(:,idx) = temp; 
end  
end  
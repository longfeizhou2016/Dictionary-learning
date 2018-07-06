function [ D,W ] = ksvd( Y, D, W )
%KSVD 此处显示有关此函数的摘要
for i = 1:size(D,2)
    [D,W] = dict_update(Y,D,W,i);
end

end
function [D_temp,W_temp] = dict_update(Y,D,W,k)
   indexs = find(W(k,:)~=0); %找出编码中，第k行中不为0的列索引
   D_temp = D;
   W_temp = W;
   if size(indexs,2)>0
       D_temp(:,k) = 0;  %把即将更新的字典的第k列置为0
       E_k = Y(:,indexs) - D_temp*W_temp(:,indexs); 
       [u,s,v] = svd(E_k);
       D_temp(:,k) = u(:,1);
       W_temp(k,indexs) = v(:,1)*s(1,1);
   end
end


%% 更新路径R的信息素
%输入Tau：                 信息素矩阵
%输入bestR：               路径
%输入rho：                 信息素挥发因子
%输入Q：                   更新信息素浓度的常数
%输入cap：                 最大载重量
%输入demands：             需求量
%输入a：                   顾客时间窗开始时间[a[i],b[i]]
%输入b：                   顾客时间窗结束时间[a[i],b[i]]
%输入L：                   配送中心时间窗结束时间
%输入s：                   客户点的服务时间
%输入dist：                距离矩阵
%输出Tau：                 更新后的信息素矩阵
function Tau=updateTau(Tau,bestR,rho,Q,cap,demands,a,b,L,s,dist)
[bestVC,bestNV,bestTD]=decode(bestR,cap,demands,a,b,L,s,dist);
cusnum=size(dist,1)-1;
Delta_Tau=zeros(cusnum+1,cusnum+1);
delta_Tau=Q/bestTD;
for j=1:cusnum-1
    Delta_Tau(bestR(j),bestR(j+1))=Delta_Tau(bestR(j),bestR(j+1))+delta_Tau;
    Tau(bestR(j),bestR(j+1))=rho*Tau(bestR(j),bestR(j+1))+Delta_Tau(bestR(j),bestR(j+1));
end
Delta_Tau(bestR(cusnum),1)=Delta_Tau(bestR(cusnum),1)+delta_Tau;
Tau(bestR(cusnum),1)=rho*Tau(bestR(cusnum),1)+Delta_Tau(bestR(cusnum),1);
end




%% 计算每辆车离开当前路径上集配中心时的载货量、每辆车离开当前路径上每一点时的载货量
%输入vehicles_customer            每辆车所经过的顾客
%输入d1                           表示由集配中心运送到顾客的配送量
%输出vd                           每辆车离开集配中心的装货量
%输出vw                           每辆车离开加工车间的装货量
%输出vl                           每辆车离开当前路径上集配中心时的载货量、每辆车离开当前路径上每一点时的载货量
function [vl]= vehicle_load( vehicles_customer,demands)
n=size(vehicles_customer,1);                    %车辆总数
vl=zeros(n,1);                                          %每辆车离开当前路径上集配中心时的载货量、每辆车离开当前路径上每一点时的载货量
%% 先计算出每辆车在集配中心初始的装货总量
for i=1:n
    route=vehicles_customer{i};
    if isempty(route)
        vl(i)=0;
    else
        Ld= leave_load( route,demands );
        vl(i)=Ld;
    end
end
end

%% 计算一个配送方案的总成本=cd*车辆使用数目+ct*车辆行驶总距离
%输入VC：          配送方案
%输入dist：        距离矩阵
%输出cost：        总成本
%输出NV：          车辆使用数目
%在此处可以增加末端配送方式数列确定车辆的末端配送方式
function [cost,NV,TD]=costFun(VC,dist)
NV=size(VC,1);                      %车辆使用数目
TD=travel_distance(VC,dist);        %行驶总距离
cost=1000*NV+1*TD;
end
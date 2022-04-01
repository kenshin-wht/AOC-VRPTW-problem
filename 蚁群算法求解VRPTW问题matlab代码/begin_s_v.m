%
%      @作者：随心390
%      @微信公众号：优化算法交流地
%
%% 计算每辆车配送路线上在各个点开始服务的时间，还计算返回集配中心时间
%输入vehicles_customer：       每辆车所经过的顾客
%输入a：                       最早开始服务的时间窗
%输入s：                       对每个点的服务时间
%输入dist：                    距离矩阵
%输出bsv：                     每辆车配送路线上在各个点开始服务的时间，还计算返回集配中心时间
function bsv=begin_s_v(vehicles_customer,a,s,dist)
n=size(vehicles_customer,1);
bsv=cell(n,1);
for i=1:n
    route=vehicles_customer{i};
    [arr,bs,wait,back]=begin_s(route,a,s,dist);
    bsv{i}=[bs,back];
end
end
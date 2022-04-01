
%% 将配送方案转换成路径
function R=VC_to_Route(VC)
NV=size(VC,1);              %车辆使用数目
R=[];
for i=1:NV
    R=[R,VC{i}];
end
end


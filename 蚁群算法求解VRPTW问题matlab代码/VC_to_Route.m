
%% �����ͷ���ת����·��
function R=VC_to_Route(VC)
NV=size(VC,1);              %����ʹ����Ŀ
R=[];
for i=1:NV
    R=[R,VC{i}];
end
end


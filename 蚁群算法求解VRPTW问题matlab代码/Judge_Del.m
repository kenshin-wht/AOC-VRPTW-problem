
%% ������Ž����Ƿ����Ԫ�ض�ʧ�����
%����op_fvc       ���з��䷽��
%���DEL          ��ʧԪ�أ����û����Ϊ��
function DEL=Judge_Del(op_fvc)
NV=size(op_fvc,1);
route=[];
for i=1:NV
    route=[route op_fvc{i}];
end
sr=sort(route);
LEN=length(sr);
%% Ѱ�Ҷ�ʧ��Ԫ��
INIT=1:100;
%setxor(a,b)���Եõ�a,b����������ͬ��Ԫ�أ�Ҳ�в��ڽ����е�Ԫ��
DEL=setxor(sr,INIT);
end


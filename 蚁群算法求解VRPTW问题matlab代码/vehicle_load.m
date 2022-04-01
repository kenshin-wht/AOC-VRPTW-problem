
%% ����ÿ�����뿪��ǰ·���ϼ�������ʱ���ػ�����ÿ�����뿪��ǰ·����ÿһ��ʱ���ػ���
%����vehicles_customer            ÿ�����������Ĺ˿�
%����d1                           ��ʾ�ɼ����������͵��˿͵�������
%���vd                           ÿ�����뿪�������ĵ�װ����
%���vw                           ÿ�����뿪�ӹ������װ����
%���vl                           ÿ�����뿪��ǰ·���ϼ�������ʱ���ػ�����ÿ�����뿪��ǰ·����ÿһ��ʱ���ػ���
function [vl]= vehicle_load( vehicles_customer,demands)
n=size(vehicles_customer,1);                    %��������
vl=zeros(n,1);                                          %ÿ�����뿪��ǰ·���ϼ�������ʱ���ػ�����ÿ�����뿪��ǰ·����ÿһ��ʱ���ػ���
%% �ȼ����ÿ�����ڼ������ĳ�ʼ��װ������
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
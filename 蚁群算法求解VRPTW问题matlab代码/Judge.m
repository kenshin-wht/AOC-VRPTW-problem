
%% �жϵ�ǰ�����Ƿ�����ʱ�䴰Լ����������Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
%���룺chrom               ����
%���룺cap                 ���������
%���룺demands             ������
%���룺a                   �˿�ʱ�䴰��ʼʱ��[a[i],b[i]]
%���룺b                   �˿�ʱ�䴰����ʱ��[a[i],b[i]]
%���룺L                   ��������ʱ�䴰����ʱ��
%���룺s                   �ͻ���ķ���ʱ��
%���룺dist                ��������������ǹ�ϵ�����þ����ʾ����c[i][j]=dist[i][j]
%�����flag                0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
function flag=Judge(VC,cap,demands,a,b,L,s,dist)
flag=1;                         %��������Լ��
NV=size(VC,1);                  %����ʹ����Ŀ
%% ����ÿ������װ����
init_v=vehicle_load(VC,demands);
%% ����ÿ��������·�����ڸ����㿪ʼ�����ʱ�䣬�����㷵�ؼ�������ʱ��
bsv=begin_s_v(VC,a,s,dist);
%% �ж��Ƿ�Υ��ʱ�䴰Լ����0����Υ����1����Υ��
violate_INTW=Judge_TW(VC,bsv,b,L);
%% ����ÿ��·����һ����һ��·��������Լ����flag=0
for i=1:NV
    find1=find(violate_INTW{i}==1,1,'first');      %Ѱ�Ҹ���·��Υ��ʱ�䴰Լ���Ĺ˿�λ��
    if init_v(i)>cap || ~isempty(find1)
        flag=0;
        break
    end
end
end



%% �ҵ�����k��i����������ƶ�������һ����j�ļ��ϣ�j�����������������ʱ��Լ������δ������k������Ĺ˿�
%����k��                   �������
%����Table��               ·����¼��
%����cap��                 ���������
%����demands��             ������
%����a��                   �˿�ʱ�䴰��ʼʱ��[a[i],b[i]]
%����b��                   �˿�ʱ�䴰����ʱ��[a[i],b[i]]
%����L��                   ��������ʱ�䴰����ʱ��
%����s��                   �ͻ���ķ���ʱ��
%����dist��                �������
%���Nik��                 ����k��i����������ƶ�������һ����j�ļ��ϣ�j�����������������ʱ��Լ������δ������k������Ĺ˿�
function Nik=next_point_set(k,Table,cap,demands,a,b,L,s,dist)
route_k=Table(k,:);                                     %����k��·��
cusnum=size(Table,2);                                   %�˿���Ŀ
route_k(route_k==0)=[];                                 %��0������k��·����¼������ɾ��
%% �������k�Ѿ����������ɸ��˿�
if ~isempty(route_k)
    [VC,NV,TD]=decode(route_k,cap,demands,a,b,L,s,dist);    %����kĿǰΪֹ��������������·��
    route=VC{end,1};                                        %����k��ǰ���ڹ�����·��
    lr=length(route);                                       %����k��ǰ���ڹ�����·�������ʹ˿���Ŀ
    preroute=zeros(1,lr+1);                                 %��ʱ��������������k��ǰ���ڹ�����·�������һ������·��
    preroute(1:lr)=route;
    allSet=1:cusnum;                                        %setxor(a,b)���Եõ�a,b����������ͬ��Ԫ�أ�Ҳ�в��ڽ����е�Ԫ�أ�
    unVisit=setxor(route_k,allSet);                         %�ҳ�����kδ����Ĺ˿ͼ���
    uvNum=length(unVisit);                                  %�ҳ�����kδ����Ĺ˿���Ŀ
    Nik=zeros(uvNum,1);                                     %��ʼ������k��i����������ƶ�������һ����j�ļ��ϣ�j�����������������ʱ��Լ������δ������k������Ĺ˿�
    for i=1:uvNum
        preroute(end)=unVisit(i);                           %��unVisit(i)��ӵ�����k��ǰ���ڹ�����·��route��
        flag=JudgeRoute(preroute,cap,demands,a,b,L,s,dist); %�жϵ�ǰ·���Ƿ�����ʱ�䴰Լ����������Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
        %�������Լ������unVisit(i)��ӵ�����k��i����������ƶ�������һ����j�ļ�����
        if flag==1
            Nik(i)=unVisit(i);
        end
    end
    Nik(Nik==0)=[];                                         %��0��np_set��ɾ��
else
    %% �������kû�з����κι˿�
    Nik=1:cusnum;                                           %�����й˿Ͷ����Գ�Ϊ��ѡ��
end
end
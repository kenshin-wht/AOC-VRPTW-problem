
clear
clc
close all
tic
%% ��importdata�����������ȡ�ļ�
c101=importdata('c101.txt');
cap=200;                                                        %�������װ����
%% ��ȡ������Ϣ
E=c101(1,5);                                                    %��������ʱ�䴰��ʼʱ��
L=c101(1,6);                                                    %��������ʱ�䴰����ʱ��
vertexs=c101(:,2:3);                                            %���е������x��y
customer=vertexs(2:end,:);                                      %�˿�����
cusnum=size(customer,1);                                        %�˿���
v_num=25;                                                       %�������ʹ����Ŀ
demands=c101(2:end,4);                                          %������
a=c101(2:end,5);                                                %�˿�ʱ�䴰��ʼʱ��[a[i],b[i]]
b=c101(2:end,6);                                                %�˿�ʱ�䴰����ʱ��[a[i],b[i]]
width=b-a;                                                      %�˿͵�ʱ�䴰���
s=c101(2:end,7);                                                %�ͻ���ķ���ʱ��
h=pdist(vertexs);
dist=squareform(h);                                             %�������
%% ��ʼ������
m=200;                                                           %��������
alpha=1;                                                        %��Ϣ����Ҫ�̶�����
beta=3;                                                         %����������Ҫ�̶�����
gama=2;                                                         %�ȴ�ʱ����Ҫ�̶�����
delta=3;                                                        %ʱ�䴰�����Ҫ�̶�����
r0=0.5;                                                         %r0Ϊ��������ת�ƹ���Ĳ���
rho=0.85;                                                       %��Ϣ�ػӷ�����
Q=5;                                                            %������Ϣ��Ũ�ȵĳ���
Eta=1./dist;                                                    %��������
Tau=ones(cusnum+1,cusnum+1);                                    %��Ϣ�ؾ���
Table=zeros(m,cusnum);                                          %·����¼��
iter=1;                                                         %����������ֵ
iter_max=30;                                                   %����������
Route_best=zeros(iter_max,cusnum);                              %�������·��
Cost_best=zeros(iter_max,1);                                    %�������·���ĳɱ�
%% ����Ѱ�����·��
while iter<=iter_max
    %% �ȹ������������ϵ�·��
    %�������ѡ��
    for i=1:m
        %����˿�ѡ��
        for j=1:cusnum
            r=rand;                                             %rΪ��[0,1]�ϵ��������
            np=next_point(i,Table,Tau,Eta,alpha,beta,gama,delta,r,r0,a,b,width,s,L,dist,cap,demands);
            Table(i,j)=np;
        end
    end
    %% ����������ϵĳɱ�=1000*����ʹ����Ŀ+������ʻ�ܾ���
    cost=zeros(m,1);
    NV=zeros(m,1);
    TD=zeros(m,1);
    for i=1:m
        VC=decode(Table(i,:),cap,demands,a,b,L,s,dist);
        [cost(i,1),NV(i,1),TD(i,1)]=costFun(VC,dist);
    end
    %% ������С�ɱ���ƽ���ɱ�
    if iter == 1
        [min_Cost,min_index]=min(cost);
        Cost_best(iter)=min_Cost;
        Route_best(iter,:)=Table(min_index,:);
    else
        [min_Cost,min_index]=min(cost);
        Cost_best(iter)=min(Cost_best(iter - 1),min_Cost);
        if Cost_best(iter)==min_Cost
            Route_best(iter,:)=Table(min_index,:);
        else
            Route_best(iter,:)=Route_best((iter-1),:);
        end
    end
    %% ������Ϣ��
    bestR=Route_best(iter,:);
    [bestVC,bestNV,bestTD]=decode(bestR,cap,demands,a,b,L,s,dist);
    Tau=updateTau(Tau,bestR,rho,Q,cap,demands,a,b,L,s,dist);
    %% ��ӡ��ǰ���Ž�
    disp(['��',num2str(iter),'�����Ž�:'])
    disp(['����ʹ����Ŀ��',num2str(bestNV),'��������ʻ�ܾ��룺',num2str(bestTD)]);
    fprintf('\n')
    %% ����������1�����·����¼��
    iter=iter+1;
    Table=zeros(m,cusnum);
end
%% �����ʾ
bestRoute=Route_best(end,:);
[bestVC,NV,TD]=decode(bestRoute,cap,demands,a,b,L,s,dist);
draw_Best(bestVC,vertexs);
%% ��ͼ
figure(2)
plot(1:iter_max,Cost_best,'b')
xlabel('��������')
ylabel('�ɱ�')
title('������С�ɱ��仯����ͼ')
%% �ж����Ž��Ƿ�����ʱ�䴰Լ����������Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
flag=Judge(bestVC,cap,demands,a,b,L,s,dist);
%% ������Ž����Ƿ����Ԫ�ض�ʧ���������ʧԪ�أ����û����Ϊ��
DEL=Judge_Del(bestVC);
toc
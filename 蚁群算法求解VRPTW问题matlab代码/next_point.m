
%% ����ת�ƹ�ʽ���ҵ�����k��i������ƶ�������һ����j��j�����������������ʱ��Լ������δ������k������Ĺ˿�

function j=next_point(k,Table,Tau,Eta,alpha,beta,gama,delta,r,r0,a,b,width,s,L,dist,cap,demands)
route_k=Table(k,:);                                         %����k��·��
i=route_k(find(route_k~=0,1,'last'));                       %����k���ڷ��ʵĹ˿ͱ��
if isempty(i)
    i=0;
end
route_k(route_k==0)=[];                                     %��0������k��·����¼������ɾ��
cusnum=size(Table,2);                                       %�˿���Ŀ
allSet=1:cusnum;                                            %setxor(a,b)���Եõ�a,b����������ͬ��Ԫ�أ�Ҳ�в��ڽ����е�Ԫ�أ�
unVisit=setxor(route_k,allSet);                             %�ҳ�����kδ����Ĺ˿ͼ���
uvNum=length(unVisit);                                      %�ҳ�����kδ����Ĺ˿���Ŀ
[VC,NV,TD]=decode(route_k,cap,demands,a,b,L,s,dist);        %����kĿǰΪֹ��������������·��
%�����ǰ·�����ͷ���Ϊ��
if ~isempty(VC)
    route=VC{end,1};                                            %����k��ǰ���ڹ�����·��
else
    %�����ǰ·�����ͷ�����Ϊ��
    route=[];
end
lr=length(route);                                           %����k��ǰ���ڹ�����·�������ʹ˿���Ŀ
preroute=zeros(1,lr+1);                                     %��ʱ��������������k��ǰ���ڹ�����·�������һ������·��
preroute(1:lr)=route;
Nik=next_point_set(k,Table,cap,demands,a,b,L,s,dist);       %�ҵ�����k��i����������ƶ�������һ����j�ļ��ϣ�j�����������������ʱ��Լ������δ������k������Ĺ˿�

%% ���r<=r0��j=max{[Tau(i,j)]^alpha * [Eta(i+1,j+1)]^beta * [1/width(j)]^gama * [1/wait(j)]^delta}
if r<=r0
    %���Nik�ǿգ�������k�����ڵ�ǰ·���ӹ˿�i�������ʹ˿�
    if ~isempty(Nik)
        Nik_num=length(Nik);
        p_value=zeros(Nik_num,1);                           %��¼״̬ת�Ƹ���
        for h=1:Nik_num
            j=Nik(h);
            preroute(end)=j;
            [~,~,wait,~]=begin_s(preroute,a,s,dist);
            if wait(end)==0
                wait(end)=1e-8;
            end
            p_value(h,1)=((Tau(i+1,j+1))^alpha)*((Eta(i+1,j+1))^beta)*((1/width(j))^gama)*((1/wait(end))^delta);
        end
        [~,maxIndex]=max(p_value);                          %�ҳ�p_value�����ֵ�������
        j=Nik(maxIndex);                                    %ȷ���˿�j
    else
        %���NikΪ�գ�������k���뷵���������ģ����������Ŀ�ʼ�����µĹ˿�
        p_value=zeros(uvNum,1);                             %��¼״̬ת�Ƹ���
        for h=1:uvNum
            j=unVisit(h);
            preroute(end)=j;
            [~,~,wait,~]=begin_s(preroute,a,s,dist);
            if wait(end)==0
                wait(end)=1e-8;
            end
            p_value(h,1)=((Tau(i+1,j+1))^alpha)*((Eta(i+1,j+1))^beta)*((1/width(j))^gama)*((1/wait(end))^delta);
        end
        [~,maxIndex]=max(p_value);                          %�ҳ�p_value�����ֵ�������
        j=unVisit(maxIndex);                                %ȷ���˿�j
    end
else
    %% ���r>r0�����ݸ��ʹ�ʽ�����̶ķ�ѡ���j
    %���Nik�ǿգ�������k�����ڵ�ǰ·���ӹ˿�i�������ʹ˿�
    if ~isempty(Nik)
        Nik_num=length(Nik);
        p_value=zeros(Nik_num,1);                           %��¼״̬ת�Ƹ���
        for h=1:Nik_num
            j=Nik(h);
            preroute(end)=j;
            [~,~,wait,~]=begin_s(preroute,a,s,dist);
            if wait(end)==0
                wait(end)=1e-8;
            end
            p_value(h,1)=((Tau(i+1,j+1))^alpha)*((Eta(i+1,j+1))^beta)*((1/width(j))^gama)*((1/wait(end))^delta);
        end
        index=roulette(p_value);                            %�������̶�ѡ�����
        j=Nik(index);                                       %ȷ���˿�j
    else
        %���NikΪ�գ�������k���뷵���������ģ����������Ŀ�ʼ�����µĹ˿�
        p_value=zeros(uvNum,1);                             %��¼״̬ת�Ƹ���
        for h=1:uvNum
            j=unVisit(h);
            preroute(end)=j;
            [~,~,wait,~]=begin_s(preroute,a,s,dist);
            if wait(end)==0
                wait(end)=1e-8;
            end
            p_value(h,1)=((Tau(i+1,j+1))^alpha)*((Eta(i+1,j+1))^beta)*((1/width(j))^gama)*((1/wait(end))^delta);
        end
        index=roulette(p_value);                            %�������̶�ѡ�����
        j=unVisit(index);                                   %ȷ���˿�j
    end
end
end
%
%      @���ߣ�����390
%      @΢�Ź��ںţ��Ż��㷨������
%
%% �����������ͷ���·��ͼ
%���룺VC              ���ͷ���
%���룺vertexs         ������ľ��Ⱥ�γ��
function draw_Best(VC,vertexs)
customer=vertexs(2:end,:);                                      %�ŵ꾭�Ⱥ�γ��
NV=size(VC,1);                                                  %����ʹ����Ŀ
figure
hold on;box on
title('�������ͷ���·��ͼ')
hold on;
C=linspecer(NV);
for i=1:NV
    part_seq=VC{i};            %ÿ�������������ŵ�
    len=length(part_seq);                           %ÿ�������������ŵ�����
    for j=0:len
        %��j=0ʱ���������������ĳ��������·���ϵĵ�һ���ŵ�
        if j==0
            fprintf('%s','����·��',num2str(i),'��');
            fprintf('%d->',0);
            c1=customer(part_seq(1),:);
            plot([vertexs(1,1),c1(1)],[vertexs(1,2),c1(2)],'-','color',C(i,:),'linewidth',1);
        %��j=lenʱ�������Ӹ�·���ϵ����һ���ŵ����������������
        elseif j==len
            fprintf('%d->',part_seq(j));
            fprintf('%d',0);
            fprintf('\n');
            c_len=customer(part_seq(len),:);
            plot([c_len(1),vertexs(1,1)],[c_len(2),vertexs(1,2)],'-','color',C(i,:),'linewidth',1);
        %���򣬳�����·���ϵ�ǰһ���ŵ굽���·���Ͻ��ڵ���һ���ŵ�
        else
            fprintf('%d->',part_seq(j));
            c_pre=customer(part_seq(j),:);
            c_lastone=customer(part_seq(j+1),:);
            plot([c_pre(1),c_lastone(1)],[c_pre(2),c_lastone(2)],'-','color',C(i,:),'linewidth',1);
        end
    end
end
plot(customer(:,1),customer(:,2),'ro','linewidth',1);hold on;
plot(vertexs(1,1),vertexs(1,2),'s','linewidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10);
end


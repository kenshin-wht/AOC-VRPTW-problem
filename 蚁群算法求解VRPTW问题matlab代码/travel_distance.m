
%% ����ÿ��������ʻ�ľ��룬�Լ����г���ʻ���ܾ���
%����vehicles_customer   ÿ�����������Ĺ˿�
%����dist                �������
%���sumTD               ���г���ʻ���ܾ���
%���everyTD             ÿ��������ʻ�ľ���
function [sumTD,everyTD]=travel_distance(vehicles_customer,dist)
n=size(vehicles_customer,1);                        %������
everyTD=zeros(n,1);
for i=1:n
    part_seq=vehicles_customer{i};                  %ÿ�����������Ĺ˿�
    %��������������˿ͣ���ó�������ʹ�ľ���Ϊ0
    if ~isempty(part_seq)
        everyTD(i)=part_length( part_seq,dist );
    end
end
sumTD=sum(everyTD);                                 %���г���ʻ���ܾ���


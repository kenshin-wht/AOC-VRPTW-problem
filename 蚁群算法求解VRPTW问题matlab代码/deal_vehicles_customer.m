
%% ����vehicles_customer�����final_vehicles_customer����vehicles_customer�пյ������Ƴ�
%���룺vehicles_customer        ÿ�����������Ĺ˿�
%�����final_vehicles_customer  ɾ�������飬������vehicles_customer
function [ final_vehicles_customer,vehicles_used ] = deal_vehicles_customer( vehicles_customer )
vecnum=size(vehicles_customer,1);               %������
final_vehicles_customer={};                     %������vehicles_customer
count=1;                                        %������
for i=1:vecnum
    par_seq=vehicles_customer{i};               %ÿ�����������Ĺ˿�
    %����������������˿͵�������Ϊ0�������������Ĺ˿�������ӵ�final_vehicles_customer��
    if ~isempty(par_seq)                        
        final_vehicles_customer{count}=par_seq;
        count=count+1;
    end
end
%% Ϊ�����׿������������ɵ�1�ж��е�final_vehicles_customerת���ˣ���ɶ���1�е���
final_vehicles_customer=final_vehicles_customer';       
vehicles_used=size(final_vehicles_customer,1);              %��ʹ�õĳ�����
end


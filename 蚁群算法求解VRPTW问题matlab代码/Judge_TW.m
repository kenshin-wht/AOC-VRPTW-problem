%
%      @���ߣ�����390
%      @΢�Ź��ںţ��Ż��㷨������
%
%% �ж��Ƿ�Υ��ʱ�䴰Լ����0����Υ����1����Υ��
%����vehicles_customer��       ÿ�����������Ĺ˿�
%����bsv��                     ÿ��������·�����ڸ����㿪ʼ�����ʱ�䣬�����㷵�ؼ�������ʱ��
%����b��                       �˿�ʱ�䴰����ʱ��[a[i],b[i]]
%����L��                       ��������ʱ�䴰����ʱ��
%���violate_TW��              ��Υ��ʱ�䴰Լ����Ԫ������
function violate_TW=Judge_TW(vehicles_customer,bsv,b,L)
NV=size(vehicles_customer,1);               %���ó�������
violate_TW=bsv;
for i=1:NV
    route=vehicles_customer{i};
    bs=bsv{i};
    l_bs=length(bsv{i});
    for j=1:l_bs-1
        if bs(j)<=b(route(j))
            violate_TW{i}(j)=0;
        else
            violate_TW{i}(j)=1;
        end
    end
    if bs(end)<=L
        violate_TW{i}(end)=0;
    else
        violate_TW{i}(end)=1;
    end
end
end
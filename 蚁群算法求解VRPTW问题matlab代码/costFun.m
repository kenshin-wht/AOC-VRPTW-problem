
%% ����һ�����ͷ������ܳɱ�=cd*����ʹ����Ŀ+ct*������ʻ�ܾ���
%����VC��          ���ͷ���
%����dist��        �������
%���cost��        �ܳɱ�
%���NV��          ����ʹ����Ŀ
%�ڴ˴���������ĩ�����ͷ�ʽ����ȷ��������ĩ�����ͷ�ʽ
function [cost,NV,TD]=costFun(VC,dist)
NV=size(VC,1);                      %����ʹ����Ŀ
TD=travel_distance(VC,dist);        %��ʻ�ܾ���
cost=1000*NV+1*TD;
end
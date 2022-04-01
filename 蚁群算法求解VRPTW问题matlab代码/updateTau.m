
%% ����·��R����Ϣ��
%����Tau��                 ��Ϣ�ؾ���
%����bestR��               ·��
%����rho��                 ��Ϣ�ػӷ�����
%����Q��                   ������Ϣ��Ũ�ȵĳ���
%����cap��                 ���������
%����demands��             ������
%����a��                   �˿�ʱ�䴰��ʼʱ��[a[i],b[i]]
%����b��                   �˿�ʱ�䴰����ʱ��[a[i],b[i]]
%����L��                   ��������ʱ�䴰����ʱ��
%����s��                   �ͻ���ķ���ʱ��
%����dist��                �������
%���Tau��                 ���º����Ϣ�ؾ���
function Tau=updateTau(Tau,bestR,rho,Q,cap,demands,a,b,L,s,dist)
[bestVC,bestNV,bestTD]=decode(bestR,cap,demands,a,b,L,s,dist);
cusnum=size(dist,1)-1;
Delta_Tau=zeros(cusnum+1,cusnum+1);
delta_Tau=Q/bestTD;
for j=1:cusnum-1
    Delta_Tau(bestR(j),bestR(j+1))=Delta_Tau(bestR(j),bestR(j+1))+delta_Tau;
    Tau(bestR(j),bestR(j+1))=rho*Tau(bestR(j),bestR(j+1))+Delta_Tau(bestR(j),bestR(j+1));
end
Delta_Tau(bestR(cusnum),1)=Delta_Tau(bestR(cusnum),1)+delta_Tau;
Tau(bestR(cusnum),1)=rho*Tau(bestR(cusnum),1)+Delta_Tau(bestR(cusnum),1);
end



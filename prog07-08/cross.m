function off=cross(parent,croprop)
[pops,numvar]=size(parent);

for i=1:2:pops
   %�����m�������Č������邩������
    if croprop > rand %�����̊m�������������藧�����ꍇ��������
        r = randi([1 numvar],1,1);%��_�����ɂ������������ꏊ������
        offs(i,1:r)         = parent(i,1:r);
        offs(i,r+1:numvar)  = parent(i+1,r+1:numvar);
        offs(i+1,1:r)       = parent(i+1,1:r);
        offs(i+1,r+1:numvar)= parent(i,r+1:numvar);
    else
        offs(i,:)  = parent(i,:);
        offs(i+1,:)= parent(i,:);
    end
end
off=offs;%�q����߂�l�Ƃ��Ė߂�
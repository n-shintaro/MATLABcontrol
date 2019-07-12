function off=cross(parent,croprop)
[pops,numvar]=size(parent);

for i=1:2:pops
   %交叉確率を見て交叉するかを決定
    if croprop > rand %交差の確率＞乱数が成り立った場合交差する
        r = randi([1 numvar],1,1);%一点交叉における交叉する場所を決定
        offs(i,1:r)         = parent(i,1:r);
        offs(i,r+1:numvar)  = parent(i+1,r+1:numvar);
        offs(i+1,1:r)       = parent(i+1,1:r);
        offs(i+1,r+1:numvar)= parent(i,r+1:numvar);
    else
        offs(i,:)  = parent(i,:);
        offs(i+1,:)= parent(i,:);
    end
end
off=offs;%子孫を戻り値として戻す
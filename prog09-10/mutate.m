% mutate.m
%突然変異
function d=mutate(offs,mutprop)%uniform mutation.
global  bound rng
[pops,numvar]=size(offs);
%突然変異する数
mut=round(mutprop*pops*numvar)
%for i=1:pops 9＆10行目or １１行目どちらかをコメントアウト
 %       if mutprop>rand
for i=1:mut
    x=ceil(rand*pops)
    y=ceil(rand*numvar)
    offs(x,y)=bound(y,1)+rand*rng(y);
end
d=offs
%突然変異された個体を含む個体群
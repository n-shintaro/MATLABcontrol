% mutate.m
%�ˑR�ψ�
function d=mutate(offs,mutprop)%uniform mutation.
global  bound rng
[pops,numvar]=size(offs);
%�ˑR�ψق��鐔
mut=round(mutprop*pops*numvar)
%for i=1:pops 9��10�s��or �P�P�s�ڂǂ��炩���R�����g�A�E�g
 %       if mutprop>rand
for i=1:mut
    x=ceil(rand*pops)
    y=ceil(rand*numvar)
    offs(x,y)=bound(y,1)+rand*rng(y);
end
d=offs
%�ˑR�ψق��ꂽ�̂��܂ތ̌Q
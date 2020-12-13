function ilerifcn(teta1,teta2,teta4,teta5,teta6, d3)

%________________Tanýmlamalar__________________
global T06
h1=3;
d4=0.5;
I1=1;
I2=1;
% d3=1;
% teta1 = 0;
% teta2 = 0;
% teta4 = 0;
% teta5 = 0;
% teta6 = 0;
renk=['b' 'g' 'r' 'c' 'm' 'y' 'b'];

%_______Burda çizimde gözükmesi için bir eklem ekledim
alpha = [0 0 180 0 0 -90 90] ;
a = [0 I1 I2 0 0 0 0];
d = [h1 0 0 d3 d4 0.3 0.3]; % uç iþlevcinin belli olmasý icin 0.3 kaçýklýk atadým. 0 verilebilir
t = [teta1 teta2 0 0 teta4 teta5 teta6];

%________________Transfer matrixlerinin hesaplanmasý ( Structure yapýsý
%________________var. .m ile biten normal ileri yol matrisi________________
for i=1:7
       T(i).m = [cosd(t(i)) -sind(t(i)) 0 a(i); sind(t(i))*cosd(alpha(i)) cosd(t(i))*cosd(alpha(i)) -sind(alpha(i)) -sind(alpha(i))*d(i); sind(t(i))*sind(alpha(i)) cosd(t(i))*sind(alpha(i)) cosd(alpha(i)) cosd(alpha(i))*d(i); 0 0 0 1];     
end

%_______________ Ýleri yol matrislerinin çarpýmlarý. Structure da .p ile kayýtlý__________
T(1).p=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]; %çizim için 0 konumda gerekli
T(2).p=T(1).m;
T(3).p=T(1).m*T(2).m;
T(4).p=T(1).m*T(2).m*T(3).m;
T(5).p=T(1).m*T(2).m*T(3).m*T(4).m;
T(6).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m;
T(7).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m*T(6).m;
T(8).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m*T(6).m*T(7).m;
T06=T(8).p; %bu aslýnda önceki t6 ya eþittir

%________________Sonunda döngüde 3d çizim. ________
for i=1:7
    plot3( [T(i).p(1,4) T(i+1).p(1,4)], [T(i).p(2,4) T(i+1).p(2,4)], [T(i).p(3,4) T(i+1).p(3,4)], 'LineWidth',3, 'Color', renk(i))
    hold on;
end
grid;
axis([-3 3 -3 3 0 4]);
hold off;

end
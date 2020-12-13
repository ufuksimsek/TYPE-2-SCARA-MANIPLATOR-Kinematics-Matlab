%function tersfcn(px , py , pz , alfa , beta , gamma, psbt, kaciklik)


%________________Tanýmlamalar__________________
global T06 
h1=540;
h3=875;
h5=610;
h8=350;
l2=145;


syms teta1 teta2 teta3 teta4 teta5 teta6 teta7;
renk=['b' 'g' 'r' 'c' 'm' 'y' 'b' 'r'];

alpha = [0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0]; % Burda çizdirmedeki fazla eklemi hýzlý olmasý açýsýndan eklemedim
a     = [0 l2 0 0 0 0 0 0];
d     = [h1 0 h3 0 h5 0 0 h8]; % Kaçýklýðý burda verirsem denklemler deðiþir
t11   = [teta1 teta2+pi/2 teta3 teta4 teta5 teta6 teta7 0];


%________________Transfer matrixlerinin hesaplanmasý ( Structure yapýsý
%________________var. .m ile biten normal ileri yol matrisi________________
for i=1:6
       T(i).m = [cos(t11(i))                -sin(t11(i))                 0                a(i); 
                 sin(t11(i))*cosd(alpha(i))  cos(t11(i))*cosd(alpha(i)) -sind(alpha(i))  -sind(alpha(i))*d(i);
                 sin(t11(i))*sind(alpha(i))  cos(t11(i))*sind(alpha(i))  cosd(alpha(i))   cosd(alpha(i))*d(i);
                 0                           0                           0                1];     
end

%_______________ Ýleri yol matrislerinin çarpýmlarý. Structure da .p ile kayýtlý__________
T(01).p=T(1).m;
T(02).p=T(1).m*T(2).m;
T(03).p=T(1).m*T(2).m*T(3).m;
T(04).p=T(1).m*T(2).m*T(3).m*T(4).m;
T(05).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m;
T(06).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m*T(6).m;
T06=T(06).p;

%% Dönüþüm matrisinin saf hali rotasyonlarýn bulunmasý için uç iþlevcinin açýsý girilmelidir
r11 = cosd(alfa)*cosd(beta); 
r12 = cosd(alfa)*sind(beta)*sind(gamma)-sind(alfa)*sind(gamma); 
r13 = cosd(alfa)*sind(beta)*cosd(gamma)+sind(alfa)*sind(gamma);
r21 = sind(alfa)*cosd(beta);
r22 = sind(alfa)*sind(beta)*sind(gamma)+cosd(alfa)*cosd(gamma); 
r23 = sind(alfa)*sind(beta)*cosd(gamma)-cosd(alfa)*sind(gamma);
r31 = -sind(beta); 
r32 = cosd(beta)*sind(gamma); 
r33 = cosd(beta)*cosd(gamma);

T06s = [r11 r12 r13 px; 
        r21 r22 r23 py; 
        r31 r32 r33 pz; 
        0   0   0   1];

%__________ Birkaç ters alýp karþýya atýlmýþ denlemin oluþturulmasý __________
T(1).im = inv(T(1).m);
T(2).im = inv(T(2).m);
T(3).im = inv(T(3).m);
% T(4).im = inv(T(4).m);
% T(5).im = inv(T(5).m);

left1=T(1).im*T06s;
left2=T(2).im*left1;
left3=T(3).im*left2;
% left4=T(4).im*left3;
% left5=T(5).im*left4;

T(16).p=T(2).m*T(3).m*T(4).m*T(5).m*T(6).m;
T(26).p=T(3).m*T(4).m*T(5).m*T(6).m;
T(36).p=T(4).m*T(5).m*T(6).m;
% T(46).p=T(5).m*T(6).m;
% T(56).p=T(6).m;


eqv1 = simplify(T(16).p(1:3,4)-left1(1:3,4));
% eqv2 = simplify(T(26).p(1:3,4)-left2(1:3,4))
% eqv3 = simplify(T(36).p(1:3,4)-left3(1:3,4))
% eqv4 = simplify(T(46).p(1:3,4)-left4(1:3,4))
% eqv5 = simplify(T(56).p(1:3,4)-left5(1:3,4))

d3r=solve(eqv1(3),d3); % d3 kolay bir þekilde bulunur tek olasýlýðý vardýr

[teta1r teta2r ] = solve(eqv1(1), eqv1(2), teta1, teta2);
teta1r=double(teta1r); % Teta 1 ve 2 iki olasýlýða sahip
teta2r=double(teta2r);


% eqv31 = simplify(T(36).p(1:3,1)-left3(1:3,1))
eqv32 = (T(36).p(1:3,2)-left3(1:3,2));
eqv32 = subs(eqv32,{'teta1' , 'teta2', 'd3'},{teta1r(psbt), teta2r(psbt), d3r});
eqv33 = (T(36).p(1:3,3)-left3(1:3,3));
eqv33 = subs(eqv33,{'teta1' , 'teta2', 'd3'},{teta1r(psbt), teta2r(psbt), d3r});
% Euler bileðinin açýlarýda bulunur
[teta4r teta5r ] = solve(eqv33(1), eqv33(2), teta4, teta5);
teta4r=double(teta4r);
teta5r=double(teta5r);

eqv32 = subs(eqv32,{'teta1' , 'teta2', 'd3', 'teta4', 'teta5'},{teta1r(psbt), teta2r(psbt), d3r, teta4r(1), teta5r(1)});
[teta6r ] = solve(eqv32(1), teta6);
teta6r=double(teta6r);

%____________Bundan sonra çizdirme______________

t1=teta1r(psbt);
t2=teta2r(psbt);
t4=teta4r(1);
t5=teta5r(1);
t6=teta6r(1);

%_______Burda çizimde gözükmesi için bir eklem ekledim
alpha = [0 0 180 0 0 -90 90] ;
a = [0 I1 I2 0 0  0 0];
d = [h1 0 0 d3r d4 kaciklik kaciklik ];  % uç iþlevcinin belli olmasý icin 0.2 kaçýklýk atadým. 0 verilebilir
t11 = [t1 t2 0 0 t4 t5 t6];

%________________Transfer matrixlerinin hesaplanmasý ( Structure yapýsý
%________________var. .m ile biten normal ileri yol matrisi________________
for i=1:7
       T(i).m = [cos(t11(i)) -sin(t11(i)) 0 a(i); sin(t11(i))*cosd(alpha(i)) cos(t11(i))*cosd(alpha(i)) -sind(alpha(i)) -sind(alpha(i))*d(i); sin(t11(i))*sind(alpha(i)) cos(t11(i))*sind(alpha(i)) cosd(alpha(i)) cosd(alpha(i))*d(i); 0 0 0 1];     
end

%_______________ Ýleri yol matrislerinin çarpýmlarý. Structure da .p ile kayýtlý__________
T(01).p=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]; %çizim için 0 konumda gerekli
T(02).p=T(1).m;
T(03).p=T(1).m*T(2).m;
T(04).p=T(1).m*T(2).m*T(3).m;
T(05).p=T(1).m*T(2).m*T(3).m*T(4).m;
T(06).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m;
T(07).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m*T(6).m;
T(08).p=T(1).m*T(2).m*T(3).m*T(4).m*T(5).m*T(6).m*T(7).m;
T06=double(T(08).p) %bu aslýnda önceki t6 ya eþittir

%________________Sonunda döngüde 3d çizim. ________
    for i=1:7
        plot3( [T(i).p(1,4) T(i+1).p(1,4)], [T(i).p(2,4) T(i+1).p(2,4)], [T(i).p(3,4) T(i+1).p(3,4)], 'LineWidth',3, 'Color', renk(i))
        hold on;
    end
    hold off;
grid;
axis([-3 3 -3 3 0 4]);
%end
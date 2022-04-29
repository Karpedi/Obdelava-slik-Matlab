A=[20,100,255;255,0,80;50,100,150]; %izdelava sivinske slike 3x3 elemntov
A = repmat(A,[1,1,3]);              %za prikaz sivinske slike
image(uint8(A));                    %pretvorba v 8bit nepredznaèen foramt

%%BRANJE SLIKE LENA IZ DISKA
A = imread('lena.tiff');
figure
image(A);                           %prikaz slike

%%IZPIS RGB PARAMETROV SLIKE "LENA" 
%%A(vrstica,stolpec,kanal[R,G,B])
LENA = [A(350,100,1), A(350,100,2), A(350,100,3)]   

%%BRANJE SLIKE BABOON IZ DISKA
B = imread('baboon.tiff');
figure
image(B);

%%IZPIS RGB PARAMETROV SLIKE "BABOON"
BABOON = [B(350,100,1), B(350,100,2), B(350,100,3) ]



V = VideoReader('Holywood2-t00427-rgb.avi'); %branje posnetka

for i=0 : 1 :5               %zanka zaène z 0 in gre do 5, kjer v usakem
    video50 = readFrame(V);  %ciklu prebere 10 slik video posnetka,
    video51 = readFrame(V);  %izpiše pa zadnjih 10, torej od 50 do 60
    video52 = readFrame(V);
    video53 = readFrame(V);
    video54 = readFrame(V);
    video55 = readFrame(V);
    video56 = readFrame(V);
    video57 = readFrame(V);
    video58 = readFrame(V);
    video59 = readFrame(V);
    video60 = readFrame(V);
end;

%Za vsako zgorj dobljeno sliko izpiše vr. R,G,B kanalov
V50 = [video50(250,100,1),video50(250,100,2),video50(250,100,3)]
V51 = [video51(250,100,1),video51(250,100,2),video51(250,100,3)]
V52 = [video52(250,100,1),video52(250,100,2),video52(250,100,3)]
V53 = [video53(250,100,1),video53(250,100,2),video53(250,100,3)]
V54 = [video54(250,100,1),video54(250,100,2),video54(250,100,3)]
V55 = [video55(250,100,1),video55(250,100,2),video55(250,100,3)]
V56 = [video56(250,100,1),video56(250,100,2),video56(250,100,3)]
V57 = [video57(250,100,1),video57(250,100,2),video57(250,100,3)]
V58 = [video58(250,100,1),video58(250,100,2),video58(250,100,3)]
V59 = [video59(250,100,1),video59(250,100,2),video59(250,100,3)]
V60 = [video60(250,100,1),video60(250,100,2),video60(250,100,3)]


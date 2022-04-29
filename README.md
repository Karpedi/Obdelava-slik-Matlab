## Branje in pisanje slik ter video datotek

V tem delu smo morali najprej iz strežnika prenesti dve sliki in en video posnetek. Potem vse tri prenesene datoteke s programom Matlab preberemo. Nato za vsako sliko izpišemo vrednosti vseh treh R, G in B kanalov elementa, k ise nahaja v 350 vrstici in 100 stolpcu. Enako naredimo za slike z indeksi od 50 do 60 v video posnetku.
```
A=[20,100,255;255,0,80;50,100,150]; %izdelava sivinske slike 3x3 elemntov
A = repmat(A,[1,1,3]);              %za prikaz sivinske slike
image(uint8(A));                    %pretvorba v 8bit nepredznačen foramt
 
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
 
for i=0 : 1 :5               %zanka začne z 0 in gre do 5, kjer v usakem
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
```
## ZAPISOVANJE SLIK IN POSNETKOV, TER ENOSTAVNA ARITMETIKA
V tem delu je potrebno sliki pretvoriti v sivinski sliki, ju razširiti nazaj na 3 kanale ter shraniti nazaj na disk s pomočjo funkcije »imwrite«. Enako je potrebno narediti z video posnetkom ter rezultat shraniti v posnetek gray.avi. Za zapisovanje video posnetka naj se uporabi funkcija »VideoWrite«. 
Pri zapisu nazaj na 3 kanale je potrebno prirediti vsaki slikovni točki novo vrednost, kot kaže spodnja funkcija:
barva= {█(zelena;                    Y<100@oranžna;    100<Y<200@rdeča;                      Y>200)     ┤
Za sliki in videoposnetek naj se prikaže originalna slika/video posnetek, sivinska slika/video posnetek ter obdelana slika/video posnetek.

```
%%LENA: RGB -> GRAY
RGB_LENA = imread('lena.tiff');           %preberemo barvno sliko Lena
SI_LENA = rgb2gray(RGB_LENA);             %jo pretvorimo v sivinsko sliko 
figure
image(RGB_LENA);                          %prikažemo barvno sliko Lena
figure
imshow(SI_LENA);                          %prikažemo sivinsko sliko Lena
 
%%ustvarimo ničelno matriko primerne velikosti in tipa v katero bomo
%%shranjevali spremenjene piksle slike
SI_RGB_LENA = zeros(512,512,3,'uint8');  
 
%%s for zankama gremo po vseh stolpcih in vrsticah slike ter jih pretvorimo
%%v zeleno/oranžno/rdečo kakor zahteva naloga
for j=1 : 1 :512
    for k=1 : 1 :512
            if (SI_LENA(j,k) < 100)
            SI_RGB_LENA(j,k,2) = 255;
        elseif (SI_LENA(j,k) > 100 && SI_LENA(j,k) < 200)
            SI_RGB_LENA(j,k,1) = 255;
            SI_RGB_LENA(j,k,2) = 165;
        elseif (SI_LENA(j,k) > 200)
            SI_RGB_LENA(j,k,1) = 255;
        end
    end
    
end
figure
imshow(SI_RGB_LENA);                        %prikažemo obdelano sliko Lena
 
%%BABOON: RGB -> GRAY
RGB_BABOON = imread('baboon.tiff');
SI_BABOON = rgb2gray(RGB_BABOON);
figure
image(RGB_BABOON);
figure
imshow(SI_BABOON);
 
SI_RGB_BABOON = zeros(512,512,3,'uint8');
 
for j=1 : 1 :512
    for k=1 : 1 :512
        if (SI_BABOON(j,k) < 100)
            SI_RGB_BABOON(j,k,2) = 255;
        elseif (SI_BABOON(j,k) > 100 && SI_BABOON(j,k) < 200)
            SI_RGB_BABOON(j,k,1) = 255;
            SI_RGB_BABOON(j,k,2) = 165;
        elseif (SI_BABOON(j,k) > 200)
            SI_RGB_BABOON(j,k,1) = 255;
        end
    end
    
end
 
figure
imshow(SI_RGB_BABOON);
```
```
%VIDEO V SIVINSKI
V = VideoReader('Holywood2-t00427-rgb.avi');            %branje posnetka
%generiranje praznega posnetka, kamor bomo shranjevali sivinski posnetek
V_SI = VideoWriter('gray.avi','Uncompressed AVI');
 
open(V_SI);                     %odpremo prej generiran prazen posnetek
for i=0 : 1 :300                %s for zanko gremo po vseh Frejmih
    vmesna = readFrame(V);      %trenutni frejm shranimo v spremenljivko
    vmesna = rgb2gray(vmesna);  %shranjen frejm pretvorimo v sivinsko sl.
    writeVideo(V_SI,vmesna)     %zapišemo sivinski frejm v video posnetek
end
close(V_SI);                    %zapremo sedaj že sivinski posnetek
 
 

%VIDEO V OBDELAN  R,G,B
V = VideoReader('Holywood2-t00427-rgb.avi');         %branje posnetka
%generiranje praznega posnetka, kamor bomo shranjevali obdelani posnetek
V_SI_RGB = VideoWriter('gray_rgb.avi','Uncompressed AVI'); 
SI_RGB_VMESNA = zeros(288,656,3,'uint8');
 
open(V_SI_RGB)                  %odpremo prej generiran prazen posnetek
 
for i=0 : 1 :300                %s for zanko gremo po vseh Frejmih
    vmesna = readFrame(V);      %trenutni frejm shranimo v spremenljivko
    vmesna = rgb2gray(vmesna);  %shranjen frejm pretvorimo v sivinsko sl.
  
    
%%s for zankama po vseh stolpcih in vrsticah slike ter jih pretvorimo
%%v zeleno/oranžno/rdečo kakor zahteva naloga
    for j=1 : 1 :288
        for k=1 : 1 :656
            if (vmesna(j,k) < 100)
                SI_RGB_VMESNA(j,k,1) = 0;
                SI_RGB_VMESNA(j,k,2) = 255;
                SI_RGB_VMESNA(j,k,3) = 0;
            elseif (vmesna(j,k) > 100 && vmesna(j,k) < 200)
                SI_RGB_VMESNA(j,k,1) = 255;
                SI_RGB_VMESNA(j,k,2) = 165;
                SI_RGB_VMESNA(j,k,3) = 0;
            elseif (vmesna(j,k) > 200)
                SI_RGB_VMESNA(j,k,1) = 255;
                SI_RGB_VMESNA(j,k,2) = 0;
                SI_RGB_VMESNA(j,k,3) = 0;
            end
        end
    
    end
    
    writeVideo(V_SI_RGB,SI_RGB_VMESNA) %vsak obdelan frejm zapiše v video
end
 
close(V_SI_RGB);                       %zapremo sedaj že obdelan posnetek
```




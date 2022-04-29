%%LENA: RGB -> GRAY
RGB_LENA = imread('lena.tiff');           %preberemo barvno sliko Lena
SI_LENA = rgb2gray(RGB_LENA);             %jo pretvorimo v sivinsko sliko 
figure
image(RGB_LENA);                          %prikažemo barvno sliko Lena
figure
imshow(SI_LENA);                          %prikažemo sivinsko sliko Lena

%%ustvarimo nièelno matriko primerne velikosti in tipa v katero bomo
%%shranjevali spremenjene piksle slike
SI_RGB_LENA = zeros(512,512,3,'uint8');  
 
%%s for zankama gremo po vseh stolpcih in vrsticah slike ter jih pretvorimo
%%v zeleno/oranžno/rdeèo kakor zahteva naloga
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


%VIDEO V SIVINSKI  (%%st. frejmov = trajanje(s)*25fps)

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
V = VideoReader('Holywood2-t00427-rgb.avi');            %branje posnetka
%generiranje praznega posnetka, kamor bomo shranjevali obdelani posnetek
V_SI_RGB = VideoWriter('gray_rgb.avi','Uncompressed AVI'); 
SI_RGB_VMESNA = zeros(288,656,3,'uint8');

open(V_SI_RGB)                  %odpremo prej generiran prazen posnetek

for i=0 : 1 :300                %s for zanko gremo po vseh Frejmih
    vmesna = readFrame(V);      %trenutni frejm shranimo v spremenljivko
    vmesna = rgb2gray(vmesna);  %shranjen frejm pretvorimo v sivinsko sl.
  
    
%%s for zankama po vseh stolpcih in vrsticah slike ter jih pretvorimo
%%v zeleno/oranžno/rdeèo kakor zahteva naloga
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

close(V_SI_RGB);                      %zapremo sedaj že obdelan posnetek
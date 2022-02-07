clc;
clear;
close all;
distanceFunction = @(x,positions) distance(x,positions);
empty.kromozom.gen = [];
empty.best.kromozom = [];
empty.kromozom.distance = [];
empty.kromozom.best.distance = [];
best.distance = Inf;
empty.new.distance = [];
nKrom = 10;

%.M DOSYASININ BULUNDU�U YERE HAR�TA.JPG ATILARAK HAR�TA �ZER�NDEN �EH�RLER
%SE��LEB�L�R.
figure(1)
imshow('harita.jpg');
grid on
title('Sezgisel Algoritma ile Optimum Gezi G�zergah� Belirlenmesi ')
for i=1:8   % 8 �EH�R HAR�TA �ZER�NDEN �NPUT OLARAK KULLANICIDAN ALINIYOR.

    positions(i,:) = ginput(1);
    hold on
    plot(positions(i, 1), positions(i, 2), 'o','MarkerSize', 10)
    text(positions(i, 1), positions(i, 2), num2str(i),'FontSize', 24)
end

for i=1:nKrom % KROMOZOMLARI RASTGELE B�R �EK�LDE OLU�TUR.

kromozom(i).gen = randperm(8);
kromozom(i).distance = distanceFunction(kromozom(i).gen,positions);
    if kromozom(i).distance < best.distance
        best.distance = kromozom(i).distance;
        best.kromozom = kromozom(i).gen; 
    end    
end


for pop=1:120 % POPULASYON SAYISI (TEKRAR SAYISI)

x = randperm(nKrom); 

for j=1:nKrom/2 % �APRAZLAMA VE D�ZELTME ��LEMLER�
        temporary1 = kromozom(x(2*j-1)).gen;
        temporary2 = kromozom(x(2*j)).gen;
        kromozom(x(2*j-1)).gen([6 7 8]) = kromozom(x(2*j)).gen([6 7 8]);
        kromozom(x(2*j)).gen([6 7 8]) = temporary1([6 7 8]);
    
        for i=1:5
           for n=6:8
               u=1;
               v=1;
            if kromozom(x(2*j-1)).gen(i)== kromozom(x(2*j-1)).gen(n)
            
                for a=6:8
                      member = ismember(temporary1(a),kromozom(x(2*j-1)).gen);      
                        if (member == 0) && (u == 1)
                        
                           kromozom(x(2*j-1)).gen(i) = temporary1(a);
                                    u = 0;  
                        end
                end
            end
            
            if kromozom(x(2*j)).gen(i)== kromozom(x(2*j)).gen(n)
            
                for a=6:8
                      member = ismember(temporary2(a),kromozom(x(2*j)).gen);      
                        if (member == 0) && (v == 1)
                        
                           kromozom(x(2*j)).gen(i) = temporary2(a);
                                    v = 0;  
                        end
                end
            end                    
           end
        end      
        end
       
 for i=1:nKrom %YEN� KROZOMLAR ���N MESAFE �L��M� VE EN �Y� SONU�LARI ATAMA

kromozom(i).distance = distanceFunction(kromozom(i).gen,positions);
    if kromozom(i).distance < best.distance
        best.distance = kromozom(i).distance;
        best.kromozom = kromozom(i).gen; 
    end    
 end  
 

     
 
 for i=1:nKrom % KROZOMLARI MUTASYONA U�RATMA ��LEM�
 y = randperm(8,2);
 
 temp3 = kromozom(i).gen(y(1));
 temp4 = kromozom(i).gen(y(2));
 kromozom(i).gen(y(1)) = temp4;
 kromozom(i).gen(y(2)) = temp3;
 end
 
 
 for i=1:nKrom %YEN� KROZOMLAR ���N MESAFE �L��M� VE EN �Y� SONU�LARI ATAMA 

kromozom(i).distance = distanceFunction(kromozom(i).gen,positions);
    if kromozom(i).distance < best.distance
        best.distance = kromozom(i).distance;
        best.kromozom = kromozom(i).gen; 
    end    
 end  
       
        for i=1:7 % EN �Y� KROZOMU (ROTAYI) VE �LK KROMOZOMU GRAF�KTE G�STER�M�
        
        
        h(i).graph=plot([positions(best.kromozom(i),1) positions(best.kromozom(i+1),1)], [positions(best.kromozom(i),2) positions(best.kromozom(i+1),2)],'LineWidth',4);
     
        end
                
       
 title(['Populasyon = ' num2str(pop) ',    En �yi Yol = [' num2str(best.kromozom) '],    En �yi Mesafe = ' num2str(best.distance)])

     
 ax = gca;
ax.TitleFontSizeMultiplier = 1;
 pause(0.10)
 
    if pop ~= 120
    for i=1:7
    delete(h(i).graph);
 
    end
    end
    
    
    
end   


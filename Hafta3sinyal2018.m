%% sinyal cizdirme
plot(t,ecg_signals_noise);              %sinyalleri cizdirdim.
xlabel('t');                            %x-eksenini adlandirdim.
ylabel('ecgSignalsNoise');              %y-eksenini adlandirdim.
title('5 hastanýn EKG sinyalleri');     %grafigi adlandirdim.


%% 1.hastanin sinyali
hasta1= ecg_signals_noise(1,:)          %diger sinyallerden ayiriyorum.
figure(2)                               %yeni bir cizim sayfasi aciyor.
plot(t,hasta1)                          %1.hastanin sinyali.
title('1.hastanin gürültülü sinyali');  %grafigi adlandirdim.

a = filtfilt(num,den,hasta1) % filtreden geçen sinyal
figure (3)                   %yeni bir pencere acar.
plot(t,hasta1)
%hold on                    %grafikleri ust uste cizdirir.
plot (t,a)
title ('1.hastanýn filtreden geçirilmiþ sinyali')   %grafigi adlandirdim.
[tepe, rZaman] =  findpeaks(a,t, 'MinPeakDistance', 0.1, 'MinPeakHeight',1.6); % r tepelerini bulup rzaman vektorune yazdirir.
figure(4)                   %yeni pencere acar.
plot(t,a)                   %filtreli sinyali izdirdim.
hold on                     %grafikleri ust uste cizdirir.
plot(rZaman,tepe, '*r')     %r-tepesini belirledim yildiz sembolü ile.
b=zeros(1,length(rZaman));
bzaman=zeros(1,length(rZaman));

c=zeros(1,length(rZaman));
czaman=zeros(1,length(rZaman));
for d=1:1:length(tepe)                   % genlik degerlerini gezer.
R=tepe(d);                               % R tepesinin degeri.
count=rZaman(d)*(length(a)-1)/10 +1;     % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1;                          % sinyal degerleri icerisinde arama yapmak icin olusturuldu
buldu=0;                                 % cukur  durumunu bulur.
while count>1
    min=a(count); 
    
    if min > lastmin && buldu==0
     
        b(d)=lastmin;                               % bulunan q diziye ekle
         bzaman(d)=count/1000;
        buldu=1;
    end
    
    lastmin=min;
    count=count-1;
end 
end
for d=1:1:length(tepe)                              % genlik degerlerini gez
R=tepe(d);                                          % R tepesinin degeri
count=rZaman(d)*(length(a)-1)/10 +1;                % bu R degerinin gercek sinyaldeki indisini bulur.
lastmin = R +1;                                     % sinyal degerleri icerisinde arama yapmak icin olusturuldu.
buldu=0;                                            % cukur bulundu durumu.
while count<length(a)
   min=a(count);
   if min>lastmin && buldu==0
      c(d)=lastmin;
      czaman(d)=count/1000 -2/1000 ;
      buldu=1;
  
   end
   lastmin=min;
   count=count+1;
end
end

 plot(t,a);
 
 hold on
 plot(rZaman,tepe,'*r','MarkerFaceColor',[1 1 0])
 plot(czaman,c,'gs','MarkerFaceColor',[0 1 1])
 plot(bzaman,b,'*b','MarkerFaceColor',[1 0 0])
 title('1.hastanýn sinyalinde tepelerin bulunmasi')
 
 %% 2.hastanin sinyali
 
hasta2= ecg_signals_noise(2,:)          %diger sinyallerden ayiriyorum.
figure(5)                               %yeni bir cizim sayfasi aciyor.
plot(t,hasta2)                          %1.hastanin sinyali.
title('2.hastanin gürültülü sinyali');  %grafigi adlandirdim.

e= filtfilt(num,den,hasta2) % filtreden geçen sinyal
figure (6)                   %yeni bir pencere acar.
plot(t,hasta2)
%hold on                     %grafikleri ust uste cizdirir.
plot (t,e)
title ('2.hastanýn filtreden geçirilmiþ sinyali')   %grafigi adlandirdim.
[tepe, rZaman] =  findpeaks(e,t, 'MinPeakDistance', 0.1, 'MinPeakHeight',1.6); % r tepelerini bulup rzaman vektorune yazdirir.
figure(7)                   %yeni pencere acar.
plot(t,e)                   %filtreli sinyali izdirdim.
hold on                     %grafikleri ust uste cizdirir.
plot(rZaman,tepe, '*r')     %r-tepesini belirledim yildiz sembolü ile.
b=zeros(1,length(rZaman));
bzaman=zeros(1,length(rZaman));

c=zeros(1,length(rZaman));
czaman=zeros(1,length(rZaman));
for d=1:1:length(tepe)               %% genlik degerlerini gezer.
R=tepe(d);                           % R tepesinin degeri.
count=rZaman(d)*(length(e)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
buldu=0;                             % cukur  durumunu bulur.
while count>1
    min=e(count); 
    
    if min > lastmin && buldu==0
     
        b(d)=lastmin;                    % bulunan b diziye ekle
         bzaman(d)=count/1000;
        buldu=1;
    end
    
    lastmin=min;
    count=count-1;
end 
end
for d=1:1:length(tepe)                   % genlik degerlerini gezer.
    R=tepe(d);                           % R tepesinin degeri
    count=rZaman(d)*(length(e)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
    lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
    buldu=0;                             % cukur bulma durumu.
while count<length(e)
   min=e(count);
   if min>lastmin && buldu==0
      c(d)=lastmin;
      czaman(d)=count/1000 -2/1000 ;
      buldu=1;
  
   end
   lastmin=min;
   count=count+1;
end
end

 plot(t,e);
 
 hold on
 plot(rZaman,tepe,'*r','MarkerFaceColor',[1 1 0])
 plot(czaman,c,'gs','MarkerFaceColor',[0 1 1])
 plot(bzaman,b,'*b','MarkerFaceColor',[1 0 0])
 title('2.hastanýn sinyalinde tepelerin bulunmasi')
 
 %% 3.hastanin sinyali 
hasta3= ecg_signals_noise(3,:)          %diger sinyallerden ayiriyorum.
figure(8)                               %yeni bir cizim sayfasi aciyor.
plot(t,hasta3)                          %1.hastanin sinyali.
title('3.hastanin gürültülü sinyali');  %grafigi adlandirdim.

f = filtfilt(num,den,hasta3) % filtreden geçen sinyal
figure (6)                   %yeni bir pencere acar.
plot(t,hasta3)
%hold on                     %grafikleri ust uste cizdirir.
plot (t,f)
title ('3.hastanýn filtreden geçirilmiþ sinyali')   %grafigi adlandirdim.
[tepe, rZaman] =  findpeaks(f,t, 'MinPeakDistance', 1.1 , 'MinPeakHeight',1.6); % r tepelerini bulup rzaman vektorune yazdirir.
figure(10)                   %yeni pencere acar.
plot(t,f)                   %filtreli sinyali izdirdim.
hold on                     %grafikleri ust uste cizdirir.
plot(rZaman,tepe, '*r')     %r-tepesini belirledim yildiz sembolü ile.
b=zeros(1,length(rZaman));
bzaman=zeros(1,length(rZaman));

c=zeros(1,length(rZaman));
czaman=zeros(1,length(rZaman));
for d=1:1:length(tepe)               %% genlik degerlerini gezer.
R=tepe(d);                           % R tepesinin degeri.
count=rZaman(d)*(length(f)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
buldu=0;                             % cukur  durumunu bulur.
while count>1
    min=f(count); 
    
    if min > lastmin && buldu==0
     
        b(d)=lastmin;                    % bulunan b diziye ekle.
         bzaman(d)=count/1000;
        buldu=1;
    end
    
    lastmin=min;
    count=count-1;
end 
end
for d=1:1:length(tepe)                   % genlik degerlerini gezer.
    R=tepe(d);                           % R tepesinin degeri
    count=rZaman(d)*(length(f)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
    lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
    buldu=0;                             % cukur bulma durumu.
while count<length(f)
   min=f(count);
   if min>lastmin && buldu==0
      c(d)=lastmin;
      czaman(d)=count/1000 -2/1000 ;
      buldu=1;
  
   end
   lastmin=min;
   count=count+1;
end
end

 plot(t,f);
 
 hold on
 plot(rZaman,tepe,'*r','MarkerFaceColor',[1 1 0])
 plot(czaman,c,'gs','MarkerFaceColor',[0 1 1])
 plot(bzaman,b,'*b','MarkerFaceColor',[1 0 0])
 title('3.hastanýn sinyalinde tepelerin bulunmasi')
 
 %% 4.hastanin sinyali
 
hasta4= ecg_signals_noise(4,:)          %diger sinyallerden ayiriyorum.
figure(11)                               %yeni bir cizim sayfasi aciyor.
plot(t,hasta4)                          %1.hastanin sinyali.
title('4.hastanin gürültülü sinyali');  %grafigi adlandirdim.

g = filtfilt(num,den,hasta4) % filtreden geçen sinyal
figure (12)                   %yeni bir pencere acar.
plot(t,hasta4)
%hold on                     %grafikleri ust uste cizdirir.
plot (t,g)
title ('4.hastanýn filtreden geçirilmiþ sinyali')   %grafigi adlandirdim.
[tepe, rZaman] =  findpeaks(g,t, 'MinPeakDistance', 0.1, 'MinPeakHeight',1.6); % r tepelerini bulup rzaman vektorune yazdirir.
figure(13)                  %yeni pencere acar.
plot(t,g)                   %filtreli sinyali izdirdim.
hold on                     %grafikleri ust uste cizdirir.
plot(rZaman,tepe, '*r')     %r-tepesini belirledim yildiz sembolü ile.
b=zeros(1,length(rZaman));
bzaman=zeros(1,length(rZaman));

c=zeros(1,length(rZaman));
czaman=zeros(1,length(rZaman));
for d=1:1:length(tepe)               %% genlik degerlerini gezer.
R=tepe(d);                           % R tepesinin degeri.
count=rZaman(d)*(length(g)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
buldu=0;                             % cukur  durumunu bulur.
while count>1
    min=g(count); 
    
    if min > lastmin && buldu==0
     
        b(d)=lastmin;                     % bulunan b diziye ekle
         bzaman(d)=count/1000;
        buldu=1;
    end
    
    lastmin=min;
    count=count-1;
end 
end
for d=1:1:length(tepe)                   % genlik degerlerini gezer.
    R=tepe(d);                           % R tepesinin degeri
    count=rZaman(d)*(length(g)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
    lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
    buldu=0;                             % cukur bulma durumu.
while count<length(g)
   min=g(count);
   if min>lastmin && buldu==0
      c(d)=lastmin;
      czaman(d)=count/1000 -2/1000 ;
      buldu=1;
  
   end
   lastmin=min;
   count=count+1;
end
end

 plot(t,g);
 
 hold on
 plot(rZaman,tepe,'*r','MarkerFaceColor',[1 1 0])
 plot(czaman,c,'gs','MarkerFaceColor',[0 1 1])
 plot(bzaman,b,'*b','MarkerFaceColor',[1 0 0])
 title('4.hastanýn sinyalinde tepelerin bulunmasi')
 
 %% 5.hastanin sinyali
 
hasta5= ecg_signals_noise(5,:)          %diger sinyallerden ayiriyorum.
figure(14)                               %yeni bir cizim sayfasi aciyor.
plot(t,hasta5)                          %1.hastanin sinyali.
title('5.hastanin gürültülü sinyali');  %grafigi adlandirdim.

h = filtfilt(num,den,hasta5) % filtreden geçen sinyal
figure (15)                   %yeni bir pencere acar.
plot(t,hasta5)
%hold on                     %grafikleri ust uste cizdirir.
plot (t,h)
title ('5.hastanýn filtreden geçirilmiþ sinyali')   %grafigi adlandirdim.
[tepe, rZaman] =  findpeaks(h,t, 'MinPeakDistance', 0.5, 'MinPeakHeight',1.6); % r tepelerini bulup rzaman vektorune yazdirir.
figure(16)                  %yeni pencere acar.
plot(t,h)                   %filtreli sinyali izdirdim.
hold on                     %grafikleri ust uste cizdirir.
plot(rZaman,tepe, '*r')     %r-tepesini belirledim yildiz sembolü ile.
b=zeros(1,length(rZaman));
bzaman=zeros(1,length(rZaman));

c=zeros(1,length(rZaman));
czaman=zeros(1,length(rZaman));
for d=1:1:length(tepe)               %% genlik degerlerini gezer.
R=tepe(d);                           % R tepesinin degeri.
count=rZaman(d)*(length(h)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
buldu=0;                             % cukur  durumunu bulur.
while count>1
    min=h(count); 
    
    if min > lastmin && buldu==0
     
        b(d)=lastmin;                     % bulunan b diziye ekle
         bzaman(d)=count/1000;
        buldu=1;
    end
    
    lastmin=min;
    count=count-1;
end 
end
for d=1:1:length(tepe)                   % genlik degerlerini gezer.
    R=tepe(d);                           % R tepesinin degeri
    count=rZaman(d)*(length(h)-1)/10 +1; % bu R degerinin gercek sinyaldeki indisini bul
    lastmin = R +1;                      % sinyal degerleri icerisinde arama yapmak icin olusturuldu
    buldu=0;                             % cukur bulma durumu.
while count<length(h)
   min=h(count);
   if min>lastmin && buldu==0
      c(d)=lastmin;
      czaman(d)=count/1000 -2/1000 ;
      buldu=1;
  
   end
   lastmin=min;
   count=count+1;
end
end

 plot(t,h);
 
 hold on
 plot(rZaman,tepe,'*r','MarkerFaceColor',[1 1 0])
 plot(czaman,c,'gs','MarkerFaceColor',[0 1 1])
 plot(bzaman,b,'*b','MarkerFaceColor',[1 0 0])
 title('5.hastanýn sinyalinde tepelerin bulunmasi');
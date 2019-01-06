%% Filtre Olusturma

figure(3)
x = filtfilt(num,den,ecg_noise);    %sinyali lowpass filtresi ile filtreledim.(filtfilt faz farkýnýn onune geciyor)
plot(t,ecg_noise)                  %ecg_noise sinyalini cizdirdim.
hold on                            %gurultu ve filtreli sinyali ust uste cizdirme yapar.   
plot(t,x,'g')                      %sinyalin filtreden gecmis halini cizdirdim.burada gürültülü ve filtreli sinyal birliktedir.
title('filtreden gecen sinyal');   %grafigi adlandýrdým

%% Filtreden gecen sinyalin spektrumu
figure(4)                       %yeni bir grafik cizdirmek icin pencere acar.
y1=fft(y);
zshift=fftshift(y1);
plot(fshift,abs(zshift));       %spektrumunu alir sinyalin.
figure(5)                       %yeni bir pencere acar.
plot(fshift,abs(yshift));
hold on                         %filtreli ve filtresiz sinyalleri birlestirir.
plot(fshift, abs(zshift));      %grafikleri cizdirdim.
title('Filtreden Gecirilen Sinyalin Spektrumu')   %grafigi adlandýrdým.

%% r-tepelerinin zamanini bulma
figure(6)                         %yeni bir pencere acar.
[tepeDeger, rZaman] =findpeaks(x,t, 'MinPeakDistance', 0.1,'MinPeakHeight',0.6); %dizin olusturdum.(tepe noktalarini bulmak icin)
plot(t,x);                                                                  %filtrelenmis sinyali t zamanina göre cizdirdim.
hold on                                                                  
plot(rZaman , tepeDeger, '*r', 'markerfacecolor' ,[1 0 0])                 % grafigi cizdirerek tepeleri kirmizi bir yildiz ile belirttim.
title('r-tepelerinin bulunmasi');                                          %grafigi adlandirdim.

%%  r-tepelerinin arasindaki farki bulma 
rZamanFark = diff(rZaman) ;              %r-tepeleri arasindaki zaman farkini bulur.(diff komutu)
%toplam=sum(rzaman) %rZaman da ki farklarin toplamini bulur.(sum komutu)
ort_R_araligi = mean(rZamanFark) ; %rZamanFark'in ortalamasini bulur.

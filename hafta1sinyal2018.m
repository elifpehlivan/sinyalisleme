%% Sinyal Cizdirme
plot(t , ecg_noise )            %ecg_noise sinyalini t zamanda cizdirdim.
xlabel('t');                    %x-eksenini adlandýrdým.
ylabel('ecg_noise');            %y-eksenini adlandýrdým.
title('Gürültü Sinyali')        %grafigi adlandýrdým.

%% Spektrum Cizdirme
n = length(ecg_noise);          %sinyalin uzunlugunu belirledim.
y = fft(ecg_noise);             %spektrum.
f = ( 0: length(y)-1) ;         %sinyalin eleman sayisi kadar dizi olusturdum.
yshift = fftshift(y);           %kaydýrma yapar(fft donusumunun DC bilesenini,spektrum merkezinde toplamak icin kaydýrýr).
fshift = (-n/2 : n/2-1)*fs/n;   
figure(2)                       %yeni bir grafik cizdirmek icin pencere actým.
plot(fshift, abs(yshift))       
title('Genlik Spektrumu')
xlabel('frekans');               %x-eksenini adlandýrdým.
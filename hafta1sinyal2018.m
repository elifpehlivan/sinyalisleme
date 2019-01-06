%% Sinyal Cizdirme
plot(t , ecg_noise )            %ecg_noise sinyalini t zamanda cizdirdim.
xlabel('t');                    %x-eksenini adland�rd�m.
ylabel('ecg_noise');            %y-eksenini adland�rd�m.
title('G�r�lt� Sinyali')        %grafigi adland�rd�m.

%% Spektrum Cizdirme
n = length(ecg_noise);          %sinyalin uzunlugunu belirledim.
y = fft(ecg_noise);             %spektrum.
f = ( 0: length(y)-1) ;         %sinyalin eleman sayisi kadar dizi olusturdum.
yshift = fftshift(y);           %kayd�rma yapar(fft donusumunun DC bilesenini,spektrum merkezinde toplamak icin kayd�r�r).
fshift = (-n/2 : n/2-1)*fs/n;   
figure(2)                       %yeni bir grafik cizdirmek icin pencere act�m.
plot(fshift, abs(yshift))       
title('Genlik Spektrumu')
xlabel('frekans');               %x-eksenini adland�rd�m.
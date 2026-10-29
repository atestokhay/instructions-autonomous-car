# Otonom Araç v2 — Öğrenciler İçin Hazır Paket

Raspberry Pi 5 + LiDAR ile **duvar takibi yapan** otonom araç. Donanım ve yazılım, lise öğrencilerinin
**adım adım, kopyala-yapıştır** ile yapabileceği şekilde hazırlandı.

## ▶ ÖĞRENCİ: SADECE BUNLARI ÇALIŞTIR

**1) Kurulum** — SD karta **Ubuntu Server 24.04 LTS (64-bit)** yaz, Pi'yi aç, internete bağla. Pi'nin terminalinde:

```bash
sudo apt-get install -y git && git clone https://github.com/atestokhay/autonomous-car.v2.git && bash autonomous-car.v2/kurulum.sh
```
20–40 dk sürer, bitince `KURULUM TAMAMLANDI ✓` yazar. Sonra: `sudo reboot`.
(Yarım kalırsa aynı komutu tekrar çalıştır. Hata olursa `~/kurulum_log.txt` dosyasını öğretmene gönder.)

**2) Robotu hazırla ve çalıştır** — Pi yeniden açılınca:

```bash
bash ~/autonomous-car.v2/calistir.sh
```
Program seni **adım adım** götürür (motor, enkoder, hız ayarı, LiDAR, ölçüm, duvar takibi). Her adımda ne yapacağını
söyler, güvenlik sorar, sonucu kendisi kontrol eder, yönleri kendisi düzeltir. Kapatsan bile kaldığın adımdan devam eder.
Robot ancak bu programda, güvenlik sorusuna **evet** dedikten sonra hareket eder. Kurulum robotu hareket ettirmez.

## Donanımı kurarken
Önce robotu monte et: [`hardware/README.md`](hardware/README.md). Sorun olursa: [`hardware/docs/emergency.md`](hardware/docs/emergency.md).

## Klasörler
```
kurulum.sh            tek komutla kurulum
calistir.sh           robotu rehberli hazırlama ve çalıştırma
hardware/             montaj, kablo tablosu, ölçüm defteri, acil durum
software/             kod, ayarlar, aşama README'leri, notes/
```

## Güvenlik (kısaca)
Motor testlerinde **tekerlekler havada**, elin **güç şalterinde**. Duman/koku/ısınma → şalteri kapat.

## Durum
Yazılım simülasyonda ve 46 birim testinde doğrulandı. **Gerçek donanım ve gerçek ROS 2 üzerinde henüz denenmedi**;
ilk kullanımda her aşamanın "Bitti sayılır" kutularını işaretleyerek ilerle.

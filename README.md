# Otonom Araç v2 — Öğrenciler İçin Hazır Paket

Raspberry Pi 5 + LiDAR ile **duvar takibi yapan** otonom araç. Donanım ve yazılım, lise öğrencilerinin
**adım adım, kopyala-yapıştır** ile yapabileceği şekilde hazırlandı.

## 1) Başlamak için tek komut
SD karta **Ubuntu Server 24.04 LTS (64-bit)** yaz, Pi'yi aç, internete bağla, sonra Pi'nin terminalinde:

```bash
sudo apt-get install -y git && git clone https://github.com/atestokhay/autonomous-car-v2.git && bash autonomous-car-v2/kurulum.sh
```

20–40 dakika sürer. Bitince `KURULUM TAMAMLANDI ✓` yazar, sonra `sudo reboot`.
Yarım kalırsa aynı komutu tekrar çalıştır. Hata olursa `~/kurulum_log.txt` dosyasını öğretmene gönder.

## 2) Yol haritası
| Sıra | Ne | Nereden |
|---|---|---|
| 1 | Donanımı kur ve ölç | [`hardware/README.md`](hardware/README.md) |
| 2 | Yazılımı adım adım yap | [`OGRENCI-REHBERI.md`](OGRENCI-REHBERI.md) |
| 3 | Bir şey çalışmıyorsa | [`hardware/docs/emergency.md`](hardware/docs/emergency.md) |

Yazılım adımlarını menüyle çalıştırabilirsin: `cd ~/autonomous-car-v2/software && python3 menu.py`

## Klasörler
```
kurulum.sh            tek komutla kurulum
OGRENCI-REHBERI.md    öğrencinin ana rehberi (buradan ilerle)
hardware/             montaj, kablo tablosu, ölçüm defteri, acil durum
software/             kod, ayarlar, aşama README'leri, notes/
```

## Güvenlik (kısaca)
Motor testlerinde **tekerlekler havada**, elin **güç şalterinde**. Duman/koku/ısınma → şalteri kapat.

## Durum
Yazılım simülasyonda ve 46 birim testinde doğrulandı. **Gerçek donanım ve gerçek ROS 2 üzerinde henüz denenmedi**;
ilk kullanımda her aşamanın "Bitti sayılır" kutularını işaretleyerek ilerle.

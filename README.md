# Otonom Araç — Öğrenci Kurulumu

Raspberry Pi 5 + LiDAR ile **duvar takibi yapan** otonom araç. Kablolamadan robotu çalıştırmaya kadar her şeyi
**bir program adım adım** gösterir. Senin yapacağın sadece iki şey var.

## ▶ 1) Kurulum

1. SD karta **Ubuntu Server 24.04 LTS (64-bit)** yaz (Raspberry Pi Imager; kullanıcı adı, parola, Wi-Fi ve **SSH**'ı ayarlardan aç).
2. Pi'yi **kendi şarj adaptöründen** çalıştır, internete bağla, bilgisayardan SSH ile bağlan.
3. Pi'nin terminaline şu tek satırı yapıştır ve Enter'a bas:

```bash
sudo apt-get install -y git && git clone https://github.com/atestokhay/autonomous-car.v2.git && bash autonomous-car.v2/kurulum.sh
```

20–40 dakika sürer; pencereyi ve interneti kapatma. Bitince `KURULUM TAMAMLANDI ✓` yazar. Sonra:

```bash
sudo reboot
```

Yarım kalırsa aynı komutu tekrar çalıştır. Hata olursa `~/kurulum_log.txt` dosyasını öğretmene gönder.

## ▶ 2) Robotu hazırla

Pi yeniden açılınca terminale sadece şunu yaz:

```bash
arac
```

Program seni sırayla götürür:
1. **Kablolama:** hangi kablo nereye (pin tablosu ekranda), regülatörlerin ayarı (multimetreyle ölçtüğün değerleri kontrol eder)
2. **Testler:** motor, enkoder, hız ayarı, LiDAR (yönleri kendisi düzeltir)
3. **Ölçüm** ve **duvar takibi** (önce simülasyon, sonra robot)

Kapatsan bile kaldığın adımdan devam eder. Robot sadece güvenlik sorusuna **evet** dediğinde hareket eder.

| Komut | Ne yapar |
|---|---|
| `arac` | Rehberli kurulum ve çalıştırma |
| `arac kablo` | Pin tablosunu tekrar göster |
| `arac acil` | Acil durum ve "çalışmıyor" kontrol listesi |

## Güvenlik (kısaca)
Motor testlerinde **tekerlekler havada**, elin **güç şalterinde**. Duman, yanık kokusu, ısınma → şalteri kapat.
Yazılım simülasyonda doğrulandı; gerçek robotta ilk kez sizinle denenecek, takıldığın yerde öğretmenine yaz.

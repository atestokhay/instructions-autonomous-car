# Otonom Araç — Kurulumu

Raspberry Pi 5 + LiDAR otonom araç. Kablolama ve robotu çalıştırmaya kadar her şeyi
adım adım gösteriyor.  Yapacağın sadece iki şey var.

**Donanım:** 3S LiPo (11,1 V), TB6612FNG motor sürücü, 2 × N20 6 V enkoderli motor,
RPLIDAR S3, BNO055 IMU. Kablolama şeması:
[autonomous-car/hardware/wiring](https://github.com/atestokhay/autonomous-car/tree/main/hardware/wiring)

> **Daha önce kurduysan** (eski 4S/L298N sürümü), yukarıdaki komut yerine şunu çalıştır:
>
> ```bash
> cd ~/instructions-autonomous-car && git pull && bash kurulum.sh
> ```
>
> Kurulum yeni sürüme geçer; eski ayarlar ve `arac` ilerlemesi `~/arac_yedek_...` klasörüne
> taşınır, `arac` kablolamadan **baştan** başlar (pinler değişti).

## ▶ 1) Kurulum

1. SD karta **Ubuntu Server 24.04 LTS (64-bit)** yaz, (SD kartta varsa aynen devam) (Raspberry Pi Imager; kullanıcı adı, parola, Wi-Fi ve **SSH**'ı ayarlardan aç).
2. Pi'yi **kendi şarj adaptöründen** çalıştır, internete bağla, bilgisayardan SSH ile bağlan.
3. Pi'nin terminaline şu tek satırı yapıştır ve Enter'a bas:

```bash
sudo apt-get install -y git && git clone https://github.com/atestokhay/instructions-autonomous-car.git && bash instructions-autonomous-car/kurulum.sh
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
1. **Kablolama:** hangi kablo nereye (pin tablosu ekranda), regülatörlerin ayarı: motor buck **6,0 V**, Pi DC-DC 5 V,
   MP1584EN **5,00 V** (multimetreyle ölçtüğün değerleri kontrol eder)
2. **Testler:** motor, enkoder (tekerleği 10 tur çevirip tur başına sayımı ölçer), hız ayarı, LiDAR (yönleri kendisi düzeltir)
3. **Ölçüm** ve **duvar takibi** (önce simülasyon, sonra robot)

**Robotu önceden komple taktıysan** ilk soruya **evet** de: program bazı kabloları geçici olarak
söktürür, regülatörleri ölçtürüp ayarlatır, sonra geri taktırır. Söylediği kabloları gerçekten sök;
ayarlanmamış regülatör LiDAR'ı ve motorları yakabilir.

Kapatsan bile kaldığın adımdan devam eder. Robot sadece güvenlik sorusuna **evet** dediğinde hareket eder.

| Komut | Ne yapar |
|---|---|
| `arac` | Rehberli kurulum ve çalıştırma |
| `arac kablo` | Pin tablosunu tekrar göster |
| `arac acil` | Acil durum ve "çalışmıyor" kontrol listesi |

## Güvenlik (kısaca)
Motor testlerinde **tekerlekler havada**, elin **güç şalterinde**. Duman, yanık kokusu, ısınma → şalteri kapat.
TB6612'nin **VCC'si 3,3 V** (Pi pin 1), **VM'si 6 V** (motor buck): ikisini asla karıştırma.
3S batarya **10,5 V** altına inince şarj et.
Yazılım simülasyonda doğrulandı; gerçek robotta ilk kez sizinle denenecek, takıldığın yerde öğretmenine yaz.

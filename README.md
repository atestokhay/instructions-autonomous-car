# Otonom Araç — Kurulum

Raspberry Pi 5 + LiDAR otonom araç. Yapacağın sadece üç şey var: **kabloları şemaya göre tak**,
**kurulumu çalıştır**, **`arac` yaz**.

## ▶ 1) Kablolama

Şemadaki her bağlantıyı yap:
[**schematic.png**](https://github.com/atestokhay/autonomous-car/blob/main/hardware/wiring/schematic.png)

**Donanım:** 3S LiPo (11,1 V) · 10 A sigorta · ana şalter · XL4015 5 A buck (motor, **6,0 V**) ·
USB-C DC-DC (Pi, 5,1 V) · MP1584EN (LiDAR, **5,0 V**) · TB6612FNG · 2 × JGA12-N20B 6 V 300 RPM ·
RPLIDAR S3 · BNO055 · Raspberry Pi 5.

Bataryayı ilk kez takmadan önce regülatörlerin çıkışını **yük bağlı değilken** multimetreyle ayarla:
XL4015 → 6,0 V, MP1584EN → 5,0 V. (Yeni XL4015 ayarsızken girişteki 12 V'u aynen çıkışa verir.)

## ▶ 2) Kurulum

1. SD karta **Ubuntu Server 24.04 LTS (64-bit)** yaz (Raspberry Pi Imager; kullanıcı adı, parola, Wi-Fi ve **SSH**'ı ayarlardan aç).
2. Pi'yi aç, internete bağla, bilgisayardan SSH ile bağlan.
3. Pi'nin terminaline şu tek satırı yapıştır ve Enter'a bas:

```bash
sudo apt-get install -y git && git clone https://github.com/atestokhay/instructions-autonomous-car.git && bash instructions-autonomous-car/kurulum.sh
```

20–40 dakika sürer. Bitince `KURULUM TAMAMLANDI ✓` yazar. Sonra:

```bash
sudo reboot
```

**Daha önce kurduysan** yukarıdaki komut yerine:

```bash
cd ~/instructions-autonomous-car && git pull && bash kurulum.sh
```

Yarım kalırsa aynı komutu tekrar çalıştır. Hata olursa `~/kurulum_log.txt` dosyasını öğretmene gönder.

## ▶ 3) Çalıştır

Robotu **yere** koy: etrafında ~1 m boş yer, **sağ tarafında bir duvar** olsun. Terminale:

```bash
arac
```

Program soru sormaz. İlk seferde birkaç dakika kendini ölçer (motor ve enkoder yönleri, hız,
PID ayarı, LiDAR'ın önü; robot bu sırada yerinde döner ve kısa süre ileri gider), sonra sağdaki duvarı
**tam hızla** takip etmeye başlar. Durdurmak için `Ctrl+C`. Sonraki seferlerde doğrudan duvar takibi başlar.

| Komut | Ne yapar |
|---|---|
| `arac` | Ölç (gerekirse) ve duvar takibine çık |
| `arac sifirla` | Ölçümleri sil; sonraki `arac` baştan ölçer (kablo/motor değiştiyse) |
| `arac acil` | "Çalışmıyor" kontrol listesi |

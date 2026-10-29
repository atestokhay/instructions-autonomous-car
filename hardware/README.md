# Donanım — Basit Montaj Rehberi

Bu klasör aracı **güvenle** kurmanı anlatır. Sırayla yap, her adımda `docs/test_sheet.md` defterine **ölçtüğün sayıyı** yaz.
Sorun olursa: [`docs/emergency.md`](docs/emergency.md).

> ⚠️ **Üç kural:** (1) Her ölçüm ve bağlantıyı **bataryayı ÇIKARIP** yap. (2) İlk çalıştırmada **tekerlekler havada**,
> elin **güç şalterinde**. (3) Duman, yanık kokusu veya aşırı sıcak = **şalteri kapat**, sonra düşün.

## Parçalar
| Parça | Adet | Ne işe yarar |
|---|---:|---|
| Raspberry Pi 5 | 1 | Beyin |
| JSumo 12 V enkoderli motor | 2 | Tekerlekler + adım sayacı |
| L298N motor sürücü | 2 | Her motora bir tane |
| RPLIDAR S3 + USB adaptörü | 1 | Göz (çevreyi ölçer) |
| 4S LiPo batarya (14,8 V) | 1 | Güç kaynağı |
| 12 V ayarlı buck regülatör (≥4 A) | 1 | Batarya → motor gücü |
| 5 V USB-C DC-DC dönüştürücü | 1 | Batarya → Pi gücü |
| MP1584EN buck | 1 | Batarya → LiDAR gücü (5 V) |
| Şalter + 7,5–10 A sigorta | 1'er | Güç kesme ve koruma |

## Neden bataryayı doğrudan bağlamıyoruz?
Batarya dolu iken **16,8 V** verir; motorlar **12 V** içindir. Aşırı gerilim motoru ve sürücüyü yakar. Bu yüzden her kola
kendi regülatörü var. **PWM bunu düzeltmez.**

## Güç şeması
```
Batarya (+) → ŞALTER → SİGORTA → [Güç dağıtım +]
                                    ├─→ Motor regülatörü (12 V) ─→ Sol L298N ve Sağ L298N
                                    ├─→ Pi DC-DC (5 V)          ─→ Raspberry Pi (USB-C)
                                    └─→ MP1584EN (5 V)          ─→ LiDAR adaptörünün HARİCİ güç girişi
Batarya (−) → [Güç dağıtım GND] → hepsinin GND'si → ortak GND noktası
```
LiDAR **Pi'den güç almaz**; USB sadece veri taşır.

## Montaj sırası (hepsi bataryasız başlar)
1. **Kablolama:** [`BAGLANTILAR.md`](BAGLANTILAR.md) tablosuna göre kabloları bağla. Her kablonun iki ucuna etiket yapıştır.
2. **Kısa devre testi (bip testi):** Multimetre bip moduna al. Güç dağıtım (+) ile GND arasında **bip OLMAMALI**. Bip varsa dur, kabloları tek tek kontrol et.
3. **Regülatörleri ayarla:** Batarya takılı, motorlar/Pi/LiDAR **bağlı değilken** çıkış gerilimlerini küçük tornavidayla ayarla ve ölç:
   | Regülatör | Ayarla |
   |---|---|
   | Motor | **12,0 V** (en fazla 12,3) |
   | Pi | **5,0–5,2 V** |
   | MP1584EN (LiDAR) | **5,00 V** (4,9–5,2 arası) |
   Şalteri kapat, ayarlı çıkışları yerlerine bağla.
4. **Pi'yi aç:** Sadece Pi bağlıyken aç, kararlı çalışıyor mu bak. Sonra kurulum ve `bash calistir.sh` ([`../README.md`](../README.md)).
5. **Motorlar:** Tekerlekler **havada**. Yazılım adımlarını (Adım 2–4) rehberden izle.
6. **LiDAR:** MP1584EN çıkışını yük altında ölç (**4,9–5,2 V** kalmalı), sonra USB'yi Pi'ye tak.
7. **Hepsi birlikte:** 10 dakika çalıştır; reset, ısınma veya kablo gevşemesi olmamalı.

## Jumper ve enkoder (önemli, sık hata yapılır)
| Konu | Ne yap |
|---|---|
| L298N **ENA** jumper'ı | **Çıkar** (yoksa motor hep tam hızda gider) |
| L298N **5V-EN** jumper'ı | **Takılı bırak.** Kartın "5V" terminaline hiçbir şey bağlama |
| Enkoder güç (VCC) | Pi'nin **3,3 V** pinine (pin 1 ve 17). **5 V'a ASLA** — Pi'nin pini yanar |
| Enkoder GND | Ortak GND |
| Enkoder kontrol | Tekerleği elle çevirirken A/B pininde multimetre **3,3 V'u geçmemeli** |

## Batarya kuralları
- Çalışırken toplam gerilim **14,0 V altına inince** durdur ve şarj et (altında motor regülatörü 12 V veremez).
- **13,2 V altına asla inme.** Gerilim alarmı (buzzer) takman önerilir.
- Şişmiş, ezilmiş veya çok ısınan bataryayı kullanma. Sadece LiPo dengeli şarj cihazıyla, gözetimde şarj et.

## Dosyalar
| Dosya | İçerik |
|---|---|
| [`BAGLANTILAR.md`](BAGLANTILAR.md) | Hangi kablo nereye (pin tablosu) |
| [`docs/test_sheet.md`](docs/test_sheet.md) | Ölçüm defteri |
| [`docs/emergency.md`](docs/emergency.md) | Acil durum + "çalışmıyor" sıralı kontrol |
| [`wiring/netlist.txt`](wiring/netlist.txt), [`wiring/schematic.fzz`](wiring/schematic.fzz) | Ayrıntılı bağlantı listesi ve Fritzing şeması |

# Hangi kablo nereye?

BCM = yazılımdaki numara, Pin = Pi üzerindeki fiziksel pin sırası (40 pinli başlık). Kabloları **Pin** sütununa göre tak.
Bu tablo `~/arac/software/config/pins.yaml` ile birebir aynıdır. Biri değişirse ikisi de değişmeli.

## Sol motor (Sol L298N)
| L298N | Pi (BCM) | Pi (Pin) |
|---|---|---|
| ENA | GPIO12 | 32 |
| IN1 | GPIO5 | 29 |
| IN2 | GPIO6 | 31 |
| GND | GND | 6 |
Motor kabloları → L298N **OUT1** ve **OUT2**.

## Sağ motor (Sağ L298N)
| L298N | Pi (BCM) | Pi (Pin) |
|---|---|---|
| ENA | GPIO13 | 33 |
| IN1 | GPIO16 | 36 |
| IN2 | GPIO20 | 38 |
| GND | GND | 9 |
Motor kabloları → L298N **OUT1** ve **OUT2**.

## Enkoderler
| Sinyal | Pi (BCM) | Pi (Pin) |
|---|---|---|
| Sol enkoder A | GPIO17 | 11 |
| Sol enkoder B | GPIO27 | 13 |
| Sağ enkoder A | GPIO22 | 15 |
| Sağ enkoder B | GPIO23 | 16 |
| Sol enkoder VCC | **3,3 V** | **1** |
| Sağ enkoder VCC | **3,3 V** | **17** |
| Enkoder GND (ikisi) | GND | 14 ve 20 (ya da ortak GND) |

## Güç tarafı (özet)
| Nereden | Nereye |
|---|---|
| Motor regülatörü çıkışı (12 V) | Sol ve sağ L298N **+12 V** girişi |
| Pi DC-DC çıkışı (5 V) | Pi USB-C güç girişi |
| MP1584EN çıkışı (5 V) | LiDAR adaptörü **harici 5 V** girişi |
| Tüm GND'ler | Ortak GND noktası (kalın kablolu) |

LiDAR USB kablosu → Pi USB portu (**sadece veri**). Pi'ye aynı anda **iki** güç kaynağı bağlama.
Motor akımı Pi'nin ince GND kablolarından geçmemeli: motor GND'si güç dağıtımına kalın kabloyla dönsün.

## Bağlandıktan sonra
Kablo tablosuyla gerçek bağlantıyı **kişi kişi karşılaştır** (biri okur, diğeri bakar), sonra bip testini yap (README adım 2).

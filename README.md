# BMÜ329 Veri Tabanı Sistemleri Dersi Dönem Projesi Gereksinimleri ve E-R Diyagramı

## Proje Başlığı: Endüstriyel Otomasyon ve Haberleşme Ürünleri Yönetim Sistemi

**Proje Ekibindeki Kişiler:**
- **220260020** - Muhammed Salih Üstün
- **220260054** - Emre Gülek
- **220260092** - Muhammed Gökhan Şentürk

---

## Endüstriyel Otomasyon ve Haberleşme Ürünleri Yönetim Sistemi

## 1. Cihaz ve Kategori Yönetimi

### Categories (Kategoriler)
Cihazların ait olduğu ana kategorileri tanımlamak için kullanılır. Her kategorinin:
- **CategoryID**: Benzersiz kimlik numarası
- **Adı**: Kategorinin adı
- **Tanımı**: İsteğe bağlı açıklama bilgisi bulunur.

### DeviceSeries (Cihaz Serileri)
Cihazlar, bir kategoriye ait belirli serilere ayrılır. Bu tabloda:
- **SeriesID**: Serinin benzersiz kimliği
- **Adı**: Seri adı
- **Açıklama**: Seriye dair açıklama bilgileri bulunur.
- **CategoryID**: Kategorilerle bağlantılıdır.

### Devices (Cihazlar)
Sistemde yer alan tüm cihazları tanımlar. Her cihaz:
- **SeriesID**: İlgili seriyle ilişkilidir.
- **Adı**: Cihazın adı
- **Özellikleri**: Teknik ve donanımsal özellikler
- **Üretim Tarihi**: Cihazın üretim tarihi
- **Açıklama**: Detaylı açıklama bilgilerini içerir.

---

## 2. Kullanıcı ve Destek Yönetimi

### Users (Kullanıcılar)
Sistemdeki tüm kullanıcıları temsil eder. Kullanıcı bilgileri şunlardır:
- **Kullanıcı Adı**
- **E-posta**
- **Şifre**
- **Son Giriş Tarihi**

### CustomerSupport (Müşteri Destek)
Kullanıcıların sistemde oluşturduğu destek kayıtlarını tutar. Her kayıt:
- **UserID**: Destek talebini oluşturan kullanıcı
- **Destek Tarihi**: Talebin tarihi
- **Talep Açıklaması**: Destek isteğine dair detayları içerir.

### CustomerSupportTechnician (Destek Teknisyenleri)
Destek taleplerini yöneten teknisyenlerin bilgilerini içerir. Bu bilgiler:
- **SupportID**: İlgili destek kaydı
- **Teknisyen Adı**
- **Pozisyonu**
- **Tecrübesi** gibi ayrıntılardır.

---

## 3. Cihaz Teknik ve Donanım Yetenekleri

### DeviceFeatures (Cihaz Özellikleri)
Cihazların yazılım ve donanım yeteneklerini belirtir. Özellikler arasında:
- **IEC 61131-3 Standardına Uygunluk**
- **IoT Desteği**
- **USB Programlama** gibi bilgiler bulunur.

### MotionControlFunctions (Hareket Kontrol Fonksiyonları)
Cihazların hareket kontrol yeteneklerini içerir:
- **Hızlı Sayıcı Girişi**
- **PWM Çıkışı** gibi bilgiler burada tanımlanır.

### Programming (Programlama)
Cihazların desteklediği:
- **Programlama Dilleri**
- **Editör Türleri**
- **USB Port Bilgileri** bu tabloda bulunur.

### LEDSignals (LED Sinyalleri)
Cihaz üzerindeki LED sinyallerini belirtir:
- **Güç LED’i**
- **Haberleşme LED’leri** gibi durumlar tanımlanır.

### ElectricalWiring (Elektrik Tesisatı)
Cihazların IO ve güç bağlantılarıyla ilgili bilgileri saklar.

---

## 4. Haberleşme ve Protokol Yönetimi

### CommunicationProtocols (Haberleşme Protokolleri)
Cihazların desteklediği ana protokolleri içerir:
- **Modbus**
- **TCP/IP**
- **IoT Protokolleri**

### CommunicationPorts (Haberleşme Portları)
Cihazların:
- **Ethernet Portları**
- **GSM Haberleşme Portları** gibi bilgilerini içerir.

### GSMFunctions (GSM Fonksiyonları)
GSM ile ilgili özellikler:
- **SMS Gönderim/Alımı**
- **DTMF Aramaları** gibi fonksiyonları içerir.

---

## 5. Garanti ve Sertifikasyon

### Warranty_Certification (Garanti ve Sertifikasyon)
Cihazların garanti ve sertifikasyon bilgilerini içerir:
- **Garanti Süresi**
- **IEC Standartları** gibi detaylar yer alır.

---

## 6. Sipariş Yönetimi

### Orders (Siparişler)
Kullanıcıların verdiği siparişleri saklar:
- **Sipariş Durumu**
- **Toplam Tutar**
- **Oluşturulma Tarihi** bilgilerini içerir.

### OrderDetails (Sipariş Detayları)
Siparişlerde yer alan cihazların bilgilerini içerir:
- **Cihaz Adedi**
- **Sipariş ile Cihazların Bağlantısı**

---

## 7. Çözüm ve Otomasyon Yönetimi

### Solutions (Çözümler)
Cihazlarla ilgili geliştirilen çözümleri içerir:
- **Cihaz İlişkisi**
- **Oluşturulma Tarihi** bilgilerini saklar.

---

# Veritabanı 1-N (Birçok) İlişkileri

## Categories - DeviceSeries
- **İlişki Türü**: 1-N (Bir kategori birden fazla cihaz serisi içerebilir)
- **Açıklama**: Her kategori, birden fazla cihaz serisini kapsar.
- **Anahtarlar**: 
  - Categories (1) → DeviceSeries (N)

---

## DeviceSeries - Devices
- **İlişki Türü**: 1-N (Bir cihaz serisi birden fazla cihaz içerebilir)
- **Açıklama**: Her cihaz serisi, birden fazla cihazı kapsar.
- **Anahtarlar**: 
  - DeviceSeries (1) → Devices (N)

---

## Users - Orders
- **İlişki Türü**: 1-N (Bir kullanıcı birden fazla sipariş verebilir)
- **Açıklama**: Her kullanıcı, bir veya daha fazla sipariş oluşturabilir.
- **Anahtarlar**: 
  - Users (1) → Orders (N)

---

## Users - CustomerSupport
- **İlişki Türü**: 1-N (Bir kullanıcı birden fazla destek talebi oluşturabilir)
- **Açıklama**: Her kullanıcı, bir veya daha fazla destek talebi oluşturabilir.
- **Anahtarlar**: 
  - Users (1) → CustomerSupport (N)

---

## Orders - OrderDetails
- **İlişki Türü**: 1-N (Bir sipariş birden fazla sipariş detayı içerebilir)
- **Açıklama**: Bir sipariş, bir veya daha fazla cihaz detayını içerebilir.
- **Anahtarlar**: 
  - Orders (1) → OrderDetails (N)

---

## Devices - OrderDetails
- **İlişki Türü**: 1-N (Bir cihaz birden fazla sipariş detayında yer alabilir)
- **Açıklama**: Her cihaz, birden fazla sipariş detayında yer alabilir.
- **Anahtarlar**: 
  - Devices (1) → OrderDetails (N)

---

## CustomerSupport - CustomerSupportTechnician
- **İlişki Türü**: 1-N (Bir destek talebi birden fazla teknisyen tarafından işlenebilir)
- **Açıklama**: Bir destek talebi, bir veya daha fazla teknisyen tarafından ele alınabilir.
- **Anahtarlar**: 
  - CustomerSupport (1) → CustomerSupportTechnician (N)

---

# Veritabanı N-N (Çoktan Çoğa) İlişkisi

## Devices ↔ Orders (OrderDetails aracılığıyla)
- **Açıklama**: Bir cihaz birden fazla siparişte yer alabilir ve bir sipariş birden fazla cihazı içerebilir.
- **İlişki Türü**: N-N (Çoktan Çoğa)
  - **Detaylar**: 
    - Bir cihaz, birden fazla siparişin parçası olabilir (örneğin, birden fazla müşteri aynı cihazı sipariş edebilir).
    - Bir sipariş, birden fazla cihazı içerebilir (örneğin, bir müşteri tek bir siparişte birden fazla cihaz alabilir).
  - Bu ilişki, **OrderDetails** tablosu aracılığıyla yönetilir. OrderDetails tablosu, Devices ve Orders tablolarını birleştiren bir köprü (junction) tablo görevi görür.
- **Anahtarlar**:
  - Devices (N) → OrderDetails → Orders (N)


## E-R DİYAGRAMI

![E-R Diyagramı](https://github.com/user-attachments/assets/1be05433-d12a-4371-a963-08778b671849)





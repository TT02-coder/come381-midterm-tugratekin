# COME 381 - Ödev 1 & Ödev 2 Teslimi

## Senaryo ve Tasarım
Bu projede bir **Kulüp ve Etkinlik Yönetim Sistemi** tasarlanmıştır. Sistem 4 ana tablodan oluşmaktadır:
- `department`: Bölüm bilgileri.
- `member`: Kulüp üyeleri.
- `event`: Düzenlenen etkinlikler.
- `event_registration`: Üyelerin katıldığı etkinlikler (M:N ilişkisini sağlayan ara tablo).

## Çalıştırma Sırası
Sırasıyla şu komutlar çalıştırılarak veritabanı kurulur ve testler yürütülür:

```bash
psql -d come381 -f sql/schema.sql
psql -d come381 -f week-05/constraints.sql
psql -d come381 -f week-05/violations.sql > week-05/violations_output.txt 2>&1
psql -d come381 -f week-05/seed.sql
psql -d come381 -f week-05/algebra.sql
"""
Beklenmeyen NULL İhlali Açıklaması

⁠violations.sql⁠ dosyasındaki TEST 8 ve TEST 9 çalışmalarında, sütunlara ⁠NOT NULL⁠ kısıtlaması konulduğu için veri ekleme işlemi PostgreSQL tarafından engellenmiş ve ⁠SQLSTATE 23502⁠ hata kodu alınmıştır.
# NULL Deneyi

## Deney 1
- **Tahminim:** `COUNT(*)` tüm müşteri satırlarını sayarken `COUNT(email)` yalnızca e-posta değeri dolu (`NULL` olmayan) satırları sayacağı için ikinci değerin daha düşük çıkmasını bekliyorum.
- **Sonuç:** `count = 5`, `count = 4` (`customer` tablosunda 5 kayıt var, 1 kaydın `email` değeri boş/NULL).
- **Yorum:** Tahminim tuttu; `COUNT(*)` tüm satırları sayarken `COUNT(email)` `NULL` olan satırı atlayarak 4 sonucunu verdi.

## Deney 2
- **Tahminim:** Tabloda boş (`NULL`) fiyat değeri yoksa `AVG(price)` ile `SUM(price) / COUNT(*)` aynı sonucu verecektir.
- **Sonuç:** `avg = 57.5`, `?column? = 57.5` (her iki sütunda da `57.5` çıktı).
- **Yorum:** Tahminim tuttu; `product` tablosunun `price` sütununda `NULL` değer bulunmadığı için ortalama ile toplamın satır sayısına bölümü eşit çıktı.
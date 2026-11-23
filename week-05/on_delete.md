# Silme Politikası (ON DELETE)

| Foreign Key | Ebeveyn Tablo | Çocuk Tablo | Seçimim | Neden | Diğer Seçenek Neden Olmadı |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `fk_registration_member` | `member` | `event_registration` | `CASCADE` | Üye sistemden silindiğinde geçmiş etkinlik kayıtlarının da otomatik temizlenmesi mantıklıdır. | `RESTRICT` üyeyi silmeyi engellerdi ve sistemde yetim kayıt birikmesine yol açardı. |
| `fk_registration_event` | `event` | `event_registration` | `CASCADE` | Bir etkinlik iptal edilip silindiğinde ona ait kayıtların kalması anlamsızdır. | `SET NULL` yapılması kayıt tablosundaki `event_id NOT NULL` kısıtlamasını bozardı. |
| `fk_member_department` | `department` | `member` | `RESTRICT` | Yanlışlıkla bir bölüm silindiğinde o bölüme bağlı tüm öğrencilerin silinmesini engellemek gerekir. | `CASCADE` seçilseydi tek bir bölüm silindiğinde yüzlerce öğrenci kaydı silinebilirdi. |

### RESTRICT ve NO ACTION Arasındaki Fark
`RESTRICT`, komut çalıştırıldığı anda ilişkili çocuk kayıt var mı diye kontrol eder ve varsa işlemi anında reddeder. `NO ACTION` ise kontrolü işlemin/transaction'ın sonuna erteler.
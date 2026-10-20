# İlişkisel Cebir Sorguları

### D1: Selection ve Projection
- **Soru:** Kapasitesi 50'den büyük olan etkinliklerin adlarını listeleyin.
- **İlişkisel Cebir:** $\pi_{title}(\sigma_{capacity > 50}(event))$
- **TRC:** $\{ t.title \mid event(t) \land t.capacity > 50 \}$

### D2: Natural Join / Join
- **Soru:** Her kaydın üye adını ve etkinlik adını listeleyin.
- **İlişkisel Cebir:** $\pi_{full\_name, title}(member \bowtie event\_registration \bowtie event)$

### D3: Union / Intersection
- **Soru:** Hem bölümlerin hem de üyelerin isimlerini listeleyin.
- **İlişkisel Cebir:** $\pi_{department\_name}(department) \cup \pi_{full\_name}(member)$

### D4: Difference (İki Yoldan)
- **Soru:** Hiçbir etkinliğe kaydolmamış üyeler.
- **Yol 1 (EXCEPT):**
  `SELECT member_id FROM member EXCEPT SELECT member_id FROM event_registration;`
- **Yol 2 (NOT EXISTS):**
  `SELECT m.member_id FROM member m WHERE NOT EXISTS (SELECT 1 FROM event_registration er WHERE er.member_id = m.member_id);`

### D5: Rename
- **Soru:** Aynı bölümdeki üye çiftleri.
- **İlişkisel Cebir:** $\rho_{m1}(member) \bowtie_{m1.department\_id = m2.department\_id \land m1.member\_id \neq m2.member\_id} \rho_{m2}(member)$

### D6: Division
- **Soru:** Tüm etkinliklere kayıt yaptırmış üyeler.
- **SQL (GROUP BY ... HAVING COUNT):**
  `SELECT member_id FROM event_registration GROUP BY member_id HAVING COUNT(DISTINCT event_id) = (SELECT COUNT(*) FROM event);`
- **Neden Seçildi?:** PostgreSQL yerleşik bir `DIVISION` operatörüne sahip olmadığı için `GROUP BY ... HAVING COUNT` mantığı performans açısından en efektif yöntemdir.
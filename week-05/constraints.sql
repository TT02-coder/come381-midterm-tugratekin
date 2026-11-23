-- A1. CHECK: Etkinlik kapasitesi 0'dan büyük olmalı
ALTER TABLE event 
ADD CONSTRAINT chk_event_capacity CHECK (capacity > 0);

-- A2. CHECK: Bitiş tarihi başlangıç tarihinden önce olamaz
ALTER TABLE event 
ADD CONSTRAINT chk_event_date_order CHECK (end_date >= start_date);

-- A3. UNIQUE: Bir üye aynı etkinliğe iki kez kaydolamaz
ALTER TABLE event_registration 
ADD CONSTRAINT uq_registration_member_event UNIQUE (member_id, event_id);

-- A4. UNIQUE: Üye e-postaları benzersiz olmalıdır
ALTER TABLE member 
ADD CONSTRAINT uq_member_email UNIQUE (email);
TRUNCATE TABLE event_registration, event, member, department RESTART IDENTITY CASCADE;

INSERT INTO department (department_name) VALUES 
('Yönetim Bilişim Sistemleri'),
('Bilgisayar Mühendisliği'),
('Endüstri Mühendisliği');

INSERT INTO member (full_name, email, department_id) VALUES 
('Tuğra Tekin', 'tugra@example.com', 1),
('Ahmet Yılmaz', 'ahmet@example.com', 1),
('Ayşe Kaya', 'ayse@example.com', 2),
('Mehmet Demir', 'mehmet@example.com', 3);

INSERT INTO event (title, capacity, start_date, end_date) VALUES 
('Python ile Veri Analizi', 100, '2026-11-01', '2026-11-03'),
('SQL ve Veritabanı Workshop', 40, '2026-11-05', '2026-11-05'),
('Mobil Uygulama Hackathon', 30, '2026-11-10', '2026-11-12');

INSERT INTO event_registration (member_id, event_id, registration_date) VALUES 
(1, 1, '2026-10-20'),
(1, 2, '2026-10-20'),
(1, 3, '2026-10-20'),
(2, 1, '2026-10-21'),
(3, 2, '2026-10-21');
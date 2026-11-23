\set VERBOSITY verbose

TRUNCATE TABLE event_registration, event, member, department RESTART IDENTITY CASCADE;

INSERT INTO department (department_name) VALUES ('YBS');
INSERT INTO member (full_name, email, department_id) VALUES ('Ahmet Yılmaz', 'ahmet@example.com', 1);
INSERT INTO event (title, capacity, start_date, end_date) VALUES ('SQL Dersi', 50, '2026-11-01', '2026-11-02');

-- TEST 1: Foreign Key İhlali -> Beklenen: 23503
INSERT INTO event_registration (member_id, event_id, registration_date) VALUES (999, 1, '2026-10-20');

-- TEST 2: Foreign Key İhlali -> Beklenen: 23503
INSERT INTO event_registration (member_id, event_id, registration_date) VALUES (1, 999, '2026-10-20');

-- TEST 3: CHECK İhlali -> Beklenen: 23514
INSERT INTO event (title, capacity, start_date, end_date) VALUES ('Hatalı Etkinlik', 20, '2026-11-05', '2026-11-01');

-- TEST 4: CHECK İhlali (Geçerli) -> Beklenen: OK
INSERT INTO event (title, capacity, start_date, end_date) VALUES ('Geçerli Etkinlik', 20, '2026-11-05', '2026-11-06');

-- TEST 5: CHECK İhlali -> Beklenen: 23514
INSERT INTO event (title, capacity, start_date, end_date) VALUES ('Negatif Kapasite', -5, '2026-11-05', '2026-11-06');

-- TEST 6: UNIQUE İhlali -> Beklenen: 23505
INSERT INTO event_registration (member_id, event_id, registration_date) VALUES (1, 1, '2026-10-20');
INSERT INTO event_registration (member_id, event_id, registration_date) VALUES (1, 1, '2026-10-21');

-- TEST 7: UNIQUE İhlali -> Beklenen: 23505
INSERT INTO member (full_name, email, department_id) VALUES ('Mehmet Can', 'ahmet@example.com', 1);

-- TEST 8: NOT NULL İhlali -> Beklenen: 23502
INSERT INTO event (title, capacity, start_date, end_date) VALUES (NULL, 50, '2026-11-01', '2026-11-02');

-- TEST 9: NOT NULL İhlali -> Beklenen: 23502
INSERT INTO member (full_name, email, department_id) VALUES ('Ali Veli', NULL, 1);

-- TEST 10: Silme Testi -> Beklenen: 23503
DELETE FROM department WHERE department_id = 1;
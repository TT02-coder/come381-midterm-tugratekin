-- Tabloları temizle
DROP TABLE IF EXISTS event_registration CASCADE;
DROP TABLE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS member CASCADE;
DROP TABLE IF EXISTS department CASCADE;

-- 1. Department Tablosu
CREATE TABLE department (
    department_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 2. Member Tablosu
CREATE TABLE member (
    member_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    CONSTRAINT fk_member_department FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- 3. Event Tablosu
CREATE TABLE event (
    event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    capacity INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- 4. Event Registration (Ara Tablo - M:N)
CREATE TABLE event_registration (
    registration_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT NOT NULL,
    event_id INT NOT NULL,
    registration_date DATE NOT NULL,
    CONSTRAINT fk_registration_member FOREIGN KEY (member_id) REFERENCES member(member_id),
    CONSTRAINT fk_registration_event FOREIGN KEY (event_id) REFERENCES event(event_id)
);
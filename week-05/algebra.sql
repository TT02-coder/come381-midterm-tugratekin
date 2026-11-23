-- D1
SELECT title FROM event WHERE capacity > 50;

-- D2
SELECT m.full_name, e.title 
FROM event_registration er
JOIN member m ON er.member_id = m.member_id
JOIN event e ON er.event_id = e.event_id;

-- D3
SELECT department_name AS isim FROM department
UNION
SELECT full_name AS isim FROM member;

-- D4 (Yol 1: EXCEPT)
SELECT member_id, full_name FROM member 
WHERE member_id IN (
    SELECT member_id FROM member EXCEPT SELECT member_id FROM event_registration
);

-- D4 (Yol 2: NOT EXISTS)
SELECT m.member_id, m.full_name 
FROM member m 
WHERE NOT EXISTS (
    SELECT 1 FROM event_registration er WHERE er.member_id = m.member_id
);

-- D5
SELECT m1.full_name AS uye_1, m2.full_name AS uye_2
FROM member m1
JOIN member m2 ON m1.department_id = m2.department_id AND m1.member_id < m2.member_id;

-- D6
SELECT m.member_id, m.full_name
FROM member m
JOIN event_registration er ON m.member_id = er.member_id
GROUP BY m.member_id, m.full_name
HAVING COUNT(DISTINCT er.event_id) = (SELECT COUNT(*) FROM event);
INSERT INTO bullet (x_position, y_position, radius, x_speed, y_speed, friendly)
SELECT p.x_position, p.y_position, w.radius,
    CASE slot.num
        WHEN 1 THEN 0
        WHEN 2 THEN w.x_speed
        WHEN 3 THEN -w.x_speed
    END, w.y_speed, 
    TRUE FROM player p
JOIN weapon w ON p.weapon = w.id
JOIN (
    SELECT 1 AS num
    UNION ALL SELECT 2
    UNION ALL SELECT 3
) AS slot ON slot.num = 1 OR w.x_speed <> 0;
--creates bullets from player. either 1 moving straight or 3 bullet spread
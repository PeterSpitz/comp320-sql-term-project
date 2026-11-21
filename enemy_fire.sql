INSERT INTO bullet (x_position, y_position, radius, x_speed, y_speed, friendly)
SELECT e.x_position, e.y_position + e.radius, w.radius,
    CASE slot.num
        WHEN 1 THEN 0
        WHEN 2 THEN w.x_speed
        WHEN 3 THEN -w.x_speed
        END, -(w.y_speed), FALSE FROM entity e
JOIN weapon w ON e.weapon = w.id
JOIN (VALUES (1),(2),(3)) AS slot(num) ON slot.num = 1 OR w.x_speed <> 0

WHERE e.spawned = 1; --same logic as player with direction reversed and flag changed
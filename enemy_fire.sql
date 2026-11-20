INSERT INTO bullet (x_position, y_position, radius, x_speed, y_speed, friendly)
VALUES (
    SELECT e.x_position, e.y_position, w.radius, s.x_speed, -(s.y_speed), FALSE FROM entity e
    JOIN weapon w ON e.weapon = w.id
    JOIN spread s ON w.bullet_spread = s.id
    WHERE e.spawned = 1
); --run when enemy shoots
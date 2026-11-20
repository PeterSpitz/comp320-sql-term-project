INSERT INTO bullet (x_position, y_position, radius, x_speed, y_speed, friendly)
VALUES (
    SELECT e.x_position, e.y_position, w.radius, w.x_speed, -(w.y_speed), FALSE FROM entity e
    JOIN weapon w ON e.weapon = w.id
    WHERE e.spawned = 1
); --enemy shoots
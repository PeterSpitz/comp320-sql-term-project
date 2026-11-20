INSERT INTO bullet (x_position, y_position, radius, x_speed, y_speed, friendly)
VALUES (
    SELECT p.x_position, p.y_position, w.radius, w.x_speed, w.y_speed, TRUE FROM player p
    JOIN weapon w ON p.weapon = w.id
); --player shoots
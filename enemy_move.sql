UPDATE entity SET
    x_position = x_position + move_speed_x,
    y_position = y_position + move_speed_y
WHERE spawned = 1; --move entity

UPDATE entity
SET spawned = 3 --enemy despawned
WHERE spawned = 1
AND EXISTS (
    SELECT 1
    FROM screen s
    WHERE
        (entity.x_position + entity.radius < 0)
        OR
        (entity.x_position - entity.radius > s.width)
        OR
        (entity.y_position + entity.radius < s.current_y_position)
        OR
        (entity.y_position - entity.radius > s.current_y_position + s.height)
); --check if an entity has left the screen without being killed

UPDATE entity
SET spawned = 3
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

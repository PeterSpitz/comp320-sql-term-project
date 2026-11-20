UPDATE entity
SET spawned = 1
WHERE spawned = 0
AND EXISTS (
    SELECT 1
    FROM screen s
    WHERE entity.y_position - entity.radius <= s.current_y_position + s.height
); --spawn when the entity's hitbox enters the screen

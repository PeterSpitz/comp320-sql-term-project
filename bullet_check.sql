UPDATE bullet
SET
    x_position = x_position + x_speed,
    y_position = y_position + y_speed; --update bullet's position

DELETE FROM bullet
WHERE EXISTS (
    SELECT 1
    FROM screen s
    WHERE
        (bullet.x_position + bullet.radius < 0)
        OR
        (bullet.x_position - bullet.radius > s.width)
        OR
        (bullet.y_position + bullet.radius < s.current_y_position)
        OR
        (bullet.y_position - bullet.radius > s.current_y_position + s.height)
); --delete a bullet when its hitbox is outside the screen

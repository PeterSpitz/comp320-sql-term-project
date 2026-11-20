DELETE FROM powerup
WHERE EXISTS (
    SELECT 1
    FROM screen s
    WHERE
        (powerup.x_position + powerup.radius < 0)
        OR
        (powerup.x_position - powerup.radius > s.width)
        OR
        (powerup.y_position + powerup.radius < s.current_y_position)
        OR
        (powerup.y_position - powerup.radius > s.current_y_position + s.height)
); --delete a powerup when its hitbox is outside the current screen

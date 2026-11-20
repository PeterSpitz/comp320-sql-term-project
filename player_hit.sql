UPDATE player
SET lives = CASE
    WHEN lives > 0 THEN lives - 1
    ELSE 0
END
WHERE EXISTS (
    SELECT 1
    FROM bullet b
    WHERE b.friendly = FALSE
    AND (
        (player.x_position - b.x_position) * (player.x_position - b.x_position)
        + (player.y_position - b.y_position) * (player.y_position - b.y_position)
        < (player.radius + b.radius) * (player.radius + b.radius)
    )
); --remove one life once per run if an enemy bullet overlaps the player

DELETE FROM bullet
WHERE friendly = FALSE
AND EXISTS (
    SELECT 1
    FROM player p
    WHERE (
        (p.x_position - bullet.x_position) * (p.x_position - bullet.x_position)
        + (p.y_position - bullet.y_position) * (p.y_position - bullet.y_position)
        < (p.radius + bullet.radius) * (p.radius + bullet.radius)
    )
); --consume enemy bullets that hit the player
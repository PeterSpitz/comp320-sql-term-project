UPDATE entity SET
    lives = CASE
        WHEN e.lives > 1 THEN e.lives - 1
        ELSE e.lives
    END,
    spawned = CASE
        WHEN e.lives = 1 THEN 2
        ELSE e.spawned
    END
FROM entity e
JOIN bullet b ON (
    (power(power(e.x_position - b.x_position, 2) + power(e.y_position - b.y_position, 2)),0.5) < (e.radius + b.radius)
) --check if the distance between the entity and bullet is less than the sum of their radii
WHERE e.spawned = 1 --check if entity has spawned
AND b.friendly = TRUE --check if bullet is from player
UPDATE entity
SET
    lives = CASE
        WHEN lives > 1 THEN lives - 1
        ELSE lives
    END,
    spawned = CASE
        WHEN lives = 1 THEN 2
        ELSE spawned
    END
WHERE spawned = 1
AND EXISTS (
    SELECT 1
    FROM bullet b
    WHERE b.friendly = TRUE
    AND (
        (entity.x_position - b.x_position) * (entity.x_position - b.x_position)
        + (entity.y_position - b.y_position) * (entity.y_position - b.y_position)
        < (entity.radius + b.radius) * (entity.radius + b.radius)
    )
); --hit one spawned entity once per run, preserving its remaining lives

DELETE FROM bullet
WHERE friendly = TRUE
AND EXISTS (
    SELECT 1
    FROM entity e
    WHERE e.spawned = 1
    AND (
        (e.x_position - bullet.x_position) * (e.x_position - bullet.x_position)
        + (e.y_position - bullet.y_position) * (e.y_position - bullet.y_position)
        < (e.radius + bullet.radius) * (e.radius + bullet.radius)
    )
); --bullet does not get piercing
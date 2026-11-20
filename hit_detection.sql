UPDATE bullet b --make table with bullets that overlap enemies
JOIN entity e ON  ( 
                  (e.x_position - b.x_position) * (e.x_position - b.x_position)
                  + (e.y_position - b.y_position) * (e.y_position - b.y_position)
                  < (e.radius + b.radius) * (e.radius + b.radius)
                  )
SET
    hit = TRUE; --mark bullets that hit

INSERT INTO powerup (x_position, y_position, radius, move_speed_x, move_speed_y, power_type)
SELECT (e.x_position, e.y_position, 2, e.move_speed_x, (e.move_speed_y - 1), e.powerup) FROM entity e
JOIN bullet b ON (
                 (e.x_position - b.x_position) * (e.x_position - b.x_position)
                 + (e.y_position - b.y_position) * (e.y_position - b.y_position)
                 < (e.radius + b.radius) * (e.radius + b.radius)
                 )
WHERE e.powerup IS NOT NULL
AND e.lives = 1;
--spawn powerup if available at enemy position when enemy is hit with 1 hp

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
WHERE hit = TRUE; --bullet does not get piercing/multi hit
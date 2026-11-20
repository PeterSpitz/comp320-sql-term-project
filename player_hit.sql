UPDATE p SET p.lives = p.lives - 1 FROM player p
JOIN bullet b ON (
    (power(power(p.x_position - b.x_position, 2) + power(p.y_position - b.y_position, 2)),0.5) < (p.radius + b.radius)
) --check if the distance between the entity and bullet is less than the sum of their radii
WHERE b.friendly = FALSE; --check if bullet is from enemies
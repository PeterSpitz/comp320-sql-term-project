UPDATE player SET
    weapon =
        CASE
            WHEN pt.new_weapon IS NOT NULL THEN pt.new_weapon
            ELSE p.weapon
        END
FROM player p
JOIN powerup pu ON (
    (power(power(p.x_position - pu.x_position, 2) + power(p.y_position - pu.y_position, 2)),0.5) < (p.radius + pu.radius)
) --check if the distance between the player and powerup is less than the sum of their radii
JOIN power_types pt ON pu.power_type = pt.id
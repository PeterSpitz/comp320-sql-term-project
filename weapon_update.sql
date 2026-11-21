UPDATE player
SET weapon = CASE
    WHEN EXISTS (
        SELECT 1 --does powerup touch player?
        FROM powerup pu
        WHERE
            (player.x_position - pu.x_position) * (player.x_position - pu.x_position)
            + (player.y_position - pu.y_position) * (player.y_position - pu.y_position)
            < (player.radius + pu.radius) * (player.radius + pu.radius)
    )
    THEN (
        SELECT pt.new_weapon --update equiped weapon
        FROM powerup pu
        JOIN power_types pt ON pt.id = pu.power_type
        WHERE
            (player.x_position - pu.x_position) * (player.x_position - pu.x_position)
            + (player.y_position - pu.y_position) * (player.y_position - pu.y_position)
            < (player.radius + pu.radius) * (player.radius + pu.radius)
        LIMIT 1
    )
    ELSE weapon
END
; --equip the weapon from one overlapping powerup

DELETE FROM powerup
WHERE EXISTS (
    SELECT 1
    FROM player p
    WHERE
        (
            (p.x_position - powerup.x_position) * (p.x_position - powerup.x_position)
            + (p.y_position - powerup.y_position) * (p.y_position - powerup.y_position)
            < (p.radius + powerup.radius) * (p.radius + powerup.radius)
        )
); --consume powerups that hit the player

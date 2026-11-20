UPDATE player
SET
    x_position = CASE
        WHEN player.x_position - player.radius < 0 THEN player.radius
        WHEN player.x_position + player.radius >
            (SELECT s.width FROM screen s)
            THEN (SELECT s.width FROM screen s) - player.radius
        ELSE player.x_position
    END,
    y_position = CASE
        WHEN player.y_position - player.radius <
            (SELECT s.current_y_position FROM screen s)
            THEN (SELECT s.current_y_position FROM screen s) + player.radius
        WHEN player.y_position + player.radius >
            (SELECT s.current_y_position + s.height FROM screen s)
            THEN (SELECT s.current_y_position + s.height FROM screen s) - player.radius
        ELSE player.y_position
    END; --keep player within the current screen bounds

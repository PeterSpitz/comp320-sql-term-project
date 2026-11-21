UPDATE player --move player
SET x_position = x_position + move_x_speed,
    y_position = y_position + move_y_speed;

UPDATE player --check if player is still inside the screen
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
    END;
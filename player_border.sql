UPDATE player SET --keep player on screen
    x_position = 
        CASE 
            WHEN p.x_position-p.radius < 0 THEN p.radius
            WHEN p.x_position+p.radius > s.width THEN s.width - p.radius
            ELSE p.x_position
        END,
    y_position =
        CASE 
            WHEN p.y_position-p.radius < s.current_y_position THEN s.current_y_position + p.radius
            WHEN p.y_position+p.radius > s.current_y_position+s.height THEN s.current_y_position + s.height - p.radius
            ELSE p.y_position
        END
FROM player p
JOIN screen s ON (1=1) --check if player is off screen

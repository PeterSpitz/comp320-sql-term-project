DROP FROM TABLE powerup WHERE id IN
    (SELECT p.id FROM powerup p
    JOIN screen s ON (
        (p.x_position < 0 OR p.x_position > s.width) OR
        (p.y_position < s.current_y_position OR p.y_position > (s.current_y_position + s.height))
    )) --check if the powerup is off screen

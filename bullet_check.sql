DROP FROM TABLE bullet WHERE id IN 
    (SELECT b.id FROM bullet b
    JOIN screen s ON (
        (b.x_position < 0 OR b.x_position > s.width) OR 
        (b.y_position < s.current_y_position OR b.y_position > (s.current_y_position + s.height))
    )); --check if the bullet is off screen
    
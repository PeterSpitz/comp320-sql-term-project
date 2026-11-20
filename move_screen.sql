UPDATE screen SET --move screen upwards by screen_speed. include check for max distance
    current_y_position = CASE
        WHEN current_y_position + screen_speed < max_y_position - height THEN current_y_position + screen_speed
        ELSE current_y_position
    END;
UPDATE entity SET
    x_position = x_position + x_speed,
    y_position = y_position + y_speed
WHERE spawned = 1;
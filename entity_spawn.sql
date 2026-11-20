UPDATE entity SET spawned = 1 FROM entity e --check if entity entered the screen
JOIN screen s ON (
    (e.y_position < s.current_y_position + s.height)
)
WHERE e.spawned = 0;

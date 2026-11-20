UPDATE entity SET spawned = 3 FROM entity e --check if entity has left without being killed
JOIN screen s ON (
    (e.x_position < 0 OR e.x_position > s.width) OR 
    (e.y_position < s.current_y_position)
)
WHERE e.spawned = 1;

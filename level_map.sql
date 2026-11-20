-- Initial data for "Skyline Strike" campaign level.
-- Run term_project_V1.0.sql first to create the tables.

INSERT INTO weapon (id, fire_rate, radius, x_speed, y_speed) VALUES
    (1, 180, 3, 0, 9),
    (2, 105, 3, 0, 11),
    (3, 180, 3, 3, 10),
    (4, 420, 5, 2, 7);

INSERT INTO player (x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon)
VALUES (400, 520, 16, 0, 0, 10, 1);

INSERT INTO screen
    (current_y_position, max_y_position, screen_speed, width, height, score)
VALUES (0, 3200, 1, 800, 600, 0);

-- Basic scout (id 1), zig-zag fighter (2), heavy fighter (3), and boss (4).
INSERT INTO entity
    (id, x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon, powerup, spawned)
VALUES
    (1, 150, 800, 14, 2, 1, 1, 4, NULL, 0),
    (2, 650, 800, 14, -2, 1, 1, 4, NULL, 0),
    (3, 400, 1050, 18, 1, 1, 3, 4, NULL, 0),
    (4, 220, 1350, 14, 2, 1, 2, 4, NULL, 0),
    (5, 580, 1350, 14, -2, 1, 2, 4, NULL, 0),
    (6, 400, 1650, 18, 2, 1, 4, 4, NULL, 0),
    (7, 120, 1950, 14, 2, 1, 2, 4, NULL, 0),
    (8, 680, 1950, 14, -2, 1, 2, 4, NULL, 0),
    (9, 400, 2250, 14, 3, 1, 3, 4, NULL, 0),
    (10, 400, 2750, 55, 1, 0, 50, 4, NULL, 0);

INSERT INTO power_types (id, new_weapon) VALUES
    (1, 2),
    (2, 3);

-- Fire-rate and angle-firing powerups.
INSERT INTO powerup
    (id, x_position, y_position, radius, move_speed_x, move_speed_y, power_type)
VALUES
    (1, 400, 1150, 12, 0, 2, 1),
    (2, 240, 2050, 12, 0, 2, 2),
    (3, 560, 2450, 12, 0, 2, 1);

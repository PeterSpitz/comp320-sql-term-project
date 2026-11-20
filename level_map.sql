-- Initial state and entity placements for the Skyline Strike level.
-- Weapon 1 is the player's standard weapon.
INSERT INTO weapon (id, fire_rate, radius, x_speed, y_speed)
VALUES (1, 1, 4, 0, 620);

-- Player starts near the bottom of a 720 x 900 screen.
INSERT INTO player (x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon)
VALUES (360, 790, 18, 0, 0, 10, 1);

-- The camera advances toward the end of the 3200-unit level.
INSERT INTO screen (current_y_position, max_y_position, screen_speed, width, height, score)
VALUES (0, 3200, 75, 720, 900, 0);

-- Scout formation: early enemies spawn into the upper portion of the level.
INSERT INTO entity (id, x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon, spawned)
VALUES
    (101, 120, 40, 16, 0, 75, 1, 1, 0),
    (102, 240, 40, 16, 0, 75, 1, 1, 0),
    (103, 360, 40, 16, 0, 75, 1, 1, 0),
    (104, 480, 40, 16, 0, 75, 1, 1, 0),
    (105, 600, 40, 16, 0, 75, 1, 1, 0);

-- Second formation.
INSERT INTO entity (id, x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon, spawned)
VALUES
    (106, 180, 180, 16, 0, 95, 1, 1, 0),
    (107, 300, 180, 16, 0, 95, 1, 1, 0),
    (108, 420, 180, 16, 0, 95, 1, 1, 0),
    (109, 540, 180, 16, 0, 95, 1, 1, 0);

-- Armored enemies near the center of the level.
INSERT INTO entity (id, x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon, spawned)
VALUES
    (110, 220, 330, 23, 0, 110, 3, 1, 0),
    (111, 500, 330, 23, 0, 110, 3, 1, 0),
    (112, 360, 450, 23, 0, 110, 3, 1, 0);

-- Final escort formation.
INSERT INTO entity (id, x_position, y_position, radius, move_speed_x, move_speed_y, lives, weapon, spawned)
VALUES
    (113, 120, 620, 16, 0, 125, 1, 1, 0),
    (114, 240, 620, 16, 0, 125, 1, 1, 0),
    (115, 360, 620, 16, 0, 125, 1, 1, 0),
    (116, 480, 620, 16, 0, 125, 1, 1, 0),
    (117, 600, 620, 16, 0, 125, 1, 1, 0);
CREATE TABLE IF NOT EXISTS entity(
    id INT PRIMARY KEY,
    x_position INT NOT NULL,
    y_position INT NOT NULL,
    radius INT DEFAULT 1, --defines hitbox of the entity
    move_speed_x INT DEFAULT 0, --speed of the entity along the x-axis
    move_speed_y INT DEFAULT 0, --speed of the entity along the y-axis
    lives INT DEFAULT 1, --1 for basic enemies, 5 for special enemies, 50 for boss
    weapon INT DEFAULT 0,
    has_powerup BOOLEAN DEFAULT FALSE, --if true, entity will drop a powerup when killed
    powerup INT, --null if no powerup
    spawned INT DEFAULT 0, --0 if not spawned yet, 1 if spawned, 2 if killed, 3 if despawned off screen
    foreign key (weapon) references weapon(id)
);

CREATE TABLE IF NOT EXISTS power_types(
    id INT PRIMARY KEY,
    new_weapon INT NOT NULL, --new weapon for player
    foreign key (new_weapon) references weapon(id),
    foreign key (id) references entity(powerup),
    foreign key (id) references powerup(power_type)
);

CREATE TABLE IF NOT EXISTS powerup( --entry deleted when off screen
    id INT PRIMARY KEY, --cannot interact with bullets/entities
    x_position INT NOT NULL,
    y_position INT NOT NULL,
    radius INT DEFAULT 1,
    move_speed_x INT DEFAULT 0,
    move_speed_y INT DEFAULT -1,
    power_type INT NOT NULL,
    foreign key (power_type) references power_types(id)
);

CREATE TABLE IF NOT EXISTS player(
    x_position INT NOT NULL,
    y_position INT NOT NULL,
    radius INT DEFAULT 1, --defines hitbox of the entity
    move_speed_x INT DEFAULT 0,
    move_speed_y INT DEFAULT 0,
    max_move_speed_x INT DEFAULT 2,
    max_move_speed_y INT DEFAULT 2,
    lives INT DEFAULT 10,
    weapon INT DEFAULT 0,
    foreign key (weapon) references weapon(id)
);

CREATE TABLE IF NOT EXISTS weapon(
    id INT PRIMARY KEY,
    fire_rate INT DEFAULT 1, --delay between shots
    bullet_spread INT NOT NULL, --direction and number of bullets fired
    foreign key (id) references entity(weapon),
    foreign key (id) references player(weapon),
    foreign key (id) references power_types(new_weapon),
    foreign key (id) references spread(id)
);

CREATE TABLE IF NOT EXISTS spread(
    id INT PRIMARY KEY,
    x_speed INT NOT NULL,
    y_speed INT NOT NULL, -- + for up/player, - for down/enemy
    foreign key (id) references weapon(bullet_spread)
);

CREATE TABLE IF NOT EXISTS bullet( --entry deleted when off screen
    id INT PRIMARY KEY, --created by weapons. does not depend on the weapon used to create it
    x_position INT NOT NULL,
    y_position INT NOT NULL,
    radius INT DEFAULT 1, --defines hitbox of the bullet
    direction INT NOT NULL, --angle of the bullet's trajectory
    friendly BOOLEAN NOT NULL --TRUE player bullets cannot damage player. enemies cannot damage enemies
);

CREATE TABLE IF NOT EXISTS screen(
    current_y_position INT DEFAULT 0, --entities spawn when entity y < current_y + height
    screen_speed INT DEFAULT 1, --speed of the screen moving downwards
    width INT NOT NULL,
    height INT NOT NULL,

    score INT DEFAULT 0 --calculated from level_map spawned=2 count
);

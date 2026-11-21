-- Starline event schedule. Load after term_project_V1.0.sql.
-- Progress is elapsed level progress (0-100); lane is playfield width percent.
CREATE TABLE IF NOT EXISTS level_map (
    id INTEGER PRIMARY KEY,
    progress_percent INTEGER NOT NULL CHECK (progress_percent BETWEEN 0 AND 100),
    enemy_type TEXT NOT NULL CHECK (enemy_type IN ('scout', 'weaver', 'gunner', 'tank', 'boss')),
    lane_percent INTEGER NOT NULL CHECK (lane_percent BETWEEN 0 AND 100),
    quantity INTEGER NOT NULL DEFAULT 1 CHECK (quantity > 0),
    drop_weapon INTEGER,
    FOREIGN KEY (drop_weapon) REFERENCES weapon(id)
);

-- Weapon IDs are shared with the browser game: standard (1), rapid (2), spread (3).
INSERT OR IGNORE INTO weapon (id, fire_rate, radius, x_speed, y_speed) VALUES
    (1, 27, 4, 0, 560),
    (2, 12, 4, 0, 560),
    (3, 27, 4, 112, 560);

-- Unassigned enemies may also drop either weapon at random.

INSERT OR IGNORE INTO level_map (id, progress_percent, enemy_type, lane_percent, quantity, drop_weapon) VALUES
    (1,   2, 'scout',  50, 1, NULL),
    (2,   8, 'scout',  27, 2, NULL),
    (3,  14, 'weaver', 72, 2, NULL),
    (4,  20, 'scout',  18, 3, NULL),
    (5,  26, 'gunner', 50, 1, 2),
    (6,  32, 'weaver', 78, 3, NULL),
    (7,  38, 'tank',   34, 1, 3),
    (8,  44, 'gunner', 68, 2, NULL),
    (9,  50, 'scout',  22, 4, NULL),
    (10, 56, 'tank',   72, 1, 2),
    (11, 62, 'weaver', 42, 3, NULL),
    (12, 68, 'gunner', 24, 2, 3),
    (13, 73, 'tank',   53, 2, NULL),
    (14, 78, 'weaver', 76, 4, 2),
    (15, 82, 'gunner', 36, 3, NULL),
    (16, 86, 'tank',   66, 2, 3),
    (17, 90, 'boss',   50, 1, 3),
    (18, 97, 'scout',  50, 3, NULL);

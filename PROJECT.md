Checklist of included logic

- player: move, fire, recieve damage, collect powerups, stay in screen
- enemy: spawn, states, hit, fire
- bullets: move, out of bounds, hit, spawn
- powerups: spawn, move, out of bounds, collect
- screen: move towards end, update score
- level: base level data in sql. map implemented in html layer

Prompt used:

- create a basic game from the respository.
- store the result in index.html.
- It will be a simple vertical plane shooter with the screen/player traveling upwards and enemies spawn at the top of the screen.
- create a simple level and store it in level_map.sql as a set of insert statements holding values for the level.
- include inserts to add powerups to the game.
- they will take the form of increased fire rate or firing at angles.
- create a mix of enemies including at least one boss level enemy.
- powerups spawn on enemy kills only and move towards the bottom of the screen
- first enemy appears no later than 5% of screen's progress
- level does not end based on distance
- boss has no y movement. only y movement comes from screen advancing through the level
- boss is set near max screen distance. remains in upper half when screen reaches it's limit
- level ends when boss dies

Chosen dataset

- simple game made with sql. tables hold player, enemies, weapon list, spawned powerups/bullets, and screen data

The relationships between tables

- relationship between tables is a one to many for weapons to player,enemy, and powerups
- many other relationships are conditional and instead implemented through insert, update, or delete statments
  - bullets are created from weapon used and tagged depending on if the entity is the player or an enemy
    - one to many using insert
  - bullets are removed when they overlap an entity
    - one to one using delete
  - powerups are spawned during the hit detection for enemies
    - one to one using insert
  - life adjustments are made during hit detection
    - one to one using update
  - order matters for these to avoid data loss
    - tag bullet as hit, spawn powerup if 1 hp, lower enemy hp by 1 or set killed if 1, delete bullet
  - objects are removed when they are outside the screen except the player which is instead pushed back
    - many to one using delete/update. bullets/powerups deleted if outside bounds set in screen table. enemies marked as fled for score purposes
  - screen moves up a map
    - holds current position + area shown in screen. update to progress level

How to run your application

- run index.html in a web browser
- click to start the game then click again or move up to enter the screen

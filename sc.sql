CREATE TABLE IF NOT EXISTS spaceship(
    id BIGSERIAL PRIMARY KEY,
    type TEXT NOT NULL,
    name TEXT NOT NULL,
    capacity BIGINT NOT NULL CHECK ( capacity > 0 ),
    speed BIGINT NOT NULL CHECK ( speed > 0 ),
    fuel BIGINT NOT NULL CHECK ( fuel > 0 )
);

CREATE TABLE IF NOT EXISTS pilot(
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    birthday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS licence(
    id BIGSERIAL PRIMARY KEY,
    pilot_id BIGINT NOT NULL,
    spaceship_id BIGINT NOT NULL,
    FOREIGN KEY (spaceship_id) REFERENCES spaceship(id) ON DELETE CASCADE,
    FOREIGN KEY (pilot_id) REFERENCES pilot(id) ON DELETE CASCADE,
    CONSTRAINT licence_spaceship_unique UNIQUE (spaceship_id)
);

CREATE TABLE IF NOT EXISTS galaxy(
    id BIGSERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE IF NOT EXISTS planet(
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    x DOUBLE PRECISION NOT NULL,
    y DOUBLE PRECISION NOT NULL,
    z DOUBLE PRECISION NOT NULL,
    galaxy_id BIGINT NOT NULL,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS base(
  id BIGSERIAL PRIMARY KEY,
  fuel_capacity BIGINT NOT NULL CHECK ( fuel_capacity > 0 ),
  missions_num BIGINT NOT NULL CHECK ( missions_num >= 0 ),
  capacity  BIGINT NOT NULL CHECK ( capacity > 0 )
);

CREATE TABLE IF NOT EXISTS on_base(
    base_id BIGINT NOT NULL,
    spaceship_id BIGINT NOT NULL,
    FOREIGN KEY (base_id) REFERENCES base(id) ON DELETE CASCADE ,
    FOREIGN KEY (spaceship_id) REFERENCES spaceship(id) ON DELETE CASCADE ,
    CONSTRAINT base_spaceship_unique UNIQUE (spaceship_id)
);

CREATE TABLE IF NOT EXISTS mission(
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    goal TEXT NOT NULL,
    planet_id BIGINT NOT NULL ,
    deadline DATE,
    base_id BIGINT,
    FOREIGN KEY (planet_id) REFERENCES planet(id) ON DELETE CASCADE ,
    FOREIGN KEY (base_id) REFERENCES base(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS on_mission(
    mission_id BIGINT REFERENCES mission(id) ON DELETE CASCADE,
    pilot_id BIGINT REFERENCES pilot(id) ON DELETE CASCADE
);

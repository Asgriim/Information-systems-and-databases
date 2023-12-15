CREATE SEQUENCE IF NOT EXISTS content_id_seq;

CREATE TABLE IF NOT EXISTS game (
    id INT PRIMARY KEY,
    title TEXT,
    description TEXT,
    is_free bool NOT NULL
);

-- Таблица tv_show
CREATE TABLE IF NOT EXISTS tv_show (
    id INT PRIMARY KEY,
    title TEXT,
    description TEXT,
    series_num INT NOT NULL CHECK ( tv_show.series_num >0 )
);

CREATE TABLE IF NOT EXISTS comic (
    id INT PRIMARY KEY,
    title TEXT,
    description TEXT,
    is_colored BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS movie (
    id INT PRIMARY KEY,
    title TEXT,
    description TEXT,
    duration INT NOT NULL CHECK ( duration > 0 )
);

-- Таблица anime
CREATE TABLE IF NOT EXISTS anime (
    id INT PRIMARY KEY,
    title TEXT,
    description TEXT,
    series_num INT NOT NULL CHECK ( series_num > 0 )
);

-- Таблица content
CREATE TABLE IF NOT EXISTS content (
    id INT PRIMARY KEY,
    type TEXT NOT NULL
);

-- Таблица studio
CREATE TABLE IF NOT EXISTS studio (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS studio_contents (
    studio_id INT,
    content_id INT,
    FOREIGN KEY (studio_id) REFERENCES studio(id) ON DELETE CASCADE,
    FOREIGN KEY (content_id) REFERENCES content(id) ON DELETE CASCADE
);


-- Таблица user
CREATE TABLE IF NOT EXISTS user_ (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL,
    name TEXT NOT NULL,
    login TEXT NOT NULL,
    pass TEXT NOT NULL,
    role INT
);

-- Таблица history
CREATE TABLE IF NOT EXISTS history (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    content_id INT NOT NULL,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES user_ (id) ON DELETE CASCADE ,
    FOREIGN KEY (content_id) REFERENCES content (id) ON DELETE CASCADE
);

-- Таблица review
CREATE TABLE IF NOT EXISTS review (
    id SERIAL PRIMARY KEY,
    test TEXT,
    user_id INT NOT NULL,
    content_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_ (id) ON DELETE CASCADE ,
    FOREIGN KEY (content_id) REFERENCES content (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS rating (
    id SERIAL PRIMARY KEY,
    value INT CHECK ( value > 0 ),
    user_id INT,
    content_id INT,
    FOREIGN KEY (user_id) REFERENCES user_ (id) ON DELETE CASCADE ,
    FOREIGN KEY (content_id) REFERENCES content (id) ON DELETE CASCADE
);

-- Таблица list
CREATE TABLE IF NOT EXISTS list (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Таблица user_list
CREATE TABLE IF NOT EXISTS user_list (
    user_id INT NOT NULL,
    list_id INT NOT NULL,
    content_id INT NOT NULL,
    FOREIGN KEY (content_id) REFERENCES content (id) ON DELETE CASCADE ,
    FOREIGN KEY (user_id) REFERENCES user_ (id) ON DELETE CASCADE ,
    FOREIGN KEY (list_id) REFERENCES list (id) ON DELETE CASCADE
);


-- Таблица tags
CREATE TABLE IF NOT EXISTS tags (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Таблица content_tags
CREATE TABLE IF NOT EXISTS  content_tags (
    content_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (content_id) REFERENCES content (id) ON DELETE CASCADE ,
    FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS owner_of_content(
    user_id INT,
    content_id INT,
    FOREIGN KEY (content_id) REFERENCES content (id) ON DELETE CASCADE ,
    FOREIGN KEY (user_id) REFERENCES user_ (id) ON DELETE CASCADE
);


CREATE OR REPLACE FUNCTION add_to_content()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO content
    VALUES (NEW.id, TG_ARGV[0]);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE  TRIGGER add_anime
    AFTER INSERT ON anime
    FOR EACH ROW EXECUTE PROCEDURE add_to_content('anime');

CREATE OR REPLACE  TRIGGER add_game
    AFTER INSERT ON game
    FOR EACH ROW EXECUTE PROCEDURE add_to_content('game');

CREATE OR REPLACE TRIGGER add_tv_show
    AFTER INSERT ON tv_show
    FOR EACH ROW EXECUTE PROCEDURE add_to_content('tv_show');

CREATE OR REPLACE  TRIGGER add_comic
    AFTER INSERT ON comic
    FOR EACH ROW EXECUTE PROCEDURE add_to_content('comic');

CREATE OR REPLACE TRIGGER add_movies
    AFTER INSERT ON movie
    FOR EACH ROW EXECUTE PROCEDURE add_to_content('movie');


CREATE OR REPLACE FUNCTION remove_from_content()
    RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM content
    WHERE (OLD.id = content.id);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER remove_anime_trig
    AFTER DELETE ON anime
    FOR EACH ROW EXECUTE PROCEDURE remove_from_content();

CREATE OR REPLACE TRIGGER remove_comic_trig
    AFTER DELETE ON comic
    FOR EACH ROW EXECUTE PROCEDURE remove_from_content();

CREATE OR REPLACE TRIGGER remove_game_trig
    AFTER DELETE ON game
    FOR EACH ROW EXECUTE PROCEDURE remove_from_content();

CREATE OR REPLACE TRIGGER remove_movie_trig
    AFTER DELETE ON movie
    FOR EACH ROW EXECUTE PROCEDURE remove_from_content();

CREATE OR REPLACE TRIGGER remove_tb_show_trig
    AFTER DELETE ON tv_show
    FOR EACH ROW EXECUTE PROCEDURE remove_from_content();



CREATE INDEX IF NOT EXISTS title_anime ON anime USING hash (title);
CREATE INDEX IF NOT EXISTS title_movie ON movie USING hash (title);
CREATE INDEX IF NOT EXISTS title_tv_show ON tv_show USING hash (title);
CREATE INDEX IF NOT EXISTS title_game ON game USING hash (title);
CREATE INDEX IF NOT EXISTS title_comic ON comic USING hash (title);

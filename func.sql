CREATE OR REPLACE FUNCTION add_anime_as_creator(_user_id INT, _content_id INT,_title TEXT, _description TEXT, _series_num INT)
    RETURNS VOID AS $$
BEGIN
    insert into anime(id, title, description, series_num) VALUES (_content_id,_title,_description,_series_num);
    insert into owner_of_content(user_id, content_id) VALUES (_user_id, content_id);
        END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_comic_as_creator(_user_id INT, _content_id INT,_title TEXT, _description TEXT, _is_colored bool)
    RETURNS VOID AS $$
BEGIN
    insert into comic(id, title, description, is_colored) VALUES (_content_id,_title,_description, _is_colored);
    insert into owner_of_content(user_id, content_id) VALUES (_user_id, content_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_game_as_creator(_user_id INT, _content_id INT,_title TEXT, _description TEXT, _is_free bool)
    RETURNS VOID AS $$
BEGIN
    insert into game(id, title, description, is_free) VALUES (_content_id,_title,_description, _is_free);
    insert into owner_of_content(user_id, content_id) VALUES (_user_id, content_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_movie_as_creator(_user_id INT, _content_id INT,_title TEXT, _description TEXT, _duration int)
    RETURNS VOID AS $$
BEGIN
    insert into movie(id, title, description, duration) VALUES (_content_id,_title,_description, _duration);
    insert into owner_of_content(user_id, content_id) VALUES (_user_id, content_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_tv_show_as_creator(_user_id INT, _content_id INT,_title TEXT, _description TEXT, _series_num int)
    RETURNS VOID AS $$
BEGIN
    insert into tv_show(id, title, description, series_num) VALUES (_content_id,_title,_description, _series_num);
    insert into owner_of_content(user_id, content_id) VALUES (_user_id, content_id);
END;
$$ LANGUAGE plpgsql;

--
--
-- HISTORY FUNCS
--
--

CREATE OR REPLACE FUNCTION add_to_history(_user_id INT, _content_id INT)
    RETURNS VOID AS $$
BEGIN
    INSERT INTO history(user_id, content_id, date) values (_user_id, _content_id, current_timestamp);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_anime(user_id INT,anime_id INT, new_title TEXT, new_description TEXT, new_series_num INT)
    RETURNS VOID AS $$
BEGIN
    UPDATE anime
    SET title = new_title, description = new_description, series_num = new_series_num
    WHERE id = anime_id;
    select add_to_history(user_id,anime_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_comic(user_id INT, content_id INT, new_title TEXT, new_description TEXT, new_colored BOOL)
    RETURNS VOID AS $$
BEGIN
    UPDATE comic
    SET title = new_title, description = new_description, is_colored = new_colored
    WHERE id = content_id;
    select add_to_history(user_id,content_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_game(user_id INT, content_id INT, new_title TEXT, new_description TEXT, new_free BOOL)
    RETURNS VOID AS $$
BEGIN
    UPDATE game
    SET title = new_title, description = new_description, is_free = new_free
    WHERE id = content_id;
    select add_to_history(user_id,content_id);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_movie(user_id INT, content_id INT, new_title TEXT, new_description TEXT, new_duration INT)
    RETURNS VOID AS $$
BEGIN
    UPDATE movie
    SET title = new_title, description = new_description, duration = new_duration
    WHERE id = content_id;
    select add_to_history(user_id,content_id);
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION update_tv_show(user_id INT, content_id INT, new_title TEXT, new_description TEXT, new_series_num INT)
    RETURNS VOID AS $$
BEGIN
    UPDATE tv_show
    SET title = new_title, description = new_description, series_num = new_series_num
    WHERE id = content_id;
    select add_to_history(user_id,content_id);
END;
$$ LANGUAGE plpgsql;


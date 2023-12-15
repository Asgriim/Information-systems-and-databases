INSERT INTO game (id, title, description, is_free)
VALUES
    (nextval('content_id_seq'), 'The Witcher 3: Wild Hunt', 'Open-world action RPG set in a sprawling fantasy world', FALSE),
    (nextval('content_id_seq'), 'Minecraft', 'Creative sandbox game with endless possibilities', FALSE),
    (nextval('content_id_seq'), 'Tetris Effect', 'Trippy and immersive take on the classic puzzle game', FALSE),
    (nextval('content_id_seq'), 'League of Legends', 'Popular online multiplayer battle arena game', TRUE),
    (nextval('content_id_seq'), 'Portal 2', 'Mind-bending puzzle game with a hilarious story', FALSE);

INSERT INTO tv_show (id, title, description, series_num)
VALUES
    (nextval('content_id_seq'), 'Breaking Bad', 'Drama about a high school chemistry teacher who turns to drug dealing', 5),
    (nextval('content_id_seq'), 'Stranger Things', 'Sci-fi horror series about a group of kids who encounter supernatural forces', 4),
    (nextval('content_id_seq'), 'The Office', 'Mockumentary sitcom about the lives of office workers', 9),
    (nextval('content_id_seq'), 'Game of Thrones', 'Fantasy epic with a sprawling cast of characters', 8),
    (nextval('content_id_seq'), 'Rick and Morty', 'Adult animated sci-fi comedy about a mad scientist and his grandson', 5);

INSERT INTO comic (id, title, description, is_colored)
VALUES
    (nextval('content_id_seq'), 'Batman: The Dark Knight Returns', 'Classic graphic novel about an aging Batman', TRUE),
    (nextval('content_id_seq'), 'Saga', 'Epic space opera with beautiful artwork', TRUE),
    (nextval('content_id_seq'), 'Maus', 'Graphic novel about the Holocaust told from the perspective of a mouse', FALSE),
    (nextval('content_id_seq'), 'Watchmen', 'Deconstructionist superhero comic with a dark and complex story', TRUE),
    (nextval('content_id_seq'), 'Scott Pilgrim vs. the World', 'Action-comedy comic about a young man who has to fight his girlfriends seven evil exes', TRUE);

INSERT INTO movie (id, title, description, duration)
VALUES
    (nextval('content_id_seq'), 'The Shawshank Redemption', 'Drama about a wrongly convicted man who finds hope in prison', 142),
    (nextval('content_id_seq'), 'The Godfather', 'Gangster epic about the Corleone family', 175),
    (nextval('content_id_seq'), 'The Lord of the Rings: The Fellowship of the Ring', 'Fantasy adventure film based on the J.R.R. Tolkien novel', 178),
    (nextval('content_id_seq'), 'Inception', 'Sci-fi thriller about a team of thieves who steal information by entering peoples dreams', 148),
    (nextval('content_id_seq'), 'Parasite', 'Black comedy thriller about a poor family who infiltrates a wealthy household', 132);


INSERT INTO anime (id, title, description, series_num)
VALUES
    (nextval('content_id_seq'), 'Attack on Titan', 'Post-apocalyptic anime about humanitys struggle against giant humanoid creatures', 4),
    (nextval('content_id_seq'), 'Fullmetal Alchemist: Brotherhood', 'Alchemical adventure anime about two brothers who try to bring their mother back to life', 61),
    (nextval('content_id_seq'), 'Demon Slayer: Kimetsu no Yaiba', 'Fantasy action anime about a young swordsman who hunts demons', 26),
    (nextval('content_id_seq'), 'My Hero Academia', 'Superhero anime about a boy who wants to be a hero despite being quirkless', 5),
    (nextval('content_id_seq'), 'Spirited Away', 'Fantasy film about a young girl who enters the spirit world', 1);

INSERT INTO studio (name)
VALUES
    ('CD Projekt Red'),
    ('Mojang Studios'),
    ('Araki Productions'),
    ('Ufotable'),
    ('Ghibli');

INSERT INTO user_ (email, name, login, pass, role)
VALUES
    ('johndoe@example.com', 'John Doe', 'johndoe', 'password', 1),
    ('janedoe@example.com', 'Jane Doe', 'janedoe', 'password', 2),
    ('admin@example.com', 'Admin', 'admin', 'admin', 3);

INSERT INTO history ( user_id, content_id, date)
VALUES
    ( 1, 1, '2023-12-14'),
    ( 2, 2, '2023-12-15'),
    ( 3, 3, '2023-12-16');

INSERT INTO review (test, user_id, content_id)
VALUES
    ('This movie is a classic. It''s a must-see for anyone who loves drama.', 1, 1),
    ('This anime is amazing. It''s a must-watch for any fan of post-apocalyptic stories.', 2, 2),
    ('This game is incredible. It''s a must-play for any fan of open-world RPGs.', 3, 3);


INSERT INTO rating (value, user_id, content_id)
VALUES
    (5, 1, 1),
    (4, 2, 2),
    (3, 3, 3);


INSERT INTO list (name)
VALUES
    ('Watched'),
    ('Watching'),
    ('Will watch');

INSERT INTO user_list (user_id, list_id, content_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);



INSERT INTO tags (name)
VALUES
    ('action'),
    ('drama'),
    ('fantasy'),
    ('sport'),
    ('comedy'),
    ('slice of life'),
    ('horror'),
    ('adventure'),
    ('rogue-like'),
    ('double penetration'),
    ('vanilla');

INSERT INTO content_tags (content_id, tag_id)
VALUES
    (1, 1),
    (2, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6);

INSERT INTO studio_contents (studio_id, content_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3)
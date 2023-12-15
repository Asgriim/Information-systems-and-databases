CREATE INDEX IF NOT EXISTS title_anime ON anime USING hash (title);
CREATE INDEX IF NOT EXISTS title_movie ON movie USING hash (title);
CREATE INDEX IF NOT EXISTS title_tv_show ON tv_show USING hash (title);
CREATE INDEX IF NOT EXISTS title_game ON game USING hash (title);
CREATE INDEX IF NOT EXISTS title_comic ON comic USING hash (title);

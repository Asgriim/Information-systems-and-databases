-- Скрипты для дропа таблиц
drop sequence if EXISTS content_id_seq;
-- Скрипт для дропа таблицы content
DROP TABLE IF EXISTS content CASCADE;

-- Скрипт для дропа таблицы tags
DROP TABLE IF EXISTS tags CASCADE;

-- Скрипт для дропа таблицы content_tags
DROP TABLE IF EXISTS content_tags CASCADE;

-- Скрипт для дропа таблицы user
DROP TABLE IF EXISTS user_ CASCADE;

-- Скрипт для дропа таблицы list
DROP TABLE IF EXISTS list CASCADE;

-- Скрипт для дропа таблицы user_list
DROP TABLE IF EXISTS user_list CASCADE;

-- Скрипт для дропа таблицы game
DROP TABLE IF EXISTS game CASCADE;

-- Скрипт для дропа таблицы tv_show
DROP TABLE IF EXISTS tv_show CASCADE;

-- Скрипт для дропа таблицы comic
DROP TABLE IF EXISTS comic CASCADE;

-- Скрипт для дропа таблицы movie
DROP TABLE IF EXISTS movie CASCADE;

-- Скрипт для дропа таблицы anime
DROP TABLE IF EXISTS anime CASCADE;

-- Скрипт для дропа таблицы studio
DROP TABLE IF EXISTS studio CASCADE;

-- Скрипт для дропа таблицы contest
DROP TABLE IF EXISTS studio_contents CASCADE;

-- Скрипт для дропа таблицы review
DROP TABLE IF EXISTS review CASCADE;

-- Скрипт для дропа таблицы history
DROP TABLE IF EXISTS history CASCADE;

DROP TABLE IF EXISTS rating CASCADE;
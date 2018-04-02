DROP TABLE IF EXISTS learnings;
DROP TABLE IF EXISTS spells;
DROP TABLE IF EXISTS spellbooks;
DROP TABLE IF EXISTS spell_slots;
DROP TABLE IF EXISTS characters;

CREATE TABLE characters(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  level INT,
  c_class VARCHAR(255),
  description TEXT,
  writing_skill INT
);
CREATE TABLE spell_slots(
  id SERIAL8 PRIMARY KEY,
  character_id INT8 REFERENCES characters(id) ON DELETE CASCADE,
  level INT,
  quantity INT
);
CREATE TABLE spellbooks(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  pages INT,
  character_id INT8 REFERENCES characters(id) ON DELETE CASCADE
);
CREATE TABLE spells(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  school VARCHAR(255),
  level INT,
  pages INT,
  description TEXT
);
CREATE TABLE learnings(
  id SERIAL8 PRIMARY KEY,
  spell_id INT8 REFERENCES spells(id) ON DELETE CASCADE,
  spellbook_id INT8 REFERENCES spellbooks(id) ON DELETE CASCADE
);

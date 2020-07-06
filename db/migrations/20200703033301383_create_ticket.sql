-- +micrate Up
CREATE TABLE tickets (
  id INTEGER NOT NULL PRIMARY KEY,
  title VARCHAR,
  url VARCHAR,
  desc TEXT,
  urgency INT NOT NULL,
  solved INT NOT NULL,
  user_id BIGINT NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX 'user_id_idx' ON tickets (user_id);

-- +micrate Down
DROP TABLE IF EXISTS tickets;

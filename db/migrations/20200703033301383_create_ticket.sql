-- +micrate Up
CREATE TABLE tickets (
  id INTEGER NOT NULL PRIMARY KEY,
  title VARCHAR,
  desc TEXT,
  urgency INT,
  solved INT,
  user_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX 'user_id_idx' ON tickets (user_id);

-- +micrate Down
DROP TABLE IF EXISTS tickets;

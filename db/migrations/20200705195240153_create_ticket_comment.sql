-- +micrate Up
CREATE TABLE ticket_comments (
  id INTEGER NOT NULL PRIMARY KEY,
  body TEXT,
  ticket_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX 'ticket_id_idx' ON ticket_comments (ticket_id);
CREATE INDEX 'comment_user_id_idx' ON ticket_comments (user_id);

-- +micrate Down
DROP TABLE IF EXISTS ticket_comments;

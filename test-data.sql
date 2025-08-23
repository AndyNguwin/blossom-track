-- Connect to the 'postgres' database (or any other default database)
\c postgres;

\c "blossom-track";

-- Insert sample users
INSERT INTO Users (first_name, last_name, username, email, password)
VALUES
  ('Alice', 'Smith', 'alice', 'alice@example.com', 'password1'),
  ('Bob', 'Jones', 'bob', 'bob@example.com', 'password2');

-- Insert sample tasks for each user
INSERT INTO Tasks (user_id, name)
VALUES
  (1, 'Drink Water'),
  (1, 'Read Book'),
  (2, 'Exercise'),
  (2, 'Meditate');

-- Insert sample completions (assuming today is 2025-08-22)
INSERT INTO Completions (task_id, date)
VALUES
  (1, '2025-08-22'), -- Alice completed 'Drink Water' today
  (3, '2025-08-22'); -- Bob completed 'Exercise' today
-- Connect to the 'postgres' database (or any other default database)
\c postgres;

\c "blossom-track";

-- ...existing code...

-- Insert 5 sample users
INSERT INTO Users (first_name, last_name, username, email, password)
VALUES
  ('Alice', 'Smith', 'alice', 'alice@example.com', 'password1'),
  ('Bob', 'Jones', 'bob', 'bob@example.com', 'password2'),
  ('Charlie', 'Brown', 'charlie', 'charlie@example.com', 'password3'),
  ('Dana', 'White', 'dana', 'dana@example.com', 'password4'),
  ('Eve', 'Black', 'eve', 'eve@example.com', 'password5');

-- Insert tasks for each user (3-7 tasks per user)
INSERT INTO Tasks (user_id, name) VALUES
  -- Alice (3 tasks)
  (1, 'Drink Water'),
  (1, 'Read Book'),
  (1, 'Morning Walk'),

  -- Bob (4 tasks)
  (2, 'Exercise'),
  (2, 'Meditate'),
  (2, 'Cook Breakfast'),
  (2, 'Write Code'),

  -- Charlie (5 tasks)
  (3, 'Journal'),
  (3, 'Stretch'),
  (3, 'Plan Day'),
  (3, 'Call Family'),
  (3, 'Practice Guitar'),

  -- Dana (6 tasks)
  (4, 'Yoga'),
  (4, 'Study'),
  (4, 'Clean Room'),
  (4, 'Grocery Shopping'),
  (4, 'Water Plants'),
  (4, 'Sketch'),

  -- Eve (7 tasks)
  (5, 'Run'),
  (5, 'Read News'),
  (5, 'Make Coffee'),
  (5, 'Check Emails'),
  (5, 'Feed Cat'),
  (5, 'Write Blog'),
  (5, 'Meditate');

-- Alice (user_id 1, tasks 1-3)
-- Drink Water: 3-day streak
INSERT INTO Completions (task_id, date) VALUES
  (1, '2025-08-20'),
  (1, '2025-08-21'),
  (1, '2025-08-22'),
-- Read Book: 2-day streak
  (2, '2025-08-21'),
  (2, '2025-08-22'),
-- Morning Walk: only today
  (3, '2025-08-22');

-- Bob (user_id 2, tasks 4-7)
-- Meditate: 3-day streak
INSERT INTO Completions (task_id, date) VALUES
  (5, '2025-08-20'),
  (5, '2025-08-21'),
  (5, '2025-08-22'),
-- Exercise: only today
  (4, '2025-08-22'),
-- Cook Breakfast: 2-day streak
  (6, '2025-08-21'),
  (6, '2025-08-22'),
-- Write Code: only today
  (7, '2025-08-22');

-- Charlie (user_id 3, tasks 8-12)
-- Stretch: 3-day streak
INSERT INTO Completions (task_id, date) VALUES
  (9, '2025-08-20'),
  (9, '2025-08-21'),
  (9, '2025-08-22'),
-- Journal: only today
  (8, '2025-08-22'),
-- Plan Day: 2-day streak
  (10, '2025-08-21'),
  (10, '2025-08-22'),
-- Call Family: only today
  (11, '2025-08-22'),
-- Practice Guitar: only today
  (12, '2025-08-22');

-- Dana (user_id 4, tasks 13-18)
-- Water Plants: 3-day streak
INSERT INTO Completions (task_id, date) VALUES
  (17, '2025-08-20'),
  (17, '2025-08-21'),
  (17, '2025-08-22'),
-- Yoga: only today
  (13, '2025-08-22'),
-- Study: only today
  (14, '2025-08-22'),
-- Clean Room: only today
  (15, '2025-08-22'),
-- Grocery Shopping: only today
  (16, '2025-08-22'),
-- Sketch: only today
  (18, '2025-08-22');

-- Eve (user_id 5, tasks 19-25)
-- Feed Cat: 3-day streak
INSERT INTO Completions (task_id, date) VALUES
  (23, '2025-08-20'),
  (23, '2025-08-21'),
  (23, '2025-08-22'),
-- Run: only today
  (19, '2025-08-22'),
-- Read News: only today
  (20, '2025-08-22'),
-- Make Coffee: only today
  (21, '2025-08-22'),
-- Check Emails: only today
  (22, '2025-08-22'),
-- Write Blog: only today
  (24, '2025-08-22'),
-- Meditate: only today
  (25, '2025-08-22');
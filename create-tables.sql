-- Connect to the 'postgres' database (or any other default database)
\c postgres;

-- Drop the 'blossom-track' database if it exists
DROP DATABASE IF EXISTS "blossom-track";

-- Create the 'blossom-track' database
CREATE DATABASE "blossom-track";

\c "blossom-track";

CREATE TABLE IF NOT EXISTS Users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	username VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	password TEXT NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS Tasks (
	id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL REFERENCES Users(id) ON DELETE CASCADE,
	name TEXT NOT NULL,
	is_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS Completions (
	task_id INTEGER NOT NULL REFERENCES Tasks(id) ON DELETE CASCADE,
	date DATE NOT NULL,
	PRIMARY KEY (task_id, date)
);

CREATE USER testuser WITH PASSWORD 'testpassword';
GRANT ALL PRIVILEGES ON DATABASE "blossom-track" TO testuser;
GRANT USAGE, CREATE ON SCHEMA public TO testuser;

GRANT INSERT, SELECT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO testuser;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO testuser;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO testuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO testuser;
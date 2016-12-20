DROP TABLE if exists games;
DROP TABLE if exists publishers;

CREATE TABLE publishers(
id SERIAL8 PRIMARY KEY, 
name VARCHAR(255)
);

CREATE TABLE games(
id SERIAL8 PRIMARY KEY, 
name VARCHAR(255),
quantity INT8,
publisher_id INT8 references publishers(id) ON DELETE CASCADE
);
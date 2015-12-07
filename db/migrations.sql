CREATE DATABASE shopping_list;
\c shopping_list
CREATE TABLE item (id SERIAL PRIMARY KEY, name VARCHAR(255), quantity INT);
CREATE TABLE accounts (id SERIAL PRIMARY KEY, name VARCHAR(255), password_digest VARCHAR(255));

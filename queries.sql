/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE (date_of_birth > '2016-01-01' AND date_of_birth < '2019-01-01');
SELECT name FROM animals WHERE (neutered = TRUE AND espace_attempts < 3);
SELECT date_of_birth FROM animals WHERE (name = 'Pikachu' OR name = 'Agumon');
SELECT name, espace_attempts FROM animals WHERE (weight_kg > 10.5);
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name<> 'Gabumon';
SELECT * FROM animals WHERE (weight_kg >= 10.4 AND weight_kg <= 17.3);

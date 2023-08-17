/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE (date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31');
SELECT name FROM animals WHERE (neutered = TRUE AND escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE (name = 'Pikachu' OR name = 'Agumon');
SELECT name, escape_attempts FROM animals WHERE (weight_kg > 10.5);
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name<> 'Gabumon';
SELECT * FROM animals WHERE (weight_kg >= 10.4 AND weight_kg <= 17.3);

/* From task: query and update animals table */

-- Inside a transaction update animals table by setting the species column to unspecified. Verify change. roll back the change and verify again.
BEGIN TRANSACTION;

UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;

ROLLBACK;

-- Update animals table, set species column to digimon for all animals ending in mon and pokemon for all animals without a species already set.
-- Commit the transaction. Verify that changes persist after commit.

BEGIN TRANSACTION;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'unknown';
SELECT * FROM animals;

COMMIT;

-- Inside a transaction delete all records in the animals table, roll back the transaction. verify if all records.

BEGIN TRANSACTION;

TRUNCATE TABLE animals;
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM animals;

-- Inside a transaction:
-- Delete all animals born after Jan 1st, 2022. Create a savepoint.
-- Update all animals' weight to be their weight multiplied by -1. Rollback to the savepoint
-- Update all animals' weights that are negative to be their weight multiplied by -1.
-- Commit transaction

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT DELETE_AFTER_2022;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT DELETE_AFTER_2022;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

---------

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) AS average_weight FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS average_escape_attempts FROM animals WHERE (date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31') GROUP BY species;

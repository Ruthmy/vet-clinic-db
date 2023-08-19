/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8.0);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.0);

/* From task: query and update animals table */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Charmander', '2020-02-08', 0, FALSE, -11, 'unknown');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7, 'unknown');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13, 'unknown');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45, 'unknown');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4, 'unknown');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17, 'unknown');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species) VALUES ('Ditto', '2022-05-14', 4, TRUE, 22, 'unknown');

/* From task: query multiple tables */

-- Insert data into the owners table.
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert data into the species table.
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Modify animals: If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
-- Modify animals: All other animals are Pokemon
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Sam Smith owns Agumon.
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id = 2 WHERE(name = 'Pikachu' OR name = 'Gabumon');
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE(name = 'Devimon' OR name = 'Plantmon');
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE(name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom');
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE(name = 'Angemon' OR name = 'Boarmon');
/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8.0);
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.0);

/* From task: query and update animals table */

ALTER TABLE animals ADD COLUMN species VARCHAR(50) NOT NULL DEFAULT 'unknown';

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Charmander', '2020-02-08', 0, FALSE, -11, 'unknown');
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7, 'unknown');
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13, 'unknown');
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45, 'unknown');
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4, 'unknown');
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17, 'unknown');
INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg, species) VALUES ('Ditto', '2022-05-14', 4, TRUE, 22, 'unknown');

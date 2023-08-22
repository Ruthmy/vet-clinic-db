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

/* From task: add "join table" for visits */

-- Insert data into the vets table.
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert data for specializations:

-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (vet_id, specialty_id) VALUES (1, 1);
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (vet_id, specialty_id) VALUES (3, 1);
INSERT INTO specializations (vet_id, specialty_id) VALUES (3, 2);
-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (vet_id, specialty_id) VALUES (4, 2);

--Insert data for visits.

-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-05-24', 1, 1);
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-07-22', 1, 3);
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2021-02-02', 2, 4);
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-01-05', 3, 2);
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-03-08', 3, 2);
-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-05-14', 3, 2);
-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2021-05-04', 4, 3);
-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2021-02-24', 6, 4);
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2019-12-21', 7, 2);
-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-08-10', 7, 1);
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2021-04-07', 7, 2);
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2019-09-29', 8, 3);
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-10-03', 9, 4);
-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-11-04', 9, 4);
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2019-01-24', 10, 2);
-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2019-05-15', 10, 2);
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-02-27', 10, 2);
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-08-03', 10, 2);
-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2020-05-24', 11, 3);
-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (date_of_visit, animal_id, vet_id) VALUES ('2021-01-11', 11, 1);

/* FROM WEEK 2 - MILESTONE 5 - Database performance audit */

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, age, email) select 'Owner ' || generate_series(1,2500000), 25, 'owner_' || generate_series(1,2500000) || '@mail.com';

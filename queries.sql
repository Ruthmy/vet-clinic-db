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

-- Inside a transaction, set the species column to unspecified. Verify change. roll back the change and verify again.
BEGIN TRANSACTION;

UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

SELECT * FROM animals; -- verify that change was undone

-- Set species column to digimon for all animals ending in mon and pokemon for all animals without a species already set.
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

-- Inside a transaction: Delete all animals born after Jan 1st, 2022. Create a savepoint.
-- Update all animals' weight to be their weight multiplied by -1. Rollback to the savepoint
-- Update all animals' weights that are negative to be their weight multiplied by -1. Commit transaction

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

---------

/* From task: query multiple tables */

-- What animals belong to Melody Pond?
SELECT animals.name AS animal_name, species.name AS species_name, owners.full_name AS owner_name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name AS animal_name, species.name AS species_name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name AS owner_name, animals.name AS animal_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name AS species_name, COUNT(*) AS total_per_species FROM animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name AS animal_name, species.name AS species_name, owners.full_name AS owner_name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE(owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon');

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name AS animal_name, species.name AS species_name, owners.full_name AS owner_name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE(owners.full_name = 'Dean Winchester' AND escape_attempts = 0);

-- Who owns the most animals?
SELECT owners.full_name AS owner_name, COUNT(*) AS total_owned FROM animals LEFT JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY total_owned DESC LIMIT 1;

/* From task: add "join table" for visits */

-- Who was the last animal seen by William Tatcher?
SELECT animals.name AS animal_name, species.name AS species_name, vets.name AS vet_name, date_of_visit FROM animals JOIN species ON animals.species_id = species.id JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see? 
SELECT COUNT(DISTINCT animal_id) FROM visits WHERE vet_id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet, species.name AS specialty FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializations.specialty_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal_name, date_of_visit, vets.name AS vet_name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit between '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name AS animal_name, COUNT(visits.animal_id) AS total_visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animal_name ORDER BY total_visits DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT date_of_visit, animals.name AS animal_name, vets.name AS vet_name FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT date_of_visit AS most_recent_visit, animals.name AS animal_name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, species.name AS species_name, vets.name AS vet_name FROM visits JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id JOIN vets ON visits.vet_id = vets.id ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id FULL JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.specialty_id WHERE specializations.vet_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS most_viewed_species, COUNT(species.name) FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name LIMIT 1;

/* FROM WEEK 2 - MILESTONE 5 - Database performance audit */

SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM visits where vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';

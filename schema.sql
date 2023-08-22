/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL CHECK (date_of_birth <= CURRENT_DATE),
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL(5,2)
);

/* From task: query and update animals table */
ALTER TABLE animals ADD COLUMN species VARCHAR(50) NOT NULL DEFAULT 'unknown';

/* From task: query multiple tables */

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Make sure that id is set as autoincremented PRIMARY KEY
ALTER TABLE animals ADD PRIMARY KEY (id);
-- Remove column species
ALTER TABLE animals DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT, ADD FOREIGN KEY (species_id) REFERENCES species (id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT, ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

/* From task: add "join table" for visits */

-- Create a table named vets
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age > 18 AND age < 100),
    date_of_graduation DATE NOT NULL CHECK (date_of_graduation <= CURRENT_DATE)
);

-- Create a "join table" specializations to handle the relationship between the tables species and vets.
CREATE TABLE specializations (
    vet_id INT REFERENCES vets (id),
    specialty_id INT REFERENCES species (id),
    PRIMARY KEY (vet_id, specialty_id)
);

-- Create a "join table" visits to handle the relationship between the tables animals and vets, and also track the date of the visit.
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_of_visit DATE NOT NULL CHECK (date_of_visit <= CURRENT_DATE),
    animal_id INT NOT NULL REFERENCES animals (id),
    vet_id INT NOT NULL REFERENCES vets (id)
);

/* FROM WEEK 2 - MILESTONE 5 - Database performance audit */

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add an index to the animal_id column of the visits table
CREATE INDEX idx_visits_animal_id ON visits (animal_id);

-- Add an index to the vet_id column of the visits table
CREATE INDEX idx_visits_vet_id ON visits (vet_id);

-- Create an index for the 'email' column on the owners table
CREATE INDEX index_email ON owners (email);

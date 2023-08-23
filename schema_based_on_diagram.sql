CREATE TABLE IF NOT EXISTS patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT REFERENCES patients(id),
    status VARCHAR NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(8,2) NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

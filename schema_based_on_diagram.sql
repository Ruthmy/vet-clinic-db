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

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR NOT NULL,
  name VARCHAR NOT NULL
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL CHECK (unit_price > 0),
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  total_price DECIMAL CHECK (total_price > 0),
  invoice_id INTEGER REFERENCES invoices(id),
  treatment_id INTEGER REFERENCES treatments(id)
);


CREATE TABLE medical_histories_treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  medical_histories_id INTEGER REFERENCES medical_histories(id),
  treatments_id INTEGER REFERENCES treatments(id)
);


-- Create an index for the patient_id in the medical_histories table
CREATE INDEX patient_id_idx ON medical_histories(patient_id);

-- Create an index for the medical_history_id in the invoices table
CREATE INDEX medical_history_id_idx ON invoices(medical_history_id);

-- Create an index for the invoice_items table
CREATE INDEX invoice_items_invoiceId_idx ON invoice_items (invoice_id);
CREATE INDEX invoice_items_treatmentId_idx ON invoice_items (treatment_id);

-- Create an index for the medical_histories_treatments table
CREATE INDEX medical_histories_treatments_medHisId_idx ON medical_histories_treatments (medical_histories_id);
CREATE INDEX medical_histories_treatments_treatmentsId_idx ON medical_histories_treatments (treatments_id);


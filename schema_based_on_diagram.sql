CREATE TABLE patients (
  id INT,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
  id INT,
  type VARCHAR,
  name VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE history_treatment (
  id SERIAL PRIMARY KEY,
  medical_histories_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id INT,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history__id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history__id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id INT,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

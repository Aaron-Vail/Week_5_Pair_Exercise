BEGIN TRANSACTION;

CREATE TABLE owner (
        owner_id SERIAL, 
        last_name VARCHAR(255) NOT NULL,
        first_name VARCHAR(255) NOT NULL,
        CONSTRAINT pk_owner_id PRIMARY KEY (owner_id)
);

CREATE TABLE pet (
        pet_id SERIAL, 
        type VARCHAR(255) NOT NULL,
        name VARCHAR(255) NOT NULL, 
        age INT NOT NULL, 
        CONSTRAINT pk_pet_id PRIMARY KEY (pet_id)
);

CREATE TABLE procedure (
        procedure_id SERIAL, 
        type VARCHAR(255) NOT NULL, 
        CONSTRAINT pk_procedure_id PRIMARY KEY (procedure_id)
);

CREATE TABLE owner_pet (
        owner_id INT NOT NULL, 
        pet_id INT NOT NULL, 
        CONSTRAINT pk_owner_pet PRIMARY KEY (owner_id, pet_id),
        CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owner(owner_id), 
        CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
);

CREATE TABLE visit (
        visit_id SERIAL,
        pet_id INT NOT NULL,
        visit_date DATE NOT NULL,
        CONSTRAINT pk_visit_id PRIMARY KEY (visit_id), 
        CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
);

CREATE TABLE visit_procedure (
        procedure_id INT NOT NULL, 
        visit_id INT NOT NULL, 
        CONSTRAINT pk_visit_procedure PRIMARY KEY (procedure_id, visit_id),
        CONSTRAINT fk_procedure_id FOREIGN KEY (procedure_id) REFERENCES procedure(procedure_id), 
        CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES visit(visit_id)
);

COMMIT;
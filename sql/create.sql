CREATE TABLE test (id int, name varchar(255));

CREATE TABLE acheteur (
    a_id SERIAL PRIMARY KEY,
    a_mail varchar(100) UNIQUE NOT NULL,
    a_password varchar(50) NOT NULL,
    a_nom varchar(50) NOT NULL,
    a_prenom varchar(50) NOT NULL,
    a_date_creation_compte DATE NOT NULL
);

CREATE TABLE entreprise (
    e_id SERIAL PRIMARY KEY,
    e_name varchar(50) NOT NULL,
    e_mail varchar(100) UNIQUE NOT NULL,
    e_password varchar(50) UNIQUE NOT NULL,
    a_date_creation_compte DATE NOT NULL
);

CREATE TABLE article (
    art_id SERIAL PRIMARY KEY,
    art_name varchar(50) NOT NULL,
    art_description varchar(300) NOT NULL,
    art_prix INTEGER NOT NULL,
    art_encherissement_min INTEGER NOT NULL,
    art_debut_vente DATE NOT NULL,
    art_fin_vente DATE NOT NULL,
    e_id INTEGER REFERENCES entreprise (e_id),
    f_id INTEGER NOT NULL
);

CREATE TABLE encheri (
    a_id INTEGER REFERENCES acheteur (a_id),
    art_id INTEGER REFERENCES article (art_id),
    montant INTEGER NOT NULL,
    PRIMARY KEY(a_id, art_id)
);

CREATE TABLE interesse (
    a_id INTEGER REFERENCES acheteur (a_id),
    art_id INTEGER REFERENCES article (art_id),
    PRIMARY KEY(a_id, art_id)
);

CREATE TABLE acqueri (
    a_id INTEGER REFERENCES acheteur (a_id),
    art_id INTEGER REFERENCES article (art_id),
    est_paye BOOLEAN NOT NULL,
    PRIMARY KEY(a_id, art_id)
);
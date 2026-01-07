-- Création de la table CLIENT
CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    date_inscription DATE NOT NULL
);

-- Création de la table TECHNICIEN
CREATE TABLE technicien (
    id_technicien SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    specialite VARCHAR(100)
);

-- Création de la table TYPE_VEHICULE
CREATE TABLE type_vehicule (
    id_type SERIAL PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL,
    tarif_horaire DECIMAL(6,2) NOT NULL
);

-- Création de la table STATION
CREATE TABLE station (
    id_station SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    adresse VARCHAR(200),
    ville VARCHAR(100)
);

-- Création de la table VEHICULE
CREATE TABLE vehicule (
    id_vehicule SERIAL PRIMARY KEY,
    statut VARCHAR(30) CHECK (statut IN ('disponible','loue','maintenance')),
    niveau_batterie INT CHECK (niveau_batterie BETWEEN 0 AND 100),
    id_type INT REFERENCES type_vehicule(id_type),
    id_station INT REFERENCES station(id_station)
);

-- Création de la table BORNE_RECHARGE
CREATE TABLE borne_recharge (
    id_borne SERIAL PRIMARY KEY,
    puissance_kw INT,
    statut VARCHAR(30),
    id_station INT REFERENCES station(id_station)
);

-- Création de la table RESERVATION
CREATE TABLE reservation (
    id_reservation SERIAL PRIMARY KEY,
    date_reservation DATE,
    date_debut DATE,
    date_fin DATE,
    id_client INT REFERENCES client(id_client),
    id_vehicule INT REFERENCES vehicule(id_vehicule)
);

-- Création de la table LOCATION
CREATE TABLE location (
    id_location SERIAL PRIMARY KEY,
    date_debut DATE,
    date_fin DATE,
    cout_total DECIMAL(8,2),
    id_client INT REFERENCES client(id_client),
    id_vehicule INT REFERENCES vehicule(id_vehicule)
);

-- Création de la table PAIEMENT
CREATE TABLE paiement (
    id_paiement SERIAL PRIMARY KEY,
    date_paiement DATE,
    montant DECIMAL(8,2),
    moyen_paiement VARCHAR(50),
    id_location INT REFERENCES location(id_location)
);

-- Création de la table MAINTENANCE
CREATE TABLE maintenance (
    id_maintenance SERIAL PRIMARY KEY,
    date_intervention DATE,
    description TEXT,
    id_vehicule INT REFERENCES vehicule(id_vehicule),
    id_technicien INT REFERENCES technicien(id_technicien)
);

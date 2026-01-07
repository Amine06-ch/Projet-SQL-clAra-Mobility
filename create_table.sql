-- ================================
-- PROJET CIARA MOBILITY
-- Base de données : gestion de locations
-- Véhicules électriques partagés
-- ================================


-- ================================
-- TABLE : client
-- Stocke les informations des clients
-- ================================
CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,            -- Identifiant unique du client
    nom VARCHAR(100) NOT NULL,                -- Nom du client
    prenom VARCHAR(100) NOT NULL,             -- Prénom du client
    email VARCHAR(150) UNIQUE NOT NULL,       -- Email unique
    telephone VARCHAR(20),                    -- Numéro de téléphone
    date_inscription DATE NOT NULL            -- Date d'inscription
);


-- ================================
-- TABLE : technicien
-- Stocke les techniciens de maintenance
-- ================================
CREATE TABLE technicien (
    id_technicien SERIAL PRIMARY KEY,         -- Identifiant unique du technicien
    nom VARCHAR(100) NOT NULL,                 -- Nom
    prenom VARCHAR(100) NOT NULL,              -- Prénom
    email VARCHAR(150) UNIQUE NOT NULL,        -- Email unique
    telephone VARCHAR(20)                     -- Téléphone
);


-- ================================
-- TABLE : type_vehicule
-- Définit les types de véhicules
-- (voiture, vélo, trottinette, scooter)
-- ================================
CREATE TABLE type_vehicule (
    id_type SERIAL PRIMARY KEY,                -- Identifiant du type
    libelle VARCHAR(100) NOT NULL,             -- Libellé du type
    tarif_horaire NUMERIC(10,2) NOT NULL       -- Tarif horaire
);


-- ================================
-- TABLE : station
-- Représente les stations de recharge
-- ================================
CREATE TABLE station (
    id_station SERIAL PRIMARY KEY,             -- Identifiant de la station
    nom VARCHAR(100) NOT NULL,                 -- Nom de la station
    adresse VARCHAR(200) NOT NULL              -- Adresse
);


-- ================================
-- TABLE : vehicule
-- Stocke les véhicules électriques
-- ================================
CREATE TABLE vehicule (
    id_vehicule SERIAL PRIMARY KEY,            -- Identifiant du véhicule
    statut VARCHAR(50) NOT NULL,               -- Statut du véhicule
    id_type INT NOT NULL,                      -- Type de véhicule
    id_station INT NOT NULL,                   -- Station associée
    FOREIGN KEY (id_type) REFERENCES type_vehicule(id_type),
    FOREIGN KEY (id_station) REFERENCES station(id_station)
);


-- ================================
-- TABLE : reservation
-- Réservations effectuées par les clients
-- ================================
CREATE TABLE reservation (
    id_reservation SERIAL PRIMARY KEY,         -- Identifiant de la réservation
    date_reservation DATE NOT NULL,            -- Date de la réservation
    date_debut DATE NOT NULL,                  -- Début prévu
    date_fin DATE NOT NULL,                    -- Fin prévue
    id_client INT NOT NULL,                    -- Client concerné
    id_vehicule INT NOT NULL,                  -- Véhicule réservé
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule)
);


-- ================================
-- TABLE : location
-- Locations réelles issues des réservations
-- ================================
CREATE TABLE location (
    id_location SERIAL PRIMARY KEY,            -- Identifiant de la location
    date_debut DATE NOT NULL,                  -- Début réel
    date_fin DATE NOT NULL,                    -- Fin réelle
    cout_total NUMERIC(10,2),                  -- Coût total calculé
    id_reservation INT NOT NULL,               -- Réservation associée
    FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation)
);


-- ================================
-- TABLE : paiement
-- Paiements liés aux locations
-- ================================
CREATE TABLE paiement (
    id_paiement SERIAL PRIMARY KEY,            -- Identifiant du paiement
    montant NUMERIC(10,2) NOT NULL,            -- Montant payé
    date_paiement DATE NOT NULL,               -- Date du paiement
    id_location INT NOT NULL,                  -- Location concernée
    FOREIGN KEY (id_location) REFERENCES location(id_location)
);

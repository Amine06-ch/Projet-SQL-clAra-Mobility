
INSERT INTO type_vehicule (libelle, tarif_horaire) VALUES ('Vélo électrique', 5.00), ('Voiture électrique', 15.00);
INSERT INTO station (nom, adresse, ville) VALUES ('Station Bellecour', 'Place Bellecour', 'Lyon'), ('Station Gare', 'Avenue de la Gare', 'Paris');

INSERT INTO client (nom, prenom, email, telephone, date_inscription) VALUES ('Chachou', 'Amine', 'amine@email.com', '0601020304', '2025-01-01'), ('Ndougou', 'Jordan', 'jordan@email.com', '0605060708', '2025-01-02');
INSERT INTO technicien (nom, prenom, specialite) VALUES ('Gomez', 'Lucas', 'Électricité');

INSERT INTO vehicule (statut, niveau_batterie, id_type, id_station) VALUES ('disponible', 95, 1, 1), ('loue', 40, 2, 2);

INSERT INTO reservation (date_reservation, date_debut, id_client, id_vehicule) VALUES ('2025-01-10', '2025-01-11', 1, 2);
INSERT INTO location (date_debut, cout_total, id_client, id_vehicule, id_reservation) VALUES ('2025-01-11', 30.00, 1, 2, 1);

INSERT INTO paiement (date_paiement, montant, moyen_paiement, id_location) VALUES ('2025-01-11', 30.00, 'Carte Bancaire', 1);

SELECT * FROM client;
SELECT * FROM vehicule;
SELECT * FROM location;

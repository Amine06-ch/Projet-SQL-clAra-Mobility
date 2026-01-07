SELECT *
FROM vehicule
WHERE statut = 'disponible';

SELECT v.id_vehicule, t.libelle AS type_vehicule
FROM vehicule v
JOIN type_vehicule t ON v.id_type = t.id_type;

SELECT t.libelle, COUNT(*) AS nb_vehicules
FROM vehicule v
JOIN type_vehicule t ON v.id_type = t.id_type
GROUP BY t.libelle;

SELECT r.id_reservation, r.date_reservation, c.nom, c.prenom
FROM reservation r
JOIN client c ON r.id_client = c.id_client;

SELECT l.id_location, l.date_debut, l.date_fin, c.nom, c.prenom
FROM location l
JOIN reservation r ON l.id_reservation = r.id_reservation
JOIN client c ON r.id_client = c.id_client;

SELECT p.id_paiement, p.montant, p.date_paiement, c.nom, c.prenom
FROM paiement p
JOIN location l ON p.id_location = l.id_location
JOIN reservation r ON l.id_reservation = r.id_reservation
JOIN client c ON r.id_client = c.id_client;

SELECT *
FROM vehicule
WHERE statut = 'loue';

SELECT v.id_vehicule, s.nom AS station
FROM vehicule v
JOIN station s ON v.id_station = s.id_station;

SELECT DISTINCT c.id_client, c.nom, c.prenom
FROM client c
JOIN reservation r ON c.id_client = r.id_client;

SELECT COUNT(*) AS total_paiements
FROM paiement;

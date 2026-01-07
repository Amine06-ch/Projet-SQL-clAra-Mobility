-- 1. Liste des véhicules disponibles
SELECT * FROM vehicule WHERE statut = 'disponible';

-- 2. Liste des véhicules avec leur type
SELECT v.id_vehicule, t.libelle AS type_vehicule
FROM vehicule v
JOIN type_vehicule t ON v.id_type = t.id_type;

-- 3. Nombre de véhicules par type
SELECT t.libelle, COUNT(*) AS nb_vehicules
FROM vehicule v
JOIN type_vehicule t ON v.id_type = t.id_type
GROUP BY t.libelle;

-- 4. Locations d’un client
SELECT * FROM location WHERE id_client = 1;

-- 5. Paiements supérieurs à 50€
SELECT * FROM paiement WHERE montant > 50;

-- 6. Créer une vue des véhicules disponibles
CREATE VIEW vue_vehicules_disponibles AS
SELECT * FROM vehicule WHERE statut = 'disponible';

-- 7. Véhicules de type "Voiture" (sous-requête)
SELECT * FROM vehicule
WHERE id_type = (SELECT id_type FROM type_vehicule WHERE libelle = 'Voiture');

-- 8. Moyenne du tarif horaire des types de véhicules
SELECT AVG(tarif_horaire) AS tarif_moyen FROM type_vehicule;

-- 9. Clients inscrits ce mois
SELECT * FROM client 
WHERE EXTRACT(MONTH FROM date_inscription) = EXTRACT(MONTH FROM CURRENT_DATE);

-- 10. Véhicules avec leur station
SELECT v.id_vehicule, v.statut, s.nom AS station
FROM vehicule v
JOIN station s ON v.id_station = s.id_station;

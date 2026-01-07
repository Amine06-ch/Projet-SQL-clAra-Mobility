# Projet-SQL-clAra-Mobility

# Ciara Mobility - Base de données

## 1. Description du projet

Ce projet consiste à créer une base de données PostgreSQL pour une application de **location de véhicules électriques**.  
L’objectif est de gérer :  

- Les clients  
- Les techniciens  
- Les véhicules et leur type  
- Les stations et bornes de recharge  
- Les réservations et locations  
- Les paiements  
- La maintenance des véhicules  

La base permet d’effectuer des analyses simples (vérifier les véhicules disponibles, suivre les locations et paiements, etc.) et de tester des requêtes SQL avec jointures, vues et sous-requêtes.

---

## 2. Structure du projet

Le repository contient les fichiers suivants :  

| Fichier | Description |
|--------|-------------|
| `create_tables.sql` | Création de toutes les tables avec clés primaires et étrangères |
| `insert_test_data.sql` | Insertion de données de test pour vérifier la base |
| `queries.sql` | Requêtes SQL pour exploiter la base (10 requêtes minimum) |
| `README.md` | Documentation complète du projet |

---

## 3. Modèle logique de données (MLD)

Voici les tables principales avec leurs colonnes et relations :  

### **CLIENT**
- `id_client` PK  
- `nom`  
- `prenom`  
- `email`  
- `telephone`  
- `date_inscription`  

### **TECHNICIEN**
- `id_technicien` PK  
- `nom`  
- `prenom`  
- `specialite`  

### **TYPE_VEHICULE**
- `id_type` PK  
- `libelle`  
- `tarif_horaire`  

### **STATION**
- `id_station` PK  
- `nom`  
- `adresse`  
- `ville`  

### **VEHICULE**
- `id_vehicule` PK  
- `statut` (disponible / loue / maintenance)  
- `niveau_batterie` (0 à 100)  
- `id_type` FK → TYPE_VEHICULE(id_type)  
- `id_station` FK → STATION(id_station)  

### **BORNE_RECHARGE**
- `id_borne` PK  
- `puissance_kw`  
- `statut`  
- `id_station` FK → STATION(id_station)  

### **RESERVATION**
- `id_reservation` PK  
- `date_reservation`  
- `date_debut`  
- `date_fin`  
- `id_client` FK → CLIENT(id_client)  
- `id_vehicule` FK → VEHICULE(id_vehicule)  

### **LOCATION**
- `id_location` PK  
- `date_debut`  
- `date_fin`  
- `cout_total`  
- `id_client` FK → CLIENT(id_client)  
- `id_vehicule` FK → VEHICULE(id_vehicule)  

### **PAIEMENT**
- `id_paiement` PK  
- `date_paiement`  
- `montant`  
- `moyen_paiement`  
- `id_location` FK → LOCATION(id_location)  

### **MAINTENANCE**
- `id_maintenance` PK  
- `date_intervention`  
- `description`  
- `id_vehicule` FK → VEHICULE(id_vehicule)  
- `id_technicien` FK → TECHNICIEN(id_technicien)  

---

## 4. Installation et exécution

### 4.1 Créer la base PostgreSQL

1. Ouvrir **pgAdmin**  
2. Clic droit sur **Databases → Create → Database**  
3. Nom : `ciara_mobility`  
4. Cliquer sur **Save**

---

### 4.2 Créer les tables

1. Ouvrir le fichier `create_tables.sql` dans **Query Tool**  
2. Exécuter le script  
3. Si aucune erreur → toutes les tables sont créées  

---

### 4.3 Ajouter les données de test

1. Ouvrir `insert_test_data.sql` dans **Query Tool**  
2. Exécuter le script  
3. Vérifier les données avec :  

```sql
SELECT * FROM client;
SELECT * FROM vehicule;
SELECT * FROM type_vehicule;
SELECT * FROM station;

4.4 Exécuter les requêtes SQL
Ouvrir queries.sql dans Query Tool

Exécuter le script pour tester les requêtes

Exemples de requêtes :

Liste des véhicules disponibles
SELECT * FROM vehicule WHERE statut = 'disponible';


Nombre de véhicules par type
SELECT t.libelle, COUNT(*) FROM vehicule v
JOIN type_vehicule t ON v.id_type = t.id_type
GROUP BY t.libelle;

Créer une vue des véhicules disponibles
CREATE VIEW vue_vehicules_disponibles AS
SELECT * FROM vehicule WHERE statut = 'disponible';


6. Structure finale du repo GitHub

ciara_mobility/
│
├─ create_tables.sql
├─ insert_test_data.sql
├─ queries.sql
└─ README.md

7. Auteur
Nom : Chachou Amine
      Ndougou Jordan 

Projet réalisé dans le cadre du cours de base de données sql avancé

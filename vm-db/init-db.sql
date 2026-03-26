-- 1. Création de la base de données
CREATE DATABASE IF NOT EXISTS uadb_cloud_db;
USE uadb_cloud_db;

-- 2. Création de la table de test pour la démonstration
CREATE TABLE IF NOT EXISTS status_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insertion d'une donnée initiale
INSERT INTO status_log (event_name) VALUES ('Initialisation du système effectuée');

-- 4. CRÉATION DE L'UTILISATEUR (Étape CRITIQUE pour le réseau)
-- On autorise l'utilisateur 'user_uadb' à se connecter UNIQUEMENT 
-- depuis l'IP de la VM-WEB (192.168.100.10) ou depuis le segment DMZ.
CREATE USER IF NOT EXISTS 'user_uadb'@'192.168.100.10' IDENTIFIED BY 'votre_password_securise';

-- 5. Attribution des privilèges
GRANT ALL PRIVILEGES ON uadb_cloud_db.* TO 'user_uadb'@'192.168.100.10';

-- 6. Application des changements
FLUSH PRIVILEGES;

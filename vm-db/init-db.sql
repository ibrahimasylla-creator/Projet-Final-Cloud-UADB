--Script de configuration MySQL pour la VM3 (LAN)
CREATE DATABASE IF NOT EXISTS uadb_final_db;
USE uadb_final_db;

CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    status VARCHAR(50)
);

INSERT INTO inventory (name, status) VALUES ('VM-WEB', 'Connected'), ('VM-DB', 'Standalone');

-- Création de l'utilisateur pour le lien avec la VM2
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'uadb2026';
GRANT ALL PRIVILEGES ON uadb_final_db.* TO 'admin'@'%';
FLUSH PRIVILEGES;
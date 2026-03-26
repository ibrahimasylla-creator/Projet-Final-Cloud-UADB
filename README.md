 
# Projet Final : Architecture 3-Tiers Virtualisée sur OpenShift
**Étudiant :** Ibrahim Sylla (UADB)
**Enseignant :** Dr. BABOU

## 📋 Description du Projet
Ce projet déploie une infrastructure réseau multi-VM sécurisée composée de :
- **VM1 (Firewall/Passerelle) :** Gère le routage et la sécurité via iptables.
- **VM2 (Serveur Web) :** Serveur Node.js exposé en zone DMZ.
- **VM3 (Base de données) :** Serveur MySQL isolé dans le réseau LAN.

## 🌐 Topologie Réseau
- **DMZ :** 192.168.100.0/24 (Accès Web)
- **LAN :** 192.168.10.0/24 (Données sensibles)



## 📂 Structure du Dépôt
- `/vm-web` : Code source de l'application Node.js.
- `/vm-db` : Scripts d'initialisation de la base de données.
- `/network-pfsense` : Configuration des règles de filtrage (iptables).
- `/openshift-yaml` : Fichiers de configuration pour le déploiement sur OpenShift Virtualization.

## 🚀 Installation
1. Déployer les réseaux DMZ et LAN sur OpenShift.
2. Appliquer les fichiers YAML dans l'ordre : Firewall -> DB -> Web.
3. Exécuter `setup-firewall.sh` sur la VM1.
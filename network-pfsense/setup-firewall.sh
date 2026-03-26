#!/bin/bash

# --- CONFIGURATION DU FIREWALL UADB ---
# IP VM2 (Web) : 192.168.100.10
# IP VM3 (DB)  : 192.168.10.11

echo "Application des règles de sécurité"

# 1. Réinitialisation des règles actuelles
iptables -F
iptables -t nat -F

# 2. Politique par défaut : On refuse tout (Sécurité maximale)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# 3. Autoriser les connexions déjà établies (Loopback et sessions en cours)
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# 4. SSH : Autoriser l'administration de la passerelle
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# 5. DMZ (ACCÈS WEB) : Autoriser le trafic vers le port 3000 (ton serveur Node)
iptables -A FORWARD -p tcp --dport 3000 -j ACCEPT

# 6. LAN (SÉCURITÉ DB) : Autoriser UNIQUEMENT la VM Web à parler à la VM DB
# On ouvre le port 3306 (MySQL) seulement pour l'IP 192.168.100.10
iptables -A FORWARD -s 192.168.100.10 -d 192.168.10.11 -p tcp --dport 3306 -j ACCEPT

echo "Le Firewall est maintenant configuré en mode 3-tiers."
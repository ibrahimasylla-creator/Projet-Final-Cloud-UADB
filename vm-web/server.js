const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send(`
        <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; text-align: center; margin-top: 50px; background-color: #f0f7ff; padding: 40px; border: 2px solid #0078d4; border-radius: 20px; max-width: 600px; margin-left: auto; margin-right: auto;">
            <h1 style="color: #0078d4;">UADB - PROJET FINAL CLOUD</h1>
            <h2 style="color: #333;">Tier 1 : Serveur Web (VM-UBUNTU-WEB)</h2>
            <div style="background-color: #fff; padding: 15px; border-radius: 10px; border-left: 5px solid #ff9900;">
                <p><strong>Réseau :</strong> Zone DMZ (192.168.100.0/24)</p>
                <p><strong>Statut :</strong> <span style="color: green; font-weight: bold;">OPÉRATIONNEL</span></p>
            </div>
            <br>
            <div style="background-color: #fff; padding: 15px; border-radius: 10px; border-left: 5px solid #d83b01;">
                <p><strong>Lien vers Database (LAN) :</strong> <span style="color: #d83b01; font-weight: bold;">BLOQUÉ</span></p>
                <p style="font-size: 0.9em; color: #666;">(En attente des règles de filtrage du Firewall pfSense)</p>
            </div>
        </div>
    `);
});

app.listen(3000, () => {
    console.log("-----------------------------------------");
    console.log("SERVEUR DE DÉMO PRÊT SUR LE PORT 3000");
    console.log("-----------------------------------------");
});
const express = require('express');
const mysql = require('mysql2');
const app = express();

// CONFIGURATION MISE À JOUR : On utilise le nom du SERVICE OpenShift
const dbConfig = {
    host: 'service-db',        // <--- C'est ici le changement crucial
    user: 'user_uadb',
    password: 'votre_password_securise',
    database: 'uadb_cloud_db'
};

app.get('/', (req, res) => {
    const connection = mysql.createConnection(dbConfig);

    connection.connect((err) => {
        let dbStatus = "";
        let dbColor = "";

        if (err) {
            // Si la connexion échoue
            dbStatus = "CONNEXION IMPOSSIBLE AU SERVICE-DB";
            dbColor = "#d83b01"; // Rouge
            console.error('Erreur de connexion MySQL:', err);
        } else {
            // Si la connexion réussit
            dbStatus = "CONNECTÉ AU POD DATABASE (OK)";
            dbColor = "green"; // Vert
            connection.end();
        }

        res.send(`
            <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; text-align: center; margin-top: 50px; background-color: #f0f7ff; padding: 40px; border: 2px solid #0078d4; border-radius: 20px; max-width: 600px; margin-left: auto; margin-right: auto;">
                <h1 style="color: #0078d4;">UADB - PROJET FINAL CLOUD</h1>
                <h2 style="color: #333;">Tier 1 : Serveur Web (VM-UBUNTU-WEB)</h2>
                <div style="background-color: #fff; padding: 15px; border-radius: 10px; border-left: 5px solid #ff9900;">
                    <p><strong>Réseau :</strong> Zone DMZ / Pod Network</p>
                    <p><strong>Statut :</strong> <span style="color: green; font-weight: bold;">OPÉRATIONNEL</span></p>
                </div>
                <br>
                <div style="background-color: #fff; padding: 15px; border-radius: 10px; border-left: 5px solid ${dbColor};">
                    <p><strong>Lien vers Tier 3 (Pod MySQL) :</strong> <span style="color: ${dbColor}; font-weight: bold;">${dbStatus}</span></p>
                    <p style="font-size: 0.9em; color: #666;">(Utilisation de la résolution DNS interne d'OpenShift)</p>
                </div>
            </div>
        `);
    });
});

app.listen(3000, () => {
    console.log("-----------------------------------------");
    console.log("SERVEUR WEB UADB PRÊT SUR LE PORT 3000");
    console.log("-----------------------------------------");
});

apiVersion: v1
kind: Pod
metadata:
  name: pod-db
  labels:
    tier: database
spec:
  containers:
    - name: mysql
      image: mysql:8.0
      # AJOUT ICI : Pour autoriser les connexions du Firewall et de la VM-Web
      args: ["--bind-address=0.0.0.0"]
      resources:
        requests:
          memory: "512Mi"
          cpu: "250m"
        limits:
          memory: "1Gi"
          cpu: "500m"
      env:
        - name: MYSQL_ROOT_PASSWORD
          value: "Uadb@2026"
        - name: MYSQL_DATABASE
          value: "uadb_cloud_db"
        - name: MYSQL_USER
          value: "user_uadb"
        - name: MYSQL_PASSWORD
          value: "Uadb@2026"
      ports:
        - containerPort: 3306
---
apiVersion: v1
kind: Service
metadata:
  name: service-db
spec:
  selector:
    tier: database
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
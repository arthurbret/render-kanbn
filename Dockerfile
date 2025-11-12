# Étape 1 : base Node.js
FROM node:20

# Créer le dossier de travail
WORKDIR /app

# Installer Kanbn globalement
RUN npm install -g https://github.com/kanbn/kan.git

# Créer un dossier de données
RUN mkdir -p /app/data/.kanbn

# Copier un fichier de config par défaut (optionnel)
# Tu pourrais y placer un template Kanbn ici si tu veux

# Exposer le port
EXPOSE 3000

# Variables d'environnement
ENV PORT=3000
ENV KANBN_DIR=/app/data

# Démarrer le serveur Kanbn
CMD ["sh", "-c", "cd /app/data && kanbn init || true && kanbn serve --port ${PORT} --host 0.0.0.0"]

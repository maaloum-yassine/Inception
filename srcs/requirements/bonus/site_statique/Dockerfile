# # Utiliser l'image de base Debian Buster
FROM debian:buster

# # Mettre à jour la liste des paquets
RUN apt update -y

# Installer Node.js et npm
RUN apt install nodejs npm -y

# Créer le répertoire pour les fichiers statiques et définir les permissions
RUN mkdir -p /var/www/html/anon && chmod 755 /var/www/html/anon

# Copier les fichiers statiques dans le répertoire créé
COPY ./tools/anon /var/www/html/anon

# Créer le répertoire de l'application
RUN mkdir /home/app

# Copier le fichier run_server.js dans le répertoire de l'application
COPY ./tools /home/app

# Définir le répertoire de travail
WORKDIR /home/app

# Initialiser un nouveau projet Node.js et installer Express
RUN npm init -y && npm install express -y

# Spécifier la commande par défaut à exécuter lorsque le conteneur démarre
CMD ["node", "run_server.js"]

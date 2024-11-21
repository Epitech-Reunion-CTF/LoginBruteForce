FROM nginx:alpine

# Copier les fichiers de l'application web dans le répertoire de Nginx
COPY ./src /usr/share/nginx/html

# Exposer le port 80 pour le serveur web
EXPOSE 80

# Nginx démarre par défaut, donc pas besoin de CMD ici

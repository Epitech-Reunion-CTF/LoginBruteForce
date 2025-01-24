FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server sudo

# Préparer l'environnement SSH
RUN mkdir /var/run/sshd
RUN echo 'root:toto974toto#@epitech.eu' | chpasswd

# Créer l'utilisateur jaquie avec un mot de passe
RUN useradd -ms /bin/bash jaquie
RUN echo 'jaquie:snickers' | chpasswd

# Ajouter une règle sudo spécifique pour jaquie (uniquement pour cat, sans mot de passe)
RUN echo "jaquie ALL=(ALL) NOPASSWD:/bin/cat" >> /etc/sudoers.d/jaquie \
    && chmod 440 /etc/sudoers.d/jaquie

# Bloquer l'accès à certaines commandes (ex : kill, reboot, shutdown)
RUN echo "jaquie ALL=(ALL) NOPASSWD:/bin/cat, /bin/ls, /bin/echo, /usr/bin/whoami" >> /etc/sudoers.d/jaquie \
    && chmod 440 /etc/sudoers.d/jaquie

# Créer un fichier flag.txt et y insérer un message
RUN touch /home/jaquie/flag.txt
RUN echo 'epictf{d0cker_1s_4w3s0m3}' > /home/jaquie/flag.txt
RUN chown root:root /home/jaquie/flag.txt
RUN chmod 700 /home/jaquie/flag.txt

# Restreindre les permissions pour empêcher la création/suppression de fichiers
RUN chown root:root /home/jaquie \
    && chmod 555 /home/jaquie

# Supprimer l'accès aux commandes potentiellement nuisibles
RUN chmod 000 /bin/kill /sbin/reboot /sbin/shutdown /bin/rm /bin/rmdir

# Configurer SSH
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Exposer le port 22 pour SSH
EXPOSE 22

# Démarrer le serveur SSH
CMD ["/usr/sbin/sshd", "-D"]

FROM ubuntu:20.04
# specifier l'image de base
RUN apt update
# la mette a jour 
RUN apt install curl -y
# installer l'outils curl
RUN cd ~
# changer de repertoire
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# recuperer le packet de nodejs version 18
RUN apt install nodejs -y
# installer nodejs
RUN npx create-react-app tiodong-app
# creer une nouvelle app react
WORKDIR /tiodong-app
# specifier le dossier de travail pour la commande npm start 
EXPOSE 3000
# exposer le port 3000
CMD ["npm", "start"]
# specifier la commande a executer a la creation du conteneur
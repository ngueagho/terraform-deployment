# terraform-deployment
Ce dépôt est destiné à accueillir le code source du script terraform qui cree une deploiement et un service à partir du provider kubernetes. tout ceci à partir d'une image qui va builder un projet react à partir d'un **dockerfile**

## Equipes
* Superviseur: Mr Arouna rashid
* Contributeurs
    * Cherif
    * patrice
	* Roberto
   
## Stack
ce projet est programmé en **HCL** 

## aucun fichier de configuration terraform (.terraform , .hcl , .state) ne doit etre envoyé dans le repository

## pipeline
Avant de commencer à travailler, chacun doit se rassurer au préalable d'avoir récupérer les travaux de ses collaborateurs afin que toute l'équipe ai la même base de code. De ce fait, le workflow quotidien doit être le suivant
```bash
git checkout {{branch}} // branch est votre branche
git pull origin main
git merge main {{branch}}
// commit 1
// commit 2
git push origin {{branch}}
``````
 
  Les commits sur un nombre important de fichiers sont proscits. Ils doivent être ponctuels et spécifique à une activité précise. Par ailleurs les commits doivent être fait avec la syntaxe suivante **{{badge}}: description**. La description du badge doivent être précise et en rapport avec l'action effectuée. {{badge}} est un terme générique qui peut avoir les valeurs suivantes:
* **feat** : Utilisé lorsqu'une nouvelle fonctionnalité a été ajoutée
* **fix** : Utilisé lorsqu\'un bug a été corrigé

* **chore** : Utilisé lorsque la structure globale d\'un grand ensemble a été fortement modifiée
* **cs-fix** : Utilisé lorsqu\'on fait une correction du style de code (par exemple quand on change **ma_variable** par **maVariable**)
* **docs**: Utilisé quand on fait une modification sur le guide d'utilisation (documentation).

# BeerUp
Le client souhaite développer une application mobile « BeerUp » et un site web.
L’application mobile sera à destination du public. À travers cette application, le public pourra noter les bières selon leurs saveurs et donner une note générale ainsi qu’obtenir des suggestions et trouver où acheter/consommer une bière. Le site web sera à destination de ses clients qui pourront à travers celui-ci acheter des vues sponsorisées pour faire ressortir leur bière et/ou établissement.
Une vue sponsorisée correspond à l’affichage d’une bière ou d’un établissement en haut de la liste de recherche ou de suggestion par l’utilisateur.

APPLICATION MOBILE
Le client souhaite développer une application mobile permettant à l’utilisateur de chercher une bière via texte ou photographie d’une bouteille, de la commenter, de la noter et de la réserver dans une bibliothèque « bières favorites » 
L’utilisateur doit pouvoir rechercher une bière par son nom ou encore la liste des bières brassées par un brasseur spécifique.
L’utilisateur doit pouvoir à travers une photo réalisée via l’application pour chercher une bière

Si la bière n’existe pas, l’utilisateur peut ajouter la bière à la base de données
Si l’utilisateur a déjà noté la bière, la page affiche les notes pour modifications éventuelles.
Une fois la bière trouvée l’utilisateur peut donner une note générale de 0 à 5 ainsi que spécifier et noter les différents goûts selon une échelle de 0 à 5. Les différents goûts sont :
1.	Amertume
2.	Houblonné
3.	Caramel
4.	Café
5.	Malté
6.	Sucré
7.	Acide
8.	Fruité

La moyenne de la note générale donnée à la bière par les autres utilisateurs est également affichée
Une option propose de trouver une bière similaire
Une option est également proposée d’ajouter la bière à la bibliothèque des favoris de l’utilisateur.
Dans sa bibliothèque, l’utilisateur doit pouvoir supprimer ses favoris ainsi que retourner vers les bières présentes.

L’utilisateur peut demander des suggestions basées :
•	Selon un algorithme qui reprend les bières de même type déjà dans la bibliothèque de l’utilisateur et les meilleurs classements du mois
•	Selon un algorithme aléatoire des bières avec les meilleures notes du mois
•	Selon un algorithme « surprise » 
•	Dans tous les cas, la première proposition sera une proposition « annonceur » choisie aléatoirement parmi les bières pour lesquelles des vues ont été achetées par un client.
Affichage pour la bière trouvée d’une moyenne de 0 à 5 ainsi que la moyenne des gouts

L’application permet également de faire une recherche sur la page d’une bière avec une carte et localisation de l’utilisateur et d’afficher une page info : (dans un rayon de 20 km)
•	Les magasins qui vendent la bière trouvée 
•	Les bars qui servent la bière trouvée
•	Le premier résultat des 2 recherches est un résultat annonceur avec une vue sponsorisée s’il y en a une dans les 20km et choisi aléatoirement s’il y en a plusieurs.

Une page avec une photo, l’adresse, l’horaire et l’adresse web du bar/magasin est affichée lorsque l’on clique sur le marqueur sur la carte.
Le marqueur sur la carte aura une couleur différente en fonction du fait que le bar/magasin est ouvert ou fermé.
L’utilisateur peut également voir la page d’info du brasseur si elle existe

SITE WEB

Les clients sont regroupés par groupe, chaque groupe peut avoir des établissements, des bières liées aux établissements et éventuellement des bières liées à leur brasserie.
Seules les bières liées à une brasserie appartenant au groupe peuvent faire l’objet d’achat de vue.
Le site se divise en 3 parties : accueil, administration et contact.
La partie administration se découpe en :
•	Gestion des utilisateurs
•	Gestion des bières
•	Gestion des établissements
•	Gestion des achats

Dans la partie gestion des utilisateurs, il doit être possible de changer le rôle des utilisateurs et d’affiner les accès que ceux-ci ont aux différentes parties.
Dans la partie gestion des bières, il doit être possible de modifier les bières liées au groupe et d’en créer de nouvelles.
Dans la partie gestion des établissements et brasseries il doit être possible de modifier les établissements et brasseries liés au groupe du client et d’en créer de nouveaux.
Dans la partie gestion des achats, il doit être possible de visualiser le nombre d’achats de vues sponsorisées réalisés par produit et établissement ainsi que les vues sponsorisées visualisées. De plus, le client doit pouvoir acheter de nouvelles vues sponsorisées et exporter ses factures.
L’administrateur doit pouvoir gérer tous les utilisateurs, bières et établissements. De plus une vue des ventes mensuelles avec des sous-totaux par groupe doit exister


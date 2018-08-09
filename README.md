# Services
## Films, Crypto et Stripe
Ce projet te permettra de te familiariser avec les APIs, les services, et la mise en production

Les APIs c'est le bien. Au lieu de se faire chier à faire des scrappers ou à coder toi même ta base de données de films, il est très possible d'utiliser une API pour intéragir avec d'autres sites. Aujourd'hui, tu vas faire trois sites :

    Un petit outil qui affiche le prix des cryptomonnaies 👌
    un site qui va chercher des titres de films 🎬 et te renvoyer le nom, la date de sortie, l'affiche, et le réalisateur
    un site qui combine Stripe 💰et ActionMailer 📬

1. Scrappeur OKLM

Pour ce projet, nous allons te demander de récupérer ton scrappeur des cours de cryptomonnaies, puis de l'insérer dans une app qui va afficher le cours actuel de la monnaie sélectionnée par l'utilisateur.
1.1 Récap

Cette application sera un formulaire simple, qui va demander le nom de la monnaie demandée, puis afficher le cours actuel de cette monnaie. Pour le nom, tu peux faire un dropdown par exemple.

Cette application n'utilisera pas d'API, mais c'est une excellente façon de jouer avec les services, les controller, et les views.
1.2 Architecture

Elle sera plutôt simple : tu vas faire un service qui va initializer le scrappeur, et stocker toute la données dans un hash, puis tu auras juste à lier le service à ton front.
1.3 Service

Tu te souviens comment créer un service ? 😉

Créé un service StartScrap qui va te renvoyer un hash que tu pourras enregistrer en base et ensuite afficher le tout dans ta vue.

Je te conseille de faire les méthodes suivantes :

    initialize, qui permet de faire passer l'adresse du site à scrapper en paramètre
    perform, qui exécute la tâche
    save qui permet d'enregistrer ton scrap en base de données (on te laisse réfléchir à l'architecture de celle-ci mais ne te prends pas trop la tête)

N'hésite pas à utiliser la console pour vérifier que ton service fonctionne bien !
1.4 Le front

Easy, fais un controller Home avec une méthode index. La méthode index sera la root de ton application. Dans le view index, mets-y un formulaire qui a juste un text-field et de quoi le soumettre.

La méthode index va récupérer le text-field de ton formulaire et le passer dans le service StartScrap. Tu n'as plus qu'à attendre que ton site scrap et affiche le tout sur ta page 😎
2. Movie searcher

Cet exercice sera un peu moins pas à pas, car un skill très important pour les devs est d'aller lire les docs et tester plein de trucs.

Tu dois faire un site qui va te demander sur la page d'accueil de rentrer un nom de film en recherche. Si la recherche renvoie un ou plusieurs films, le site doit afficher les 20 premiers en mentionnant :

    le nom du film
    la date de sortie
    le réalisateur
    une image s'il y en a une

Si la recherche rentre bredouille, le site va renvoyer un truc du genre "yo la recherche n'a rien donné"
2.1. Architecture

Le site aura un service SearchMovie qui prendra un string en paramètre, et qui va renvoyer une array qui contient plein de movies. Cette classe SearchMovie sera liée à un controller Movies et une méthode search. La view search.html.erb devra afficher les résultats de la recherche.
2.2. API ?

La meilleure API pour rechercher des films est TheMovieDB. Cette API a même une gem qui fait tout le travail pour toi. Elle est pas belle la vie ? 😎
3. Stripe & Mailchimp

Ce projet contient deux fonctionnalités que chaque site doit absolument avoir aujourd'hui : le paiement et la newsletter. Le site est simple : il a une home avec un formulaire stripe pour payer et accéder à une newsletter très quali où on s'enregistre avec son mail.

Pour Stripe on te conseille cette vidéo de qui montre comment utiliser leur gem, et tu as aussi leur doc qui est ouf.

Pour la newsletter tu peux utiliser la gem Ruby de Mailchimp 🐒ou bien nos champions de Mailjet 🇫🇷

Pour ce projet, tu vas le réaliser en deux étapes : pour la première, tu vas t'occuper de l'environnement de dev, pour la seconde tu vas devoir le mettre en ligne.
3.1. Développement

Fais comme si tu devais push ton projet sur Heroku (gemfile, premier push, toussa), mais ne te prends pas la tête pour le moment avec les clés d'API sur Heroku (nous verrons cela dans la partie suivante). Pour tes clés d'API, utilise la procédure de mardi avec ActiveStorage.
3.2. Production

Maintenant, fais en sorte de faire marcher ton projet sur Heroku : le site doit t'envoyer un mail pour confirmer ton inscription à la newsletter quand tu remplis le formulaire depuis ton app Heroku. Tu devras parametrer les config vars de Heroku pour ceci.
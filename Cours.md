
Les services

Cette leçon t'apprendra à ranger ton code proprement dans les "services", qui te permettront de faire du PORO.

Là tu es en train de te dire : c'est cool Rails, mais comment je fais pour y mettre le code de mon scrapper de l'infini ? Remplir les controller et y mettre des méthodes scrap_mairies n'est pas très clean, donc nous allons voir un truc cool qui s'appelle les services. Les services sont une feature de Rails (pour changer) qui permettent d'y mettre du PORO (Plain Old Ruby Objects), c'est à dire du code Ruby, que tu pourras appeler où tu veux dans Rails. Plutôt cool, non ?
1. Introduction aux services

Nous allons commencer par un petit tuto fait maison pour que tu fasses ton premier service. Fais une app rails-service, puis créé un dossier services à l'intérieur du dossier app. Dans ce dossier tu peux y mettre tous les services, et les appeler en créant des objets.

Chaque fichier du dossier services invoque une seule class (tu te souviens du tic-tac-toe ? 😉), que tu pourras appeler librement dans ton application rails. Testons. Créé un fichier say_hello.rb dans le dossier services, puis colles-y les lignes suivantes :

class SayHello
  def perform
    p "bonjour"
  end
end

Sauvegarde ton fichier, puis lance ta console, ou relance-la si elle est déjà lancée (très important de relancer la console). Dans la console, rentre, SayHello.new.perform. La console devrait t'afficher "bonjour".

Dans le cas où la console te renvoie une erreur genre NameError: uninitialized constant SayHello, il se peut que tu doives relancer spring avec $ bin/spring stop

Voyons-voir ce que cela a fait. Rails a appelé la classe SayHello, a créé une nouvelle instance de la classe, puis lui a demandé d'éxécuter la méthode perform. C'est la convention à utiliser pour les services : il faut créer une classe par fichier, qui fait un truc précis (dire bonjour, encaisser un user, chercher un film sur une API), pour pouvoir appeler la méthode perform qui exécute tout ce que la classe doit réaliser.

Tu auras remarqué que l'on a appelé le fichier say_hello.rb et la classe SayHello. C'est (encore) une convention de Rails. Le nom du fichier doit être le snake_case du nom de la classe.

Tu peux appeler tes services où tu veux. Par exemple dans tes controllers, avec la syntaxe SayHello.new.perform. Les services permettent d'avoir du code propre et bien rangé, et de ne pas remplir les controllers.
2. Quelques articles

    NetGuru ont fait un bon article qui explique les services
    Rob Race a fait aussi un bon article sur les services

API : clés et jouer avec

Qu'est-ce qu'une API ? Comment ranger proprement ses clés d'API dans une app Rails ? Nous allons voir ceci dans cette leçon.
1. APIs

Il y a plusieurs façons d'appeler une API, et en fonction des APIs tu devras utiliser des façons différentes. Nous te donnons un peu de lecture que tu pourras faire à l'occasion pour te familiariser avec les APIs 👌

    Voici un article de The Odin Project qui explique brièvement quelques termes pour les APIs
    Si tu veux aller plus loin sur les APIs, Zapier ont fait un excellent e-book de ~80 pages qui explique l'univers des APIs

2. Clés d'API

Tu dois t'en souvenir grâce à Ruby : jouer avec les clés d'APIs n'est pas tâche aisée. Alors imagine en mixant dévelopement, production, et différents compte. Par exemple, pour tester Stripe, tu ne vas pas te facturer 10€ pour tester ton service de paiement : tu devras donc avoir une clé pour les tests (la clé de test), et une clé pour la production (la clé de production).

Heureusement, ce n'est pas si compliqué que cela grâce à Dotenv et Heroku.
2.1. Clés en dev & test

Pour le dev et les tests, tu peux utiliser la gem dotenv qui est pas mal du tout pour bien gérer ses clés d'API sans avoir à s'en préoccuper.

📈 Bon plan du jour 🎁 : j'ai fait une cheat-sheet sur Dotenv que tu peux utiliser pour te familiariser avec la gem.
2.2. Clés en production

Et bien figure-toi que ce n'est pas si compliqué que ça de balancer les clés d'APIs sur Heroku. Heroku a ce qu'on appelle des config vars : tu lui donnes le nom de ta variable (comme tu les appèlerais dans le fichier .env, la valeur de la variable (la clé) puis le tour est joué 😇

Pour configurer les clés, tu peux le faire via CLI, ou même via l'interface de Heroku. La doc de Heroku explique comment faire cela.
2.3 La méthode Rails 5.2

Comme tout, il y a une méthode Rails pour travailler avec les clés d'API comme on l'a vu avec la configuration d'ActiveStorage. Ce tuto explique plutôt bien comment ça marche. En gros tu mets toutes tes clés avec la procédure qu'on a déjà vu et ensuite tu mets uniquement ta MASTER_KEY sur heroku.

Pour être à la pointe du progrès, on te conseille d'utiliser cette dernière méthode.
L'Action Mailer

Comment envoyer des emails avec Rails ? Grâce à l'Action Mailer !

Faire marcher des emails en Rails est heureusement pas si compliqué que cela. Rails a prévu un super outil qui s'appelle l'Action Mailer, simple à utiliser et paramétrer.
1. Les bases de l'Action Mailer

En gros il suffit d'appeler le mailer quasiment comme un service MachinMailer.newsletter_email(jolis_params).deliver, puis cela envoie l'email. Il te faudra brancher par quel service ton Action Mailer va passer en production, avec les bonnes clés d'API, puis de brancher un service qui permet de lire tes emails en développement, et à toi la gloire.

Voici quelques ressources pour savoir se servir de l'Action Mailer

    Tu peux regarder la vidéo de Grafikart à ce sujet. Comme d'hab il va assez loin, mais c'est une bonne intro au sujet
    La doc a prévu une bonne explication de l'Action Mailer
    SitePoint ont fait un un bon tutoriel qui va assez loin lui aussi

2. Action Mailer en production

Maintenant que tu as vu les bases de l'Action Mailer, il faut paramétrer ton application pour lui dire "hey, en development et en test tu utilises tel service pour les emails" (spoiler : un truc qui n'envoie rien), puis lui dire "hey, en production tu utilises tel service" (spoiler : un service qui envoie des mails).

Pour la partie développement, tu peux utiliser l'outil de base (le serveur), ou bien une gem comme Letter Opener qui est assez cool.

Pour la production, tu peux utiliser le service que tu aimes bien. SitePoint ont fait un récap des différents services, mais nous avons une préférence pour MailJet à THP : la version gratuite est très permissive, c'est facile à paramétrer, et ils sont français 🇫🇷
Jolis READMEs

Tu verras comment maîtriser le Mardkdown et faire un joli README. Un dossier bien présenté, c'est comme du code bien écrit : ça donne envie de le lire.
1. Markdown

Voici quelques sites pour connaître les bases du markdown, ainsi que ses possibilités :

    Le guide officiel de Github est une référence !
    Les cheat-sheets de Github t'aideront beaucoup

2. Exemples

Puisque c'est toi, nous allons te donner un ou deux exemples de repo Github avec un README stylay 😉

    General Assembly ont en général des super tutos, écrits en Markdown, comme celui sur les routes de Rails
    Awesome sont partout, ils ont même fait un README sur les READMEs. So méta.


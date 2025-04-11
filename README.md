🌍 OdyNest
OdyNest est une plateforme de réservation d'expériences locales immersives à travers le monde. Elle connecte les voyageurs à des prestataires passionnés, pour vivre des moments authentiques et inoubliables.

🚀 Fonctionnalités principales:

🎟️ Réservation d'expériences selon lieu, budget, ambiance, etc.

🧑‍💼 Espaces dédiés pour les prestataires (dashboard, création, gestion de profils).

🔐 Authentification avec Devise (utilisateurs et prestataires).

📸 Ajout de photos via Active Storage (pour profils & expériences).

🧭 Quiz interactif pour recommander des expériences personnalisées.

💬 Système d’avis après participation à une expérience.

🛒 Paiement Stripe pour les réservations.

🛠️ Interface admin pour la gestion des utilisateurs, prestataires et expériences.

📄 Pages légales : mentions légales, politique de confidentialité, CGU.

⚙️ Stack technique:

Ruby on Rails 8

PostgreSQL (base de données)

Bootstrap 5.3

Active Storage (upload fichiers/images)

Devise (authentification)

Stimulus.js (comportements dynamiques)

Propshaft (gestion des assets)

Stripe (paiement)

Turbo/Hotwire (réactivité)

# Lien en ligne : http://87.106.231.213
Lien Whimsical : https://whimsical.com/odynest-F9bSTBhGuXtwZKgb5Cnm3w

🔧 Installation:

bash
Copier
Modifier
git clone https://github.com/Jade-m22/Odynest_Project.git
cd Odynest_Project
bundle install
rails db:create db:migrate
rails db:seed
Lancer le serveur
bash
Copier
Modifier
bin/dev
📦 Stockage de fichiers
Active Storage est configuré pour le développement :

yml
Copier
Modifier

# config/storage.yml

local:
service: Disk
root: <%= Rails.root.join("storage") %>
Pour la production, configure config/environments/production.rb et choisis un service distant comme Amazon S3, Google Cloud Storage, etc.

🔑 Variables d'environnement:

Crée un fichier .env ou utilise credentials.yml.enc pour :

bash
Copier
Modifier
STRIPE_SECRET_KEY=xxx
STRIPE_PUBLIC_KEY=xxx

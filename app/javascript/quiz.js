window.showRecommendation = function () {
  const audience = document.getElementById("audience").value;
  const theme = document.getElementById("theme").value;
  const budget = document.getElementById("budget").value;
  const result = document.getElementById("quiz-result");

  let suggestion =
    "🤔 Nous vous recommandons une expérience culturelle en ville.";

  if (audience === "couple") {
    if (theme === "detente") {
      if (budget === "faible")
        suggestion = "🛶 Balade en barque au coucher du soleil à Annecy";
      else if (budget === "moyen") suggestion = "🌅 Massage en duo à Barcelone";
      else suggestion = "🏝️ Week-end spa dans un hôtel 5* à Santorin";
    }
    if (theme === "romantique") {
      if (budget === "faible")
        suggestion = "🌇 Pique-nique au bord de la Seine à Paris";
      else if (budget === "moyen")
        suggestion = "🍷 Dégustation de vin dans un vignoble à Bordeaux";
      else suggestion = "🌌 Dîner gastronomique sous les étoiles à Rome";
    }
    if (theme === "culture") {
      if (budget === "faible")
        suggestion = "🎨 Visite d’un musée gratuit à Madrid";
      else if (budget === "moyen")
        suggestion = "🏰 Visite guidée du palais royal de Vienne";
      else suggestion = "🎭 Spectacle d’opéra à Venise avec dîner inclus";
    }
    if (theme === "insolite") {
      if (budget === "faible")
        suggestion = "🗺️ Balade urbaine avec défis à Prague";
      else if (budget === "moyen")
        suggestion = "🌃 Nuit dans un igloo en Suisse";
      else suggestion = "🚁 Vol en hélicoptère au-dessus de Monaco";
    }
    if (theme === "aventure") {
      if (budget === "faible") suggestion = "🚵 Balade en VTT dans les Vosges";
      else if (budget === "moyen")
        suggestion = "🧗 Escalade dans les gorges du Verdon";
      else suggestion = "🪂 Saut en parachute tandem à Dubaï";
    }
  }

  if (audience === "solo") {
    if (theme === "aventure") {
      if (budget === "faible")
        suggestion = "🚣 Excursion en kayak à la journée";
      else if (budget === "moyen")
        suggestion = "🏞️ Randonnée en solo dans les Alpes";
      else suggestion = "🏕️ Trek solo avec bivouac encadré en Écosse";
    }
    if (theme === "bien-etre") {
      if (budget === "faible")
        suggestion = "🧘‍♂️ Séance de yoga dans un parc à Paris";
      else if (budget === "moyen")
        suggestion = "🛁 Journée hammam et massage à Marrakech";
      else suggestion = "🧖‍♂️ Retraite bien-être 3 jours au Portugal";
    }
    if (theme === "culture") {
      if (budget === "faible")
        suggestion = "📚 Tour de librairies et musées à Bruxelles";
      else if (budget === "moyen")
        suggestion = "🎬 Cinéma en plein air et visite historique à Berlin";
      else suggestion = "🎼 Séjour musical à Vienne avec pass concerts";
    }
    if (theme === "insolite") {
      if (budget === "faible")
        suggestion = "🕵️‍♂️ Escape Game en extérieur à Bruxelles";
      else if (budget === "moyen")
        suggestion = "🧳 Jeu de piste GPS dans les rues de Naples";
      else suggestion = "🪐 Expérience immersive en réalité virtuelle à Tokyo";
    }
    if (theme === "detente") {
      if (budget === "faible")
        suggestion = "☕ Pause café littéraire dans un salon cosy à Lyon";
      else if (budget === "moyen")
        suggestion = "🧖‍♂️ Spa urbain avec soins à Milan";
      else suggestion = "⛵ Croisière méditative en catamaran privé";
    }
  }

  if (audience === "amis") {
    if (theme === "culture") {
      if (budget === "faible")
        suggestion = "🖼️ Visite de galeries d’art à Marseille";
      else if (budget === "moyen")
        suggestion = "🎭 Visite guidée street art à Berlin";
      else suggestion = "🎨 Atelier créatif + expo VIP à Londres";
    }
    if (theme === "detente") {
      if (budget === "faible")
        suggestion = "🎮 Soirée gaming et chill dans un café geek";
      else if (budget === "moyen")
        suggestion = "🌊 Croisière apéro en bateau à Marseille";
      else suggestion = "🍾 Week-end détente en villa avec piscine à Ibiza";
    }
    if (theme === "insolite") {
      if (budget === "faible")
        suggestion = "👻 Chasse au fantôme interactive dans un vieux quartier";
      else if (budget === "moyen")
        suggestion = "🎉 Chasse au trésor urbaine à Lisbonne";
      else suggestion = "🎡 Nuit dans un parc d’attractions privatisé";
    }
    if (theme === "aventure") {
      if (budget === "faible")
        suggestion = "🎯 Parc aventure + paintball en extérieur";
      else if (budget === "moyen")
        suggestion = "🛶 Canyoning entre amis dans les Pyrénées";
      else suggestion = "🚁 Saut en parachute en tandem en groupe";
    }
    if (theme === "romantique") {
      if (budget === "faible") suggestion = "🍹 Afterwork rooftop à Nice";
      else if (budget === "moyen")
        suggestion = "🎷 Jazz club et dégustation de vin à Paris";
      else suggestion = "🍽️ Expérience culinaire avec chef privé à Prague";
    }
  }

  if (audience === "famille") {
    if (theme === "aventure") {
      if (budget === "faible") suggestion = "🧗‍♀️ Parc accrobranche près de Lyon";
      else if (budget === "moyen")
        suggestion = "🚲 Balade en vélo électrique autour du lac Léman";
      else suggestion = "🎢 Séjour au parc Astérix avec nuit d’hôtel";
    }
    if (theme === "culture") {
      if (budget === "faible")
        suggestion = "🏺 Visite d’un musée gratuit avec audioguide enfant";
      else if (budget === "moyen")
        suggestion = "🏰 Visite du château de Chambord en réalité augmentée";
      else
        suggestion = "🎬 Studio Harry Potter à Londres avec guide francophone";
    }
    if (theme === "insolite") {
      if (budget === "faible")
        suggestion = "🦖 Chasse au trésor préhistorique dans un parc local";
      else if (budget === "moyen")
        suggestion = "🧪 Atelier science ludique pour enfants à Toulouse";
      else suggestion = "🚀 Nuit dans un planétarium avec projection immersive";
    }
    if (theme === "detente") {
      if (budget === "faible")
        suggestion = "🍦 Détente au bord d’un étang avec activités nature";
      else if (budget === "moyen")
        suggestion = "🧺 Pique-nique guidé dans un jardin botanique";
      else suggestion = "⛵ Mini croisière famille sur la côte bretonne";
    }
  }

  result.innerHTML = `<div class="alert alert-info"><strong>${suggestion}</strong></div>`;
};

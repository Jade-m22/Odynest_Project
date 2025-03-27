window.showRecommendation = function () {
  const audience = document.getElementById("audience").value;
  const theme = document.getElementById("theme").value;
  const budget = document.getElementById("budget").value;
  const result = document.getElementById("quiz-result");

  let suggestion =
    "🤔 Nous vous recommandons une expérience culturelle en ville.";

  // Suggestions enrichies
  if (audience === "couple" && theme === "detente" && budget === "moyen") {
    suggestion = "🌅 Massage en duo à Barcelone";
  } else if (audience === "solo" && theme === "aventure") {
    suggestion = "🏞️ Randonnée en solo dans les Alpes";
  } else if (audience === "amis" && theme === "insolite") {
    suggestion = "🎉 Chasse au trésor urbaine à Lisbonne";
  } else if (audience === "famille" && theme === "culture") {
    suggestion = "🏰 Visite du château de Chambord en réalité augmentée";
  } else if (audience === "couple" && theme === "romantique") {
    suggestion = "🌌 Dîner gastronomique sous les étoiles à Rome";
  } else if (
    audience === "solo" &&
    theme === "bien-etre" &&
    budget === "faible"
  ) {
    suggestion = "🧘‍♂️ Séance de yoga dans un parc à Paris";
  } else if (audience === "amis" && theme === "culture" && budget === "moyen") {
    suggestion = "🎭 Visite guidée street art à Berlin";
  } else if (audience === "famille" && theme === "aventure") {
    suggestion = "🧗‍♀️ Parc accrobranche près de Lyon";
  } else if (audience === "solo" && theme === "insolite") {
    suggestion = "🕵️‍♂️ Escape Game en extérieur à Bruxelles";
  } else if (
    audience === "couple" &&
    theme === "culture" &&
    budget === "faible"
  ) {
    suggestion = "🎨 Visite d’un musée gratuit à Madrid";
  } else if (audience === "amis" && theme === "detente" && budget === "moyen") {
    suggestion = "🌊 Croisière apéro en bateau à Marseille";
  } else if (
    audience === "famille" &&
    theme === "insolite" &&
    budget === "faible"
  ) {
    suggestion = "🦖 Chasse au trésor préhistorique dans un parc local";
  }

  result.innerHTML = `<div class="alert alert-info"><strong>${suggestion}</strong></div>`;
};

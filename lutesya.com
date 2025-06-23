<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <title>Lutesya◝🍥</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet" />
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      background: #121212;
      color: #eee;
      text-align: center;
    }

    .logo {
      width: 80px;
      margin-top: 20px;
    }

    header {
      padding: 20px;
    }

    .btn-discord {
      display: inline-block;
      margin: 15px 0;
      padding: 10px 25px;
      background: #7289da;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-weight: 700;
      transition: background 0.3s;
    }

    .btn-discord:hover {
      background: #5b6eae;
    }

    .member-count {
      font-size: 1.2rem;
      margin-top: 10px;
    }

    .section {
      max-width: 900px;
      margin: 40px auto;
      padding: 0 20px;
      text-align: left;
    }

    .about-images {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-top: 20px;
    }

    .about-images img {
      width: 120px;
      height: auto;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.5);
    }

    footer {
      padding: 20px;
      font-size: 0.9rem;
      color: #888;
      background: #1a1a1a;
      margin-top: 50px;
    }

    #particles-js {
      position: fixed;
      width: 100%;
      height: 100%;
      z-index: -1;
      top: 0;
      left: 0;
    }
  </style>
</head>
<body>
  <div id="particles-js"></div>
  <header>
    <img src="https://drive.google.com/uc?export=view&id=14iPhRvyEnEFAidbJfGP0bgWM4BSwDkQp" alt="Logo Lutesya◝🍥" class="logo" />
    <h1>Lutesya◝🍥</h1>
    <p>Rejoins un univers élégant où règnent détente, discussions chill et vraie ambiance de confiance.</p>
    <a href="https://discord.gg/MxTfHxeSJm" class="btn-discord" target="_blank" rel="noopener noreferrer">Rejoindre le serveur Discord</a>
    <p class="member-count">👥 Membres : <span id="count">…</span></p>
  </header>

  <main>
    <section id="about" class="section">
      <h2>À propos</h2>
      <p>Bienvenue sur Lutesya◝🍥 ! Notre serveur est un espace chaleureux pour échanger, jouer, partager et se sentir vraiment chez soi. Que tu sois fan de gaming, culture ou créatif, tu trouveras ta place avec nous.</p>
      <div class="about-images">
        <img src="https://drive.google.com/uc?export=view&id=134kvbQrh4HWAnap9gc7MA-wQUPkIN5OQ" alt="Image 1" />
        <img src="https://drive.google.com/uc?export=view&id=1NB4G2G8xaub3hVAIIqnr3gHYOd5ISgzg" alt="Image 2" />
        <img src="https://drive.google.com/uc?export=view&id=18NIpB5r2-GNrh-Uh1wc--Rg3ksgbzukW" alt="Image 3" />
      </div>
    </section>
    <section id="staff" class="section">
      <h2>Le staff</h2>
      <ul>
        <li><strong>👑 3qsn</strong> — Fondateur</li>
        <li><strong>🛡️ Shiro</strong> — Staff</li>
      </ul>
    </section>
    <section id="rules" class="section">
      <h2>Règles</h2>
      <ul>
        <li>1. Reste poli et respectueux.</li>
        <li>2. Pas de spam ni publicité non autorisée.</li>
        <li>3. Pas de contenu NSFW.</li>
        <li>4. Suis les directives des modérateurs.</li>
        <li>5. Amuse-toi et profite !</li>
      </ul>
    </section>
  </main>

  <footer>&copy; 2025 Lutesya◝🍥 — Tous droits réservés.</footer>

  <!-- particles.js -->
  <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", () => {
      particlesJS("particles-js", {
        particles: {
          number: { value: 80, density: { enable: true, value_area: 800 } },
          color: { value: "#ffffff" },
          shape: { type: "circle" },
          opacity: { value: 0.5 },
          size: { value: 3, random: true },
          line_linked: {
            enable: true,
            distance: 150,
            color: "#ffffff",
            opacity: 0.4,
            width: 1
          },
          move: {
            enable: true,
            speed: 3,
            direction: "none",
            out_mode: "out"
          }
        },
        interactivity: {
          events: {
            onhover: { enable: true, mode: "grab" },
            onclick: { enable: true, mode: "push" }
          },
          modes: {
            grab: { distance: 140, line_linked: { opacity: 1 } },
            push: { particles_nb: 4 }
          }
        },
        retina_detect: true
      });

      async function fetchMemberCount() {
        const GUILD_ID = "1381018645806846133"; // Remplace avec le bon ID si besoin
        const url = `https://discord.com/api/guilds/${GUILD_ID}/widget.json`;
        try {
          const res = await fetch(url);
          const data = await res.json();
          document.getElementById("count").textContent = data.presence_count ?? "N/A";
        } catch (e) {
          document.getElementById("count").textContent = "N/A";
        }
      }

      fetchMemberCount();
      setInterval(fetchMemberCount, 60000);
    });
  </script>
</body>
</html>

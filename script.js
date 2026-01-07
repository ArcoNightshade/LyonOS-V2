document.addEventListener('DOMContentLoaded', () => {
    console.log("LyonOS Script Loaded v2"); // Debug check

    // 1. Typing Animation
    const textElement = document.getElementById('typing-text');
    const outputElement = document.getElementById('terminal-output');
    
    if (textElement && outputElement) {
        const textToType = "nix flake show github:ArcoNightshade/LyonOS-V2";
        let index = 0;

        function type() {
            if (index < textToType.length) {
                textElement.textContent += textToType.charAt(index);
                index++;
                setTimeout(type, 30 + Math.random() * 40);
            } else {
                setTimeout(() => {
                    outputElement.classList.remove('hidden');
                }, 400);
            }
        }
        setTimeout(type, 500);
    }

    // 2. Copy Logic
    const copyBtn = document.getElementById('copyBtn');
    if (copyBtn) {
        copyBtn.addEventListener('click', () => {
            const code = document.getElementById('flake-uri').textContent;
            navigator.clipboard.writeText(code).then(() => {
                const originalText = copyBtn.textContent;
                copyBtn.textContent = "Copied!";
                copyBtn.style.background = "#27c93f";
                setTimeout(() => {
                    copyBtn.textContent = originalText;
                    copyBtn.style.background = "";
                }, 2000);
            });
        });
    }

    // --- EASTER EGG 1: MAX VERSTAPPEN (KONAMI) ---
    const konamiCode = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
    let konamiIndex = 0;

    document.addEventListener('keydown', (e) => {
        const key = e.key;
        // Check key match (insensitive for letters)
        const requiredKey = konamiCode[konamiIndex];
        const isMatch = (key === requiredKey) || (key.toLowerCase() === requiredKey);

        if (isMatch) {
            konamiIndex++;
            if (konamiIndex === konamiCode.length) {
                activateSuperMax();
                konamiIndex = 0;
            }
        } else {
            konamiIndex = 0;
        }
    });

    // --- EASTER EGG 2: CLICK THE LOGO (New!) ---
    let logoClicks = 0;
    const logo = document.querySelector('.logo');
    if (logo) {
        logo.addEventListener('click', () => {
            logoClicks++;
            if (logoClicks === 5) {
                activateSuperMax();
                logoClicks = 0;
            }
        });
    }

    function activateSuperMax() {
        console.log("MAX VERSTAPPEN MODE ACTIVATED");
        document.documentElement.style.setProperty('--accent', '#FF8700');
        document.documentElement.style.setProperty('--accent-glow', 'rgba(255, 135, 0, 0.6)');
        const heroTitle = document.querySelector('.hero h1');
        if (heroTitle) {
            heroTitle.innerHTML = 'SUPER <span class="gradient-text">MAX</span> MODE.';
        }
    }

    // --- EASTER EGG 3: CONSOLE HELLDIVERS ---
    console.log("%cSWEET LIBERTY MY LEGS!", "color: yellow; font-size: 20px; font-weight: bold; background: black; padding: 10px;");
    console.log("System initialization complete. Freedom delivery systems online.");
});

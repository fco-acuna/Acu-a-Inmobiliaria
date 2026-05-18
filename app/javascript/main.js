// Esperar a que el DOM esté listo
console.log('🟢 main.js CARGADO CORRECTAMENTE'); 
document.addEventListener('turbo:load', function() {
  // ===== HEADER SCROLL =====
  const header = document.getElementById('main-header');
  if (header) {
    window.addEventListener('scroll', function() {
      if (window.scrollY > 50) {
        header.classList.add('scrolled');
      } else {
        header.classList.remove('scrolled');
      }
    });
  }

  // ===== HERO SLIDESHOW =====
  const heroSlides = document.querySelectorAll('.hero-slide');
  if (heroSlides.length > 0) {
    let currentHeroSlide = 0;
    const totalHeroSlides = heroSlides.length;

    function nextHeroSlide() {
      heroSlides[currentHeroSlide].classList.remove('active');
      currentHeroSlide = (currentHeroSlide + 1) % totalHeroSlides;
      heroSlides[currentHeroSlide].classList.add('active');
    }

    setInterval(nextHeroSlide, 5000);
  }

  // ===== ANIMATED COUNTERS (CORREGIDO) =====
  let countersAnimated = false;
  function animateCounters() {
    if (countersAnimated) return;
    
    const statNumbers = document.querySelectorAll('.stat-number[data-target]');
    if (statNumbers.length === 0) return;
    
    const observerOptions = { threshold: 0.5 };
    const observer = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          countersAnimated = true;
          
          statNumbers.forEach(stat => {
            const target = parseInt(stat.getAttribute('data-target'));
            const duration = 2000;
            const increment = target / (duration / 16);
            let current = 0;

            const timer = setInterval(() => {
              current += increment;
              if (current >= target) {
                stat.textContent = target + '+';
                clearInterval(timer);
              } else {
                stat.textContent = Math.floor(current) + '+';
              }
            }, 16);
          });
          
          observer.disconnect();
        }
      });
    }, observerOptions);

    const statsContainer = document.querySelector('.stats-container');
    if (statsContainer) {
      observer.observe(statsContainer);
    }
  }
  animateCounters();

  // ===== SERVICES EXPANDABLE =====
  const serviceCards = document.querySelectorAll('.service-item-card');
  serviceCards.forEach(card => {
    card.addEventListener('click', function() {
      const isExpanded = this.classList.contains('expanded');
      
      serviceCards.forEach(c => c.classList.remove('expanded'));
      
      if (!isExpanded) {
        this.classList.add('expanded');
      }
    });
  });

  // ===== REVIEWS SLIDESHOW (CORREGIDO COMPLETO) =====
  const reviewsGrids = document.querySelectorAll('.reviews-grid');
  const reviewDots = document.querySelectorAll('.slideshow-dot');
  
  if (reviewsGrids.length > 0 && reviewDots.length > 0) {
    let currentReviewSlide = 0;
    let autoSlideInterval;

    function showReviewSlide(index) {
      // Ocultar TODOS
      reviewsGrids.forEach(grid => {
        grid.classList.remove('active');
        grid.style.display = 'none';
      });
      
      reviewDots.forEach(dot => dot.classList.remove('active'));
      
      // Mostrar el seleccionado
      if (reviewsGrids[index]) {
        reviewsGrids[index].classList.add('active');
        reviewsGrids[index].style.display = 'flex';
      }
      
      if (reviewDots[index]) {
        reviewDots[index].classList.add('active');
      }
      
      currentReviewSlide = index;
    }

    // CLICK DOTS (CORREGIDO)
    reviewDots.forEach((dot, index) => {
      dot.addEventListener('click', function(e) {
        e.preventDefault();
        showReviewSlide(index);
        clearInterval(autoSlideInterval); // Pausar auto
        // Reiniciar auto
        autoSlideInterval = setInterval(() => {
          currentReviewSlide = (currentReviewSlide + 1) % reviewsGrids.length;
          showReviewSlide(currentReviewSlide);
        }, 6000);
      });
    });

    // Auto-slide
    function nextReviewSlide() {
      currentReviewSlide = (currentReviewSlide + 1) % reviewsGrids.length;
      showReviewSlide(currentReviewSlide);
    }

    autoSlideInterval = setInterval(nextReviewSlide, 6000);
    showReviewSlide(0); // Inicial
  }

  // ===== FADE IN ANIMATIONS (CORREGIDO para usar .scrolled) =====
  const fadeElements = document.querySelectorAll('.fade-in, .fade-in-left, .fade-in-right');
  const fadeObserver = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('scrolled'); // ← Usar .scrolled del CSS
        fadeObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });

  fadeElements.forEach(element => {
    fadeObserver.observe(element);
  });

  // ===== SMOOTH SCROLL PARA NAVEGACIÓN =====
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const targetId = this.getAttribute('href');
      const targetSection = document.querySelector(targetId);
      
      if (targetSection && header) {
        const headerHeight = header.offsetHeight;
        const targetPosition = targetSection.offsetTop - headerHeight;
        
        window.scrollTo({
          top: targetPosition,
          behavior: 'smooth'
        });
      }
    });
  });
});
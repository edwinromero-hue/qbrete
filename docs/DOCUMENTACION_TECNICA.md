# Documentación Técnica - Qbrete Website

## Tabla de Contenidos
1. [Arquitectura del Proyecto](#arquitectura)
2. [HTML Detallado](#html-detallado)
3. [CSS Detallado](#css-detallado)
4. [JavaScript Detallado](#javascript-detallado)
5. [Guía de Mantenimiento](#mantenimiento)
6. [Troubleshooting](#troubleshooting)

---

## <a id="arquitectura"></a>1. Arquitectura del Proyecto

### Stack Tecnológico
```
Frontend:
├── HTML5 (Estructura semántica)
├── CSS3 (vanilla, sin preprocesadores)
├── JavaScript ES6+ (vanilla, sin frameworks)
└── Google Fonts (tipografía)

Hosting:
└── Servidor HTTP local (Python 3 o PHP)
```

### Flujo de Carga
```
1. Browser solicita index.html
2. HTML carga Google Fonts (preconnect)
3. Assets/css/style.css se aplica (render blocking)
4. DOM se renderiza
5. Assets/js/main.js se ejecuta (DOMContentLoaded)
6. Animaciones e interactividades inician
```

---

## <a id="html-detallado"></a>2. HTML Detallado

### Estructura Base

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <!-- Meta tags: charset, viewport, SEO -->
  <!-- Preconnect a Google Fonts para optimizar carga -->
  <!-- Link a CSS -->
</head>
<body>
  <!-- Header -->
  <!-- Secciones main -->
  <!-- Footer -->
  <!-- Script JS -->
</body>
</html>
```

### Componentes HTML Clave

#### 1. **Header (Navegación)**
```html
<header class="header" id="header">
  <div class="header__inner">
    <!-- Logo con SVG -->
    <a href="#" class="header__logo">
      <svg>...</svg>
      <span>brete</span>
    </a>
    
    <!-- Nav links -->
    <nav class="header__nav">
      <a href="#hero">Inicio</a>
      <!-- más links -->
    </nav>
    
    <!-- CTA Button -->
    <a href="#cotizar" class="header__cta">Cotizar</a>
    
    <!-- Hamburger para móvil -->
    <button class="header__hamburger">
      <span></span><span></span><span></span>
    </button>
  </div>
</header>
```

**Clases BEM:**
- `.header` - Contenedor principal
- `.header__inner` - Wrapper interior
- `.header__logo` - Logo con ícono
- `.header__nav` - Contenedor nav
- `.header__link` - Links individuales
- `.header__cta` - Botón call-to-action
- `.header__hamburger` - Botón portátil

**Estados:**
- `.is-scrolled` - Aplicado cuando scrollY > 60px

---

#### 2. **Hero Section**
```html
<section class="hero" id="hero">
  <div class="hero__bg-curve"></div> <!-- SVG de fondo -->
  
  <div class="hero__inner">
    <!-- Contenido texto (izquierda) -->
    <div class="hero__content">
      <div class="hero__badge">
        <span class="hero__badge-dot"></span>
        100% Digital • 100% Confiable
      </div>
      
      <h1 class="hero__title">
        Tu seguro,<br>
        <span class="hero__title--accent">reinventado</span><br>
        para la era digital
      </h1>
      
      <p class="hero__subtitle">...</p>
      
      <div class="hero__ctas">
        <a href="#cotizar" class="btn btn--primary">
          Cotizar ahora
          <svg>...</svg>
        </a>
        <a href="#seguros" class="btn btn--outline">Ver coberturas</a>
      </div>
      
      <div class="hero__stats">
        <div class="hero__stat">
          <span class="hero__stat-value" data-count="50">0</span>
          <span class="hero__stat-suffix">K+</span>
          <span class="hero__stat-label">Usuarios</span>
        </div>
        <!-- más stats -->
      </div>
    </div>
    
    <!-- Visual (derecha) -->
    <div class="hero__visual">
      <div class="hero__image-wrapper">
        <img src="assets/img/hero-pets.jpg" alt="...">
        
        <div class="hero__floating-badge">
          <!-- Badges flotantes con animación -->
        </div>
      </div>
    </div>
  </div>
</section>
```

**Atributos data especiales:**
- `data-animate=""` - Tipo de animación (al aparecer en viewport)
- `data-delay=""` - Delay en ms para stagger
- `data-count="50"` - Número objetivo para contador

**Grid layout:** 2 columnas en desktop, stack en móvil

---

#### 3. **Seguros Section (Products)**
```html
<section class="seguros" id="seguros">
  <div class="seguros__inner">
    <!-- Header con título -->
    <div class="seguros__grid">
      <!-- Cards de productos -->
      <div class="seguro-card" data-animate="fade-up">
        <div class="seguro-card__badge">Popular</div>
        
        <div class="seguro-card__icon">
          <svg>...</svg> <!-- Icono del producto -->
        </div>
        
        <h3 class="seguro-card__title">Seguro para Mascotas</h3>
        <p class="seguro-card__desc">Descripción corta</p>
        
        <ul class="seguro-card__features">
          <li>
            <svg>Checkmark</svg>
            Consultas veterinarias ilimitadas
          </li>
          <!-- más features -->
        </ul>
        
        <a href="#cotizar" class="btn btn--primary btn--full">
          Cotizar ahora
        </a>
      </div>
      <!-- Más cards -->
    </div>
  </div>
</section>
```

**Grid:** 2 columnas en desktop, 1 en móvil
**Features:** Lista con iconos SVG checkmark

---

#### 4. **Why Section (Diferenciadores)**
```html
<section class="why" id="nosotros">
  <div class="why__inner">
    <!-- Contenido texto izquierda -->
    <div class="why__content">
      <h2 class="section-title">Por que elegirnos</h2>
      <p class="section-subtitle">...</p>
    </div>
    
    <!-- Barras apiladas derecha -->
    <div class="why__stack" data-animate="fade-left">
      <div class="why__bar why__bar--1">
        <div class="why__bar-icon">
          <svg>Escudo</svg>
        </div>
        <span>100% Digital</span>
      </div>
      <!-- 4 barras más -->
    </div>
  </div>
</section>
```

**Barras:** 5 con gradientes diferentes, cada una con ícono y texto
**Animación:** Entrada escalonada a 0.07s de diferencia

---

#### 5. **CTA Section**
```html
<section class="cta" id="cotizar">
  <div class="cta__inner" data-animate="fade-up">
    <h2 class="cta__title">
      Listo para la revolucion del seguro?
    </h2>
    <p class="cta__subtitle">...</p>
    <a href="#" class="btn btn--white">
      Comenzar ahora
      <svg>Icono flecha</svg>
    </a>
  </div>
</section>
```

**Background:** Gradiente naranja con círculos decorativos (::before y ::after)

---

#### 6. **Testimonials Section**
```html
<section class="testimonials" id="contacto">
  <div class="testimonials__inner">
    <!-- Header -->
    <div class="testimonials__grid">
      <div class="testimonial-card">
        <div class="testimonial-card__stars">⭐⭐⭐⭐⭐</div>
        <p class="testimonial-card__quote">
          "Cita del cliente..."
        </p>
        <div class="testimonial-card__author">
          <div class="testimonial-card__avatar">L</div>
          <div>
            <strong>Laura Medina</strong>
            <span>Seguro para Mascotas</span>
          </div>
        </div>
      </div>
      <!-- Más cards -->
    </div>
  </div>
</section>
```

**Grid:** 2 columnas con gap de 24px
**Variedades de cards:** featured, highlight, small, big

---

#### 7. **Footer**
```html
<footer class="footer">
  <div class="footer__inner">
    <div class="footer__top">
      <!-- Logo y tagline -->
      <div class="footer__links">
        <div class="footer__col">
          <span class="footer__col-title">Producto</span>
          <a>...</a>
        </div>
        <!-- Más columnas -->
      </div>
    </div>
    <div class="footer__bottom">
      <p>&copy; 2026 Qbrete...</p>
    </div>
  </div>
</footer>
```

---

## <a id="css-detallado"></a>3. CSS Detallado

### Reset y Base

```css
/* Reset global */
*, *::before, *::after { 
  margin: 0; 
  padding: 0; 
  box-sizing: border-box; 
}

/* HTML */
html { 
  scroll-behavior: smooth; /* Scroll suave */
  font-size: 16px; /* Base size */
  -webkit-font-smoothing: antialiased; /* Antialiasing */
}

/* Body */
body { 
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  color: #1a1a1a;
  background: #fff;
  overflow-x: hidden; /* Previene scroll horizontal */
}
```

### Variables CSS

```css
:root {
  /* Colores */
  --orange: #EA580C;           /* Primario */
  --orange-light: #FFF7ED;     /* Fondo claro */
  --orange-dark: #C2410C;      /* Hover oscuro */
  
  /* Grises */
  --dark: #0f0f0f;
  --gray-900: #1a1a1a;        /* Texto principal */
  --gray-700: #404040;
  --gray-500: #737373;        /* Texto secundario */
  --gray-300: #d4d4d4;        /* Bordes */
  --gray-100: #f5f5f5;        /* Fondos */
  --white: #ffffff;
  
  /* Spacing */
  --radius-sm: 12px;
  --radius-md: 16px;
  --radius-lg: 24px;
  
  /* Sombras */
  --shadow-sm: 0 1px 3px rgba(0,0,0,0.06), ...;
  --shadow-md: 0 4px 20px rgba(0,0,0,0.08);
  --shadow-lg: 0 12px 40px rgba(0,0,0,0.12);
  --shadow-orange: 0 8px 32px rgba(234,88,12,0.25);
  
  /* Layout */
  --max-w: 1280px;
  
  /* Transiciones */
  --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}
```

**Ventajas:**
- Fácil mantenimiento de colores
- Consistencia global
- Cambios rápidos

### Botones

```css
.btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 16px 32px;
  border-radius: 100px; /* Plenamente redondeado */
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all var(--transition);
  border: none;
  position: relative; /* Para ripple effect */
  overflow: hidden;
}

/* Efecto overlay hover */
.btn::after {
  content: '';
  position: absolute;
  inset: 0;
  background: rgba(255,255,255,0.15);
  opacity: 0;
  transition: opacity var(--transition);
}
.btn:hover::after { opacity: 1; }

/* Variantes */
.btn--primary {
  background: var(--orange);
  color: #fff;
  box-shadow: var(--shadow-orange);
}

.btn--primary:hover {
  transform: translateY(-2px) scale(1.02);
  box-shadow: 0 12px 40px rgba(234,88,12,0.35);
}

.btn--outline {
  background: transparent;
  color: var(--gray-900);
  border: 1.5px solid var(--gray-300);
}

.btn--outline:hover {
  border-color: var(--orange);
  color: var(--orange);
  transform: translateY(-2px);
}

.btn--white {
  background: #fff;
  color: var(--orange);
  box-shadow: var(--shadow-md);
}

/* Full width */
.btn--full {
  width: 100%;
  justify-content: center;
}

/* SVG animado */
.btn svg {
  transition: transform var(--transition);
}
.btn:hover svg {
  transform: translateX(4px); /* Flecha se mueve a derecha */
}
```

### Header

```css
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100; /* Sobre todo */
  padding: 16px 0;
  transition: all var(--transition);
}

.header.is-scrolled {
  background: rgba(255,255,255,0.92);
  backdrop-filter: blur(20px); /* Efecto glass */
  -webkit-backdrop-filter: blur(20px); /* Safari */
  box-shadow: 0 1px 0 rgba(0,0,0,0.06);
  padding: 10px 0;
}

.header__inner {
  max-width: var(--max-w);
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 32px;
  background: #fff;
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  height: 56px;
}

.header.is-scrolled .header__inner {
  box-shadow: none;
  background: transparent;
  border-radius: 0;
}

/* Logo */
.header__logo {
  display: flex;
  align-items: center;
  gap: 4px;
  font-size: 18px;
  font-weight: 800;
  color: var(--gray-900);
}

.header__logo:hover .header__logo-icon {
  transform: rotate(20deg) scale(1.1);
}

/* Nav */
.header__nav {
  display: flex;
  gap: 32px;
}

.header__link {
  font-size: 16px;
  color: var(--gray-500);
  font-weight: 500;
  position: relative;
  transition: color var(--transition);
}

.header__link::after {
  content: '';
  position: absolute;
  bottom: -4px;
  left: 0;
  width: 0;
  height: 2px;
  background: var(--orange);
  border-radius: 1px;
  transition: width var(--transition);
}

.header__link:hover {
  color: var(--gray-900);
}

.header__link:hover::after {
  width: 100%; /* Subrayado animado */
}

/* CTA Button */
.header__cta {
  background: var(--orange);
  color: #fff;
  padding: 10px 24px;
  border-radius: 100px;
  font-size: 16px;
  font-weight: 600;
  transition: all var(--transition);
}

.header__cta:hover {
  background: var(--orange-dark);
  transform: scale(1.05);
  box-shadow: var(--shadow-orange);
}

/* Hamburger (oculto por defecto) */
.header__hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  padding: 4px;
}

.header__hamburger span {
  width: 24px;
  height: 2px;
  background: var(--gray-900);
  border-radius: 1px;
  transition: all var(--transition);
}

/* En pantalla pequeña */
@media (max-width: 768px) {
  .header__hamburger { display: flex; }
  .header__nav { display: none; } /* Oculto por defecto */
  .header__nav.active { display: flex; } /* Mostrado cuando activo */
}
```

### Hero Section

```css
.hero {
  padding: 140px 0 80px;
  position: relative;
  overflow: hidden;
  background: linear-gradient(180deg, var(--orange-light) 0%, #fff 100%);
}

.hero__bg-curve {
  position: absolute;
  top: -50px;
  right: -200px;
  width: 800px;
  height: 1200px;
  opacity: 0.07;
  background: url('...') no-repeat center;
  background-size: contain;
  pointer-events: none; /* No interfiere con clicks */
}

.hero__inner {
  max-width: var(--max-w);
  margin: 0 auto;
  padding: 0 32px;
  display: grid;
  grid-template-columns: 1fr 1fr; /* 2 columnas */
  gap: 60px;
  align-items: center;
}

/* Badge */
.hero__badge {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  background: #fff;
  border: 1px solid #f0e4d8;
  padding: 8px 20px;
  border-radius: 100px;
  font-size: 14px;
  font-weight: 600;
  color: var(--orange);
  margin-bottom: 24px;
}

.hero__badge-dot {
  width: 8px;
  height: 8px;
  background: var(--orange);
  border-radius: 50%;
  animation: pulse 2s infinite; /* Pulsación continua */
}

/* Title */
.hero__title {
  font-size: 60px;
  font-weight: 800;
  line-height: 1.05;
  color: var(--gray-900);
  letter-spacing: -1px;
  margin-bottom: 24px;
}

.hero__title--accent {
  color: var(--orange);
  position: relative;
  display: inline-block;
}

.hero__title--accent::after {
  content: '';
  position: absolute;
  bottom: 4px;
  left: 0;
  width: 100%;
  height: 6px;
  background: var(--orange);
  opacity: 0.2;
  border-radius: 3px;
  z-index: -1; /* Detrás del texto */
}

/* Subtitle */
.hero__subtitle {
  font-size: 20px;
  line-height: 1.6;
  color: var(--gray-500);
  margin-bottom: 32px;
  max-width: 520px;
}

/* CTAs Container */
.hero__ctas {
  display: flex;
  gap: 16px;
  margin-bottom: 48px;
}

/* Stats */
.hero__stats {
  display: flex;
  align-items: center;
  gap: 32px;
}

.hero__stat {
  text-align: center;
}

.hero__stat-value {
  font-size: 24px;
  font-weight: 800;
  color: var(--gray-900);
}

.hero__stat-suffix {
  font-size: 24px;
  font-weight: 800;
  color: var(--orange);
}

.hero__stat-label {
  display: block;
  font-size: 14px;
  color: var(--gray-500);
  margin-top: 2px;
}

/* Visual (imagen) */
.hero__visual {
  position: relative;
}

.hero__image-wrapper {
  position: relative;
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: var(--shadow-lg);
}

.hero__image {
  width: 100%;
  height: 600px;
  object-fit: cover;
  transition: transform 6s ease; /* Zoom suave al hover */
}

.hero__image-wrapper:hover .hero__image {
  transform: scale(1.05);
}

/* Floating Badges */
.hero__floating-badge {
  position: absolute;
  display: flex;
  align-items: center;
  gap: 10px;
  background: #fff;
  padding: 12px 20px;
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-md);
  font-size: 16px;
  font-weight: 600;
  color: var(--gray-900);
  white-space: nowrap;
}

.hero__floating-badge--top {
  top: 24px;
  right: -20px;
}

.hero__floating-badge--bottom {
  bottom: 40px;
  right: -30px;
}

.hero__floating-badge:hover {
  box-shadow: var(--shadow-lg);
  transform: translateY(-4px);
}
```

### Animaciones

```css @keyframes fadeUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeRight {
  from {
    opacity: 0;
    transform: translateX(-30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes fadeLeft {
  from {
    opacity: 0;
    transform: translateX(30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-12px); }
}

@keyframes pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.05); }
}

/* Aplicacion de animaciones */
[data-animate] {
  opacity: 0; /* Invisible inicialmente */
}

[data-animate].is-visible {
  opacity: 1;
}

[data-animate="fade-up"].is-visible {
  animation: fadeUp 0.7s cubic-bezier(0.16, 1, 0.3, 1) forwards;
}

[data-animate="fade-down"].is-visible {
  animation: fadeDown 0.7s cubic-bezier(0.16, 1, 0.3, 1) forwards;
}

/* ... más animaciones ... */
```

---

## <a id="javascript-detallado"></a>4. JavaScript Detallado

### Estructura General

```javascript
document.addEventListener('DOMContentLoaded', () => {
  // TODO el código aquí se ejecuta cuando DOM está listo
  // No se ejecuta script tags inline
  
  // 1. Progress bar
  // 2. Header scroll
  // 3. Intersection observers
  // 4. Smooth scroll
  // 5. Mobile menu
  // 6. Interactive effects
});
```

### 1. Progress Bar

```javascript
const progressBar = document.createElement('div');
progressBar.className = 'scroll-progress';
document.body.prepend(progressBar); // Añade al inicio del body

window.addEventListener('scroll', () => {
  const scrollY = window.scrollY;
  const docHeight = document.documentElement.scrollHeight - window.innerHeight;
  
  // Calcula porcentaje
  progressBar.style.width = (scrollY / docHeight * 100) + '%';
}, { passive: true }); // passive = mejor performance
```

**Purpose:** Muestra barra visual del progreso de scroll
**Position:** Fixed en top
**Update:** Cada vez que hace scroll

### 2. Header Scroll Effect

```javascript
const header = document.getElementById('header');
let lastScroll = 0;

window.addEventListener('scroll', () => {
  const scrollY = window.scrollY;
  
  // Glassmorphism cuando scrollY > 60px
  header.classList.toggle('is-scrolled', scrollY > 60);
  
  lastScroll = scrollY;
}, { passive: true });
```

**Effect:** 
- scrollY ≤ 60px: Header normal (blanco opaco)
- scrollY > 60px: Glassmorphism (fondo blanco semi-transparente + blur)

### 3. Intersection Observer - Animaciones (Principal)

```javascript
const observerOptions = {
  threshold: 0.15, // Elemento debe ser 15% visible
  rootMargin: '0px 0px -50px 0px' // Offset del trigger
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const el = entry.target;
      const delay = el.dataset.delay || 0; // Leer data-delay
      
      setTimeout(() => {
        el.classList.add('is-visible'); // Activa animación CSS
      }, parseInt(delay));
      
      observer.unobserve(el); // Dejar de observar
    }
  });
}, observerOptions);

// Observar todos los elementos con data-animate
document.querySelectorAll('[data-animate]').forEach(el => {
  observer.observe(el);
});
```

**Ventajas:**
- No usa scroll listeners pesados
- Solo anima cuando entra en viewport
- No anima fuera de pantalla
- Mejora performance

**Cómo funciona:**
1. Lee `data-animate` (tipo de animación)
2. Lee `data-delay` (ms de espera)
3. Cuando entra al viewport: añade clase `.is-visible`
4. CSS anima via `@keyframes`

### 4. Counter Animation (Números)

```javascript
const counterObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const el = entry.target;
      const target = parseInt(el.dataset.count); // Lee data-count="50"
      
      if (!target) return;
      
      let current = 0;
      const increment = target / 40; // 40 pasos
      const timer = setInterval(() => {
        current += increment;
        
        if (current >= target) {
          el.textContent = target; // Valor final
          clearInterval(timer);
        } else {
          el.textContent = Math.floor(current); // Redondea hacia abajo
        }
      }, 30); // Actualiza cada 30ms
      
      counterObserver.unobserve(el);
    }
  });
}, { threshold: 0.5 }); // Espera 50% visible

// Observar elementos con data-count
document.querySelectorAll('[data-count]').forEach(el => {
  counterObserver.observe(el);
});
```

**Ejemplo:**
```html
<span class="hero__stat-value" data-count="50">0</span>
```
Cuenta de 0 a 50 en 40 pasos, actualizando cada 30ms = ~1.2s totalidad.

### 5. Image Shimmer

```javascript
const heroImg = document.querySelector('.hero__image');
if (heroImg) {
  const wrapper = heroImg.closest('.hero__image-wrapper');
  
  if (heroImg.complete) {
    // Imagen está en caché
    wrapper.classList.add('loaded');
  } else {
    // Esperar a que cargue
    heroImg.addEventListener('load', () => {
      wrapper.classList.add('loaded');
    });
  }
  
  // Fallback: quitar shimmer a los 3s
  setTimeout(() => {
    wrapper.classList.add('loaded');
  }, 3000);
}
```

**Purpose:** Remover efecto loading (shimmer) cuando imagen carga

### 6. Smooth Scroll

```javascript
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', (e) => {
    e.preventDefault(); // No ir a href
    
    const target = document.querySelector(anchor.getAttribute('href'));
    if (target) {
      const headerH = header.offsetHeight + 20; // Altura header + padding
      const top = target.getBoundingClientRect().top + window.scrollY - headerH;
      
      window.scrollTo({
        top: top,
        behavior: 'smooth' // Animación suave
      });
    }
  });
});
```

**Effect:** Links tipo `href="#section"` hacen scroll suave
**Offset:** Compensa altura del header fijo

### 7. Mobile Hamburger

```javascript
const hamburger = document.querySelector('.header__hamburger');
const nav = document.querySelector('.header__nav');

if (hamburger) {
  hamburger.addEventListener('click', () => {
    // Toggle visibility
    nav.style.display = nav.style.display === 'flex' ? 'none' : 'flex';
    
    // Styling
    nav.style.position = 'absolute';
    nav.style.top = '70px';
    nav.style.left = '0';
    nav.style.right = '0';
    nav.style.flexDirection = 'column';
    nav.style.background = '#fff';
    nav.style.padding = '24px';
    nav.style.borderRadius = '16px';
    nav.style.boxShadow = '0 12px 40px rgba(0,0,0,.12)';
    nav.style.gap = '16px';
  });
}
```

**Note:** Los estilos se aplican inline (no ideal, pero funciona para MVP)

### 8. Magnetic Button Effect

```javascript
document.querySelectorAll('.btn--primary, .header__cta').forEach(btn => {
  btn.addEventListener('mousemove', (e) => {
    const rect = btn.getBoundingClientRect();
    const x = e.clientX - rect.left - rect.width / 2;
    const y = e.clientY - rect.top - rect.height / 2;
    
    // Mueve 15% de la posición del mouse respecto al botón
    btn.style.transform = `translate(${x * 0.15}px, ${y * 0.15}px) scale(1.02)`;
  });
  
  btn.addEventListener('mouseleave', () => {
    btn.style.transform = '';
  });
});
```

**Effect:** Botón se "atrae" ligeramente hacia la posición del mouse

### 9. Card Tilt Effect

```javascript
document.querySelectorAll('.seguro-card').forEach(card => {
  card.addEventListener('mousemove', (e) => {
    const rect = card.getBoundingClientRect();
    const x = (e.clientX - rect.left) / rect.width - 0.5;
    const y = (e.clientY - rect.top) / rect.height - 0.5;
    
    // Perspectiva 3D
    card.style.transform = `translateY(-8px) perspective(1000px) rotateX(${y * -4}deg) rotateY(${x * 4}deg)`;
  });
  
  card.addEventListener('mouseleave', () => {
    card.style.transform = '';
  });
});
```

**Effect:** Cards se inclinan en 3D siguiendo mouse

### 10. Parallax Background

```javascript
const bgCurve = document.querySelector('.hero__bg-curve');
if (bgCurve) {
  window.addEventListener('scroll', () => {
    const scrollY = window.scrollY;
    if (scrollY < 1000) {
      bgCurve.style.transform = `translateY(${scrollY * 0.3}px) rotate(${scrollY * 0.02}deg)`;
    }
  }, { passive: true });
}
```

**Effect:** Fondo se mueve más lento que el scroll (parallax)

### 11. Ripple Effect

```javascript
document.querySelectorAll('.btn').forEach(btn => {
  btn.addEventListener('click', function(e) {
    const ripple = document.createElement('span');
    const rect = this.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    
    ripple.style.cssText = `
      position: absolute;
      width: ${size}px;
      height: ${size}px;
      left: ${e.clientX - rect.left - size/2}px;
      top: ${e.clientY - rect.top - size/2}px;
      background: rgba(255,255,255,.3);
      border-radius: 50%;
      transform: scale(0);
      animation: ripple 0.6s ease-out forwards;
      pointer-events: none;
    `;
    
    this.appendChild(ripple);
    setTimeout(() => ripple.remove(), 600);
  });
});
```

**Effect:** Efecto "ondas" al hacer click

### 12. Testimonial Glow

```javascript
document.querySelectorAll('.testimonial-card').forEach(card => {
  card.addEventListener('mousemove', (e) => {
    const rect = card.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    
    // Gradient radial que sigue al mouse
    card.style.background = `radial-gradient(circle at ${x}px ${y}px, rgba(234,88,12,.04), transparent 50%)`;
  });
  
  card.addEventListener('mouseleave', () => {
    card.style.background = ''; // Reset
  });
});
```

**Effect:** Glow dinámico que sigue al mouse

---

## <a id="mantenimiento"></a>5. Guía de Mantenimiento

### Agregar Nueva Sección

**Paso 1:** HTML
```html
<section class="mi-seccion" id="mi-seccion">
  <div class="mi-seccion__inner">
    <div data-animate="fade-up">Contenido</div>
  </div>
</section>
```

**Paso 2:** CSS
```css
.mi-seccion {
  padding: 96px 0;
  background: #fff;
}

.mi-seccion__inner {
  max-width: var(--max-w);
  margin: 0 auto;
  padding: 0 32px;
}
```

**Paso 3:** No se requiere JS (los observers ya están configurados)

### Cambiar Colores

Editar `:root` en `style.css`:
```css
:root {
  --orange: #FF6600; /* Cambiar aquí */
  /* ... */
}
```

### Agregar Nueva Animación

**Paso 1:** CSS - Crear `@keyframes`
```css
@keyframes miAnimacion {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

**Paso 2:** CSS - Aplicar
```css
[data-animate="mi-animacion"].is-visible {
  animation: miAnimacion 0.6s ease-out forwards;
}
```

**Paso 3:** HTML - Usar
```html
<div data-animate="mi-animacion">Contenido</div>
```

### Optimizar Performance

**Reducir animaciones:**
```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation: none !important;
    transition: none !important;
  }
}
```

**Lazy load imágenes:**
```html
<img src="..." loading="lazy" alt="...">
```

---

## <a id="troubleshooting"></a>6. Troubleshooting

### Problema: Animaciónes no funcionan

**Solución:**
1. Verificar que elemento tiene `data-animate`
2. Verificar que CSS tiene matching `.is-visible` selector
3. Verificar threshold del observer

### Problema: Scroll lento

**Soluciones:**
- Desactivar parallax (`bgCurve`)
- Reducir cantidad de observers
- Usar `will-change` (sparingly)

```css
.elemento-animado {
  will-change: transform;
}
```

### Problema: Mobile menu no cierra

**Debug:**
```javascript
console.log('Nav display:', nav.style.display);
```

### Problema: Imagen no carga en hero

**Solución:**
- Verificar ruta: `assets/img/hero-pets.jpg`
- Usar fallback en CSS:
```css
.hero__image-wrapper {
  background: var(--gray-100);
}
```

---

## Resumen Arquitectura

```
HTML (Estructura)
    ↓
CSS (Estilo + Animaciones)
    ↓
JS (Interactividad)
    ↓
Browser (Renderizado)
```

**Flow de una sección:**
1. HTML define estructura y `data-animate`
2. CSS define estilos y `@keyframes`
3. JS detecta visibilidad con Observer
4. JS añade clase `.is-visible`
5. CSS anima automáticamente

---

*Documentación Técnica - Qbrete Website*
*Actualizado: 30 de Marzo, 2026*

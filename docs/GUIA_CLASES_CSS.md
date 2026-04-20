# 📚 GUÍA DE CLASES CSS - Arquitectura BEM

## Metodología BEM (Block Element Modifier)

Este proyecto usa **BEM** (Block Element Modifier) para nombres de clases CSS.

### Sintaxis
```
.block-name              /* Bloque principal */
.block-name__element     /* Elemento dentro del bloque */
.block-name--modifier    /* Variante del bloque */
```

### Ejemplo Real
```css
.btn                     /* Bloque: botón */
.btn--primary            /* Modificador: botón primario */
.btn--outline            /* Modificador: botón outline */
.header__logo            /* Elemento: logo dentro de header */
.header__nav             /* Elemento: nav dentro de header */
```

---

## 📋 Tabla de Clases por Sección

### 🔴 HEADER (Barra de navegación)

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.header` | Block | Contenedor header fijo |
| `.header.is-scrolled` | State | Aplicado cuando scrollY > 60px |
| `.header__inner` | Element | Contenedor interior (max-width) |
| `.header__logo` | Element | Logo clickeable |
| `.header__logo-icon` | Element | SVG icon del logo |
| `.header__nav` | Element | Contenedor de navegación |
| `.header__link` | Element | Links individuales |
| `.header__cta` | Element | Botón "Cotizar" |
| `.header__hamburger` | Element | Botón menu móvil |

**Estados:**
- `.header.is-scrolled` → Activa glassmorphism + sombra

**Responsive:**
- `@media (max-width: 768px)` → `.header__hamburger` visible, `.header__nav` oculta

---

### 🟠 HERO Section

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.hero` | Block | Contenedor principal |
| `.hero__bg-curve` | Element | SVG decorativo de fondo |
| `.hero__inner` | Element | Contenedor grid 2 columnas |
| `.hero__content` | Element | Contenido texto (izquierda) |
| `.hero__badge` | Element | Badge "100% Digital..." |
| `.hero__badge-dot` | Element | Punto pulsante del badge |
| `.hero__title` | Element | H1 principal |
| `.hero__title--accent` | Element | Span naranja dentro del title |
| `.hero__subtitle` | Element | Párrafo descriptivo |
| `.hero__ctas` | Element | Contenedor botones |
| `.hero__stats` | Element | Contenedor estadísticas |
| `.hero__stat` | Element | Stat individual |
| `.hero__stat-value` | Element | Número de stat |
| `.hero__stat-suffix` | Element | Sufijo (K+, %) |
| `.hero__stat-label` | Element | Label de stat |
| `.hero__stat-divider` | Element | Línea divisor entre stats |
| `.hero__visual` | Element | Contenedor imagen (derecha) |
| `.hero__image-wrapper` | Element | Wrapper imagen con shimmer |
| `.hero__image` | Element | Imagen actual |
| `.hero__floating-badge` | Element | Badges flotantes sobre imagen |
| `.hero__floating-badge--top` | Modifier | Posición superior |
| `.hero__floating-badge--bottom` | Modifier | Posición inferior |

**Estados:**
- `.hero__image-wrapper.loaded` → Quita efecto shimmer

---

### 🎫 SEGUROS (Products)

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.seguros` | Block | Contenedor sección |
| `.seguros__inner` | Element | Wrapper interior |
| `.seguros__header` | Element | Header + título |
| `.seguros__grid` | Element | Grid 2 columnas |
| `.seguro-card` | Block | Tarjeta producto |
| `.seguro-card.is-visible` | State | Activa animación entrada |
| `.seguro-card__badge` | Element | "Popular" o similar |
| `.seguro-card__icon` | Element | Icono SVG |
| `.seguro-card__title` | Element | Nombre del seguro |
| `.seguro-card__desc` | Element | Descripción corta |
| `.seguro-card__features` | Element | Lista de coberturas |
| `.seguro-card__features li` | Element | Item lista |

**Efectos:**
- `.seguro-card:hover` → Elevación + tilt 3D
- `.seguro-card__icon` → Color naranja al hover

---

### 🏛️ WHY Section (Diferenciadores)

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.why` | Block | Contenedor sección |
| `.why__inner` | Element | Wrapper grid 2 columnas |
| `.why__content` | Element | Contenido texto (izquierda) |
| `.why__stack` | Element | Contenedor barras (derecha) |
| `.why__stack.is-visible` | State | Activa animaciones barras |
| `.why__bar` | Element | Barra individual |
| `.why__bar--1` | Modifier | Barra 1 (100% Digital) - gradiente claro |
| `.why__bar--2` | Modifier | Barra 2 (Total Transparencia) |
| `.why__bar--3` | Modifier | Barra 3 (Rapidez Extrema) - gradiente oscuro |
| `.why__bar--4` | Modifier | Barra 4 (Respaldo Sólido) - rojo |
| `.why__bar--5` | Modifier | Barra 5 (Atención 24/7) |
| `.why__bar-icon` | Element | Icono dentro barra |

**Animaciones:**
- Entrada escalonada con delays: 0.05s, 0.12s, 0.19s, 0.26s, 0.33s

---

### 📢 CTA Section

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.cta` | Block | Contenedor sección |
| `.cta__inner` | Element | Contenedor gradient naranja |
| `.cta__title` | Element | Headline |
| `.cta__subtitle` | Element | Descrip |

**Decorativo:**
- `::before` y `::after` → Círculos decorativos semi-transparentes

---

### 💬 TESTIMONIOS

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.testimonials` | Block | Contenedor sección |
| `.testimonials__inner` | Element | Wrapper interior |
| `.testimonials__header` | Element | Header + título |
| `.testimonials__grid` | Element | Grid cards |
| `.testimonial-card` | Block | Tarjeta testimonial |
| `.testimonial-card--featured` | Modifier | Card destacada |
| `.testimonial-card--highlight` | Modifier | Card con highlight |
| `.testimonial-card--small` | Modifier | Card pequeña |
| `.testimonial-card--big` | Modifier | Card grande |
| `.testimonial-card__stars` | Element | Estrellas (⭐⭐⭐⭐⭐) |
| `.testimonial-card__quote` | Element | Cita del cliente |
| `.testimonial-card__quote--large` | Modifier | Quote más grande |
| `.testimonial-card__author` | Element | Contenedor nombre + rol |
| `.testimonial-card__avatar` | Element | Avatar circular |
| `.testimonial-card__meta` | Element | Meta info (nombre • rol) |

**Efectos:**
- `.testimonial-card:hover` → Elevación + glow dinámico

---

### 🔗 FOOTER

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.footer` | Block | Contenedor footer |
| `.footer__inner` | Element | Wrapper interior |
| `.footer__top` | Element | Sección top (links) |
| `.footer__bottom` | Element | Sección bottom (copyright) |
| `.footer__brand` | Element | Logo + tagline |
| `.footer__logo` | Element | Texto "Qbrete" |
| `.footer__tagline` | Element | "protege." |
| `.footer__links` | Element | Contenedor columnas links |
| `.footer__col` | Element | Columna individual |
| `.footer__col-title` | Element | Título columna |

---

### ⚙️ BOTONES (Reutilizable)

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.btn` | Block | Botón base |
| `.btn--primary` | Modifier | Botón primario (naranja) |
| `.btn--outline` | Modifier | Botón outline |
| `.btn--white` | Modifier | Botón blanco |
| `.btn--full` | Modifier | Ancho 100% |

**Comportamientos:**
- `.btn::after` → Overlay al hover
- `.btn:hover svg` → SVG traslada a derecha

**Estados:**
- `.btn:hover` → Elevación + escala
- `.btn:active` → Escala menor

---

### 📐 ELEMENTOS GLOBALES

| Clase | Tipo | Descripción |
|-------|------|-------------|
| `.section-title` | Global | H2 de secciones (48px) |
| `.section-subtitle` | Global | Subtítulo de sección (20px) |
| `[data-animate]` | Attribute | Elemento animable |
| `[data-animate].is-visible` | State | Activa animación |
| `[data-count]` | Attribute | Elemento con contador |

---

### 🎬 ANIMACIONES (Aplicadas vía @keyframes)

| Animación | Duración | Uso |
|-----------|----------|-----|
| `fadeUp` | 0.7s | Entrada de abajo |
| `fadeDown` | 0.7s | Entrada de arriba |
| `fadeRight` | 0.7s | Entrada de izquierda |
| `fadeLeft` | 0.7s | Entrada de derecha |
| `float` | 4s + slideIn | Movimiento flotante + entrada |
| `pulse` | 2s infinite | Pulsación dot badge |
| `shimmer` | N/A | Efecto loading (imagen) |
| `spin` | 1s | Rotación continua |
| `slideInBadge` | 0.6s | Entrada badge |
| `slideBarIn` | 0.6s | Entrada barras |
| `ripple` | 0.6s | Efecto click |

---

## 🎨 CSS Variables (Reutilizables)

```css
:root {
  /* Colores primarios */
  --orange: #EA580C;
  --orange-light: #FFF7ED;
  --orange-dark: #C2410C;
  
  /* Grises */
  --dark: #0f0f0f;
  --gray-900: #1a1a1a;
  --gray-700: #404040;
  --gray-500: #737373;
  --gray-300: #d4d4d4;
  --gray-100: #f5f5f5;
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

---

## 🔄 Data Attributes (HTML)

| Atributo | Valor | Descripción |
|----------|-------|-------------|
| `data-animate` | fade-up / fade-down; / fade-right / fade-left / float | Tipo de animación |
| `data-delay` | 0, 100, 200, 300, etc | Delay en milisegundos |
| `data-count` | "50", "98", etc | Número objetivo contador |

---

## 📊 Selectores Útiles

### Por tipo de animación
```css
[data-animate="fade-up"].is-visible { animation: fadeUp ... }
[data-animate="fade-down"].is-visible { animation: fadeDown ... }
[data-animate="fade-right"].is-visible { animation: fadeRight ... }
[data-animate="fade-left"].is-visible { animation: fadeLeft ... }
[data-animate="float"].is-visible { animation: slideInBadge ..., float ... }
```

### Por estado
```css
.header.is-scrolled { ... }
.hero__image-wrapper.loaded { ... }
.seguro-card.is-visible { ... }
.testimonial-card:hover { ... }
```

### Por viewport
```css
@media (max-width: 1024px) { ... }
@media (max-width: 768px) { ... }
@media (max-width: 480px) { ... }
```

---

## ✅ Checklist - Mantener Consistencia

- [ ] Usar solo clases BEM (sin ID para estilos)
- [ ] Una propiedad CSS = una línea
- [ ] Colores vía `--variables`
- [ ] Espaciado vía unidades relativas (em, rem)
- [ ] Transiciones vía `--transition`
- [ ] Shadows vía `--shadow-*`
- [ ] Responsive: Desktop first (luego media queries)
- [ ] Comentarios para bloques principales
- [ ] No usar `!important` (excepto reset)
- [ ] Organizar: Reset > Variables > Componentes > Responsivo

---

## 📖 Referencias

- [BEM Methodology](http://getbem.com/)
- [CSS Variables](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries)
- [Animations CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/animation)

---

*Documentación de Clases CSS - Qbrete Website*
*Actualizado: 30 de Marzo, 2026*

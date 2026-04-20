# ✅ CHECKLIST DE PRUEBAS Y VALIDACIÓN

## 🧪 Antes de Desplegar

### 1. HTML Validation

- [ ] Validar con [W3C HTML Validator](https://validator.w3.org/)
- [ ] Sin errores de sintaxis
- [ ] Meta tags correctos (charset, viewport, description)
- [ ] Atributos `alt` en todas las imágenes
- [ ] Atributos `aria-label` en botones sin texto

**Comando:**
```bash
# Instalar validador
npm install -g html-validator

# Validar
html-validator index.html --verbose
```

---

### 2. CSS Validation

- [ ] Validar con [W3C CSS Validator](https://jigsaw.w3.org/css-validator/)
- [ ] Sin propiedades no soportadas
- [ ] Colores consistentes (usar variables CSS)
- [ ] Espesor de líneas consistentes
- [ ] Z-index organizados sin conflictos

**Propiedades soportadas en navegadores objetivo:**
- ✅ `backdrop-filter` (Chrome 76+, Safari 13+)
- ✅ `CSS Grid` (Chrome 57+, Safari 10.1+)
- ✅ `CSS Variables` (Chrome 49+, Safari 9.1+)
- ✅ `transform-3d` (Chrome 12+, Safari 4+)

---

### 3. JavaScript Testing

- [ ] Consola limpia (sin errores)
- [ ] Sin warnings en DevTools
- [ ] Intersection Observers funcionan correctamente
- [ ] Event listeners se desinscriben
- [ ] Memory leaks detectados con DevTools

**Debugging:**
```javascript
// En consola del navegador
console.log(document.querySelectorAll('[data-animate]').length) // Debe ser ~30+

// Verificar memory leaks
// DevTools → Performance → Record → hacer scroll → Stop
```

---

### 4. Performance

#### Lighthouse Score
- [ ] Performance: >90
- [ ] Accessibility: >90
- [ ] Best Practices: >90
- [ ] SEO: >90

**Cómo:**
- DevTools → Lighthouse → Generate Report

#### Core Web Vitals
| Métrica | Bueno | Pobre |
|---------|-------|-------|
| LCP (Largest Contentful Paint) | <2.5s | >4s |
| FID (First Input Delay) | <100ms | >300ms |
| CLS (Cumulative Layout Shift) | <0.1 | >0.25 |

**Herramientas:**
- Chrome DevTools → Performance
- Web Vitals Chrome Extension

---

### 5. Responsive Design

#### Puntos de Quiebre Testeados
- [ ] Desktop (1920px)
- [ ] Laptop (1280px)
- [ ] Tablet (768px)
- [ ] Mobile (375px)
- [ ] Extra pequeño (320px)

**Pruebas:**
- [ ] Texto legible en todos los tamaños
- [ ] Imágenes no se distorsionan
- [ ] Botones clickeables (mínimo 48x48px)
- [ ] Sin scroll horizontal involuntario
- [ ] Header sticky funciona correctamente

**Firefox Responsive Mode:**
```
Presiona: Ctrl+Shift+M (Windows) o Cmd+Shift+M (Mac)
```

---

### 6. Navegadores y Dispositivos

#### Desktop
- [ ] Chrome (última versión)
- [ ] Firefox (última versión)
- [ ] Safari (última versión)
- [ ] Edge (última versión)

#### Mobile
- [ ] iPhone 12/13 (iOS 15+)
- [ ] iPhone SE (iOS 12+)
- [ ] Samsung Galaxy (Android 9+)
- [ ] Nexus 6P (Android 9+)

**BrowserStack:** Pruebas en múltiples dispositivos reales

---

### 7. Accesibilidad (WCAG 2.1 AA)

#### Keyboard Navigation
- [ ] Tab funciona en todos los links
- [ ] Tab order lógico
- [ ] Focus visible en todos los elementos
- [ ] Enter activa botones
- [ ] Esc cierra menú móvil

#### Screen Readers
- [ ] Usar NVDA (Windows) o JAWS
- [ ] Headings anidados correctamente (H1 → H2 → H3)
- [ ] Form labels asociadas
- [ ] Alt text descriptivo (no "imagen1")
- [ ] Live regions para contenido dinámico

#### Contraste
- [ ] Texto: mínimo 4.5:1 (AA) para cuerpo
- [ ] Líneas/bordes: mínimo 3:1 (AA)
- [ ] Usar [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)

**Herramienta automática:**
```bash
npm install -g axe-core
# ... o usar librería en VS Code
```

---

### 8. SEO

- [ ] `<title>` descriptivo (50-60 caracteres)
- [ ] `<meta description>` presente (150-160 caracteres)
- [ ] H1 único en la página
- [ ] Headings anidados correctamente
- [ ] URLs limpias y descriptivas
- [ ] Schema markup (JSON-LD) si aplica
- [ ] Open Graph tags (og:title, og:description, etc)
- [ ] Robots.txt presente
- [ ] Sitemap.xml presente

**Herramientas:**
- [Google Search Console](https://search.google.com/search-console)
- [Mobile-Friendly Test](https://search.google.com/test/mobile-friendly)

---

### 9. Seguridad

- [ ] HTTPS habilitado (en producción)
- [ ] CSP (Content Security Policy) headers
- [ ] X-Frame-Options: SAMEORIGIN
- [ ] X-Content-Type-Options: nosniff
- [ ] Referrer-Policy: strict-origin-when-cross-origin

**Verificar con:**
```bash
curl -I https://ejemplo.com
# Buscar headers de seguridad
```

---

### 10. Compatibilidad de Funcionalidades

#### LocalStorage / SessionStorage
- [ ] Soportado en navegadores objetivo

#### Intersection Observer
- [ ] Chrome 51+ ✅
- [ ] Firefox 55+ ✅
- [ ] Safari 12.1+ ✅
- [ ] Edge 15+ ✅

#### CSS Features
- [ ] `backdrop-filter` con prefijo `-webkit-`
- [ ] `transform` (perspectiva 3D)
- [ ] `@keyframes` animaciones
- [ ] `grid` layout

---

## 🎬 Checklist de Animaciones

### Entrada (Intersection Observer)
- [ ] `fade-up` entra desde abajo suave
- [ ] `fade-down` entra desde arriba suave
- [ ] `fade-right` entra desde izquierda suave
- [ ] `fade-left` entra desde derecha suave
- [ ] `float` flota + entra correctamente

### Contador
- [ ] Números animan de 0 al objetivo
- [ ] Velocidad consistente (~1.2s)
- [ ] Valor final exacto (no redondeo residual)

### Interactividad
- [ ] Ripple en botones al click
- [ ] Magnetic effect suave en botones
- [ ] Tilt 3D en cards (no mareante)
- [ ] Parallax en hero (no glitchy)
- [ ] Scroll progress bar actualiza

### Performance
- [ ] 60 FPS en scroll
- [ ] Sin jank o stutters
- [ ] No consume CPU innecesariamente

---

## 📱 Checklist Mobile Específico

### Touch
- [ ] Botones responden al touch
- [ ] Ripple funciona en mobile
- [ ] Tilt 3D desactivado en mobile (opcional)
- [ ] Hover states no se quedan "pegados"

### Viewport
- [ ] Sin zoom involuntario
- [ ] Metatag viewport correcto: `width=device-width, initial-scale=1.0`
- [ ] Viewport scale previene zoom accidental

### Orientación
- [ ] Portrait: legible y funcional
- [ ] Landscape: legible y funcional
- [ ] Transición smooth entre orientaciones

### Conexión
- [ ] Funciona en 4G lento
- [ ] Funciona en WiFi deficiente
- [ ] Recursos críticos cargan primero (preload)

---

## 🔍 Checklist Visual

### Tipografía
- [ ] Font loads correctamente (Google Fonts)
- [ ] Fallback fonts funcionan (sin FOIT)
- [ ] Tamaños escalados correctamente
- [ ] Line-height adecuado (1.5-1.6 para cuerpo)
- [ ] Letter-spacing correcto

### Colores
- [ ] Naranja primario (#EA580C) consistente
- [ ] Grises suavemente diferenciados
- [ ] Gradientes suaves (no bandeo)
- [ ] Colores se ven bien en diferentes pantallas

### Espaciado
- [ ] Padding consistente (multidatos de 8px)
- [ ] Margin consistente
- [ ] Gaps en flexbox/grid uniforme
- [ ] Sin contenido "pegado" a bordes

### Bordes y Sombras
- [ ] Border-radius consistente (12/16/24px)
- [ ] Sombras suaves y realistas
- [ ] Elevación visual clara

---

## 📊 Checklist Final (Pre-Deploy)

- [ ] Todos los enlaces internos funcionan
- [ ] Formularios no perdidas (si aplican)
- [ ] Imágenes cargan correctamente
- [ ] Videos reproducen (si aplican)
- [ ] Fallback de idiomas (si aplica)
- [ ] Build/minify assets realizado
- [ ] Cache busting implementado
- [ ] Analytics configurado (si aplica)
- [ ] Monitoreo de errores configurado
- [ ] Backups realizados
- [ ] CDN configurado (si aplica)

---

## 🚀 QA Test Cases

### Test 1: Hero Section
```
1. Cargar página
2. Verificar Hero aparece completo
3. Cierre imagen carga (sin shimmer)
4. Contadores animan de 0 a valores finales
5. Badges flotantes tienen animación
```

### Test 2: Navegación
```
1. Click en cada link del header
2. Scroll suave a sección correcta
3. Offset correcto (no se oculta bajo header)
4. Mobile: Hamburger abre/cierra menú
5. Mobile: Click en link cierra menú
```

### Test 3: Cards de Productos
```
1. Cargar sección #seguros
2. Cards aparecen con animación
3. Hover: tilt 3D funciona
4. Hover: imagen se eleva
5. Colores primarios destacados
```

### Test 4: Scroll
```
1. Scroll hacia abajo
2. Progress bar se llena
3. Header cambia a glassmorphism (scrollY > 60px)
4. Parallax curve se mueve
5. Elementos se animan al entrar viewport
```

### Test 5: Mobile
```
1. Abrir en móvil (iPhone/Android)
2. Todo visible sin scroll horizontal
3. Botones clickeables (mín 48x48px)
4. Tipografía legible (mín 16px)
5. Imágenes ajustan al ancho
6. Menu hamburger funciona
```

---

## 📈 Métricas Deseadas

| Métrica | Objetivo | Actual |
|---------|----------|--------|
| Page Load Time | <3s | --- |
| Time to Interactive | <5s | --- |
| First Contentful Paint | <1.5s | --- |
| Largest Contentful Paint | <2.5s | --- |
| Cumulative Layout Shift | <0.1 | --- |
| Total Bundle Size | <100KB | --- |
| Lighthouse Score | >90 | --- |

---

## 📝 Logging y Debugging

### Herramientas Recomendadas
```javascript
// En consola del navegador

// 1. Verificar elementos animables
console.log(document.querySelectorAll('[data-animate]'))

// 2. Verificar contador
console.log(document.querySelector('[data-count="50"]'))

// 3. Verificar observers activos
console.log(observer) // Debe mostrar el observer

// 4. Performance timing
console.log(performance.timing)

// 5. Memory usage
console.log(performance.memory)
```

### Chrome DevTools
1. **Elements:** Inspeccionar elementos y clases
2. **Console:** Ver ahorro y validar lógica
3. **Performance:** Grabar scroll y analizar FPS
4. **Network:** Ver carga de recursos
5. **Accessibility:** Verificar árbol de accesibilidad
6. **Lighthouse:** Score de calidad

---

## 🎯 Puntos Críticos

### DEBE Funcionar
- [ ] Scroll suave a anchors
- [ ] Números de contadores animan
- [ ] Elementos aparecen al scroll
- [ ] Botones tienen ripple effect
- [ ] Header mantiene sticky correctamente

### DEBE Verse Bien
- [ ] Tipografía legible en móvil
- [ ] Imágenes centradas/escaladas
- [ ] Botonesclickables en todos los tamaños
- [ ] Gradientes suaves sin bandeo
- [ ] Sombras realistas

### DEBE Cargar Rápido
- [ ] Imagen hero <300KB
- [ ] CSS/JS minificados
- [ ] Fonts precargadas
- [ ] Lazy loading de imágenes (si aplica)

---

## 🆘 Si Algo Falla

1. **Abrir DevTools:** F12 o Cmd+Option+I
2. **Console:** Revisar errores en rojo
3. **Network:** Verificar que recursos carguen (status 200)
4. **Performance:** Grabar y analizar timeline
5. **Elements:** Inspeccionar HTML/CSS aplicado
6. **Buscar en [GitHub Issues](https://github.com/)**
7. **Stack Overflow:** Buscar error específico

---

*Checklist de Pruebas - Qbrete Website*
*Versión: 1.0*
*Actualizado: 30 de Marzo, 2026*

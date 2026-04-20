# 🚀 GUÍA RÁPIDA - Qbrete Website

## Inicio Rápido

### 1. Iniciar el servidor
```bash
cd /Users/usuario1/Downloads/qbrete-website
chmod +x start.sh
./start.sh
```

El navegador se abrirá en `http://localhost:8080`

### 2. Presiona Ctrl+C para detener el servidor

---

## 📱 Navegación de la Página

| Sección | Anchor | Descripción |
|---------|--------|-------------|
| **Header** | N/A | Navegación fija con logo y menú |
| **Hero** | `#hero` | Sección inicial con propuesta valor |
| **Seguros** | `#seguros` | Grid de productos disponibles |
| **Nosotros** | `#nosotros` | Por qué elegir Qbrete |
| **Cotizar** | `#cotizar` | CTA principal |
| **Contacto** | `#contacto` | Testimonios de clientes |
| **Footer** | N/A | Información legal |

---

## 📁 Estructura de Archivos

```
qbrete-website/
├── 📄 index.html                    # HTML principal con estructura
├── 📄 start.sh                      # Script para iniciar servidor
├── 📁 assets/
│   ├── 📁 css/
│   │   └── 📄 style.css             # Toda la estetética y animaciones
│   ├── 📁 img/
│   │   └── 📷 hero-pets.jpg        # Imagen principal (si existe)
│   └── 📁 js/
│       └── 📄 main.js               # Todas las interactividades
├── 📄 README.md                     # Documentación general
└── 📄 DOCUMENTACION_TECNICA.md      # Documentación técnica detallada
```

---

## 🎨 Componentes Principales

### Header (Barra de navegación)
- Logo animado (rotación del icono al hover)
- Links con subrayado animado
- Botón Cotizar destacado
- Menú responsivo para móvil
- Glassmorphism al hacer scroll

### Hero Section
- Badge con estadísticas
- Headline + Acento naranja
- Subtítulo
- Botones CTA (primario + outline)
- Estadísticas con contadores animados
- Imagen con badges flotantes

### Seguros (Productos)
- Tarjeta 1: Seguro para Mascotas (Popular)
- Tarjeta 2: Seguro para Bicicletas
- Efecto 3D tilt al hover
- lista de features/coberturas

### Why Section (Diferenciadores)
- 5 barras apiladas con gradientes
- Entrada escalonada
- Hover effect con traslación

### CTA Section
- Gradient naranja degradado
- Headline clara
- Botón blanco prominente

### Testimonios
- Grid de cartas con quotes
- 5 estrellas
- Avatar + nombre + tipo de seguro
- Glow dinámico al hover

### Footer
- Logo y tagline
- Links de navegación
- Copyright

---

## 🎬 Animaciones Disponibles

### Entrada (Intersection Observer)
```
data-animate="fade-up"      ↑ Sube desde abajo
data-animate="fade-down"    ↓ Baja desde arriba
data-animate="fade-right"   ← Entra desde izquierda
data-animate="fade-left"    → Entra desde derecha
data-animate="float"        🎈 Flota continuamente
```

### Timing
```
data-delay="0"      Inmediato
data-delay="100"    100ms de espera
data-delay="200"    200ms de espera
data-delay="300"    300ms de espera
data-delay="400"    400ms de espera
data-delay="500"    500ms de espera
```

### Animaciones de Contador
```
data-count="50"     Cuenta de 0 a 50 en ~1.2s
data-count="98"     Cuenta de 0 a 98 en ~1.2s
```

---

## 🖱️ Efectos Interactivos

### Mouse (Hover)
| Elemento | Efecto |
|----------|-------|
| Logo | Rotación + escala |
| Links de nav | Acento naranja + subrayado |
| Botón primario | Elevación + magnetismo |
| Cards de seguros | Tilt 3D + elevación |
| Testimonios | Glow dinámico |
| Imagen hero | Zoom suave |

### Scroll
| Efecto | Descripción |
|--------|------------|
| Progress bar | Barra top que se llena |
| Header | Glassmorphism + fondo |
| Parallax | Curva fondo se mueve lento |

### Click
| Elemento | Efecto |
|----------|-------|
| Botones | Ripple (ondas) desde punto del click |
| Links #anchor | Scroll suave a sección |

---

## 🎯 Secciones de Código

### Modificar Colores
**Archivo:** `assets/css/style.css` (líneas 15-32)

```css
:root {
  --orange: #EA580C;           /* Cambiar aquí */
  --orange-light: #FFF7ED;
  --orange-dark: #C2410C;
  /* más colores... */
}
```

### Agregar Nueva Animación
**Paso 1:** Definir `@keyframes` en CSS

```css
@keyframes miAnimacion {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

**Paso 2:** Crear selector `.is-visible`

```css
[data-animate="mi-animacion"].is-visible {
  animation: miAnimacion 0.6s ease-out forwards;
}
```

**Paso 3:** Usar en HTML

```html
<div data-animate="mi-animacion">Contenido</div>
```

### Cambiar Fuente
**Archivo:** `assets/css/style.css` (línea 12)

```css
body { 
  font-family: 'Tu Fuente', system-ui, sans-serif;
}
```

### Editar Contenido de Seguros
**Archivo:** `index.html` (líneas ~150-220)

Busca `.seguro-card` y modifica:
- Icono SVG
- Título
- Descripción
- Features (lista)

---

## 📊 Estadísticas de Performance

### Tamaño de Archivos
- HTML: ~15 KB
- CSS: ~25 KB
- JS: ~12 KB
- Total: ~52 KB (muy ligero)

### Velocidad
- DOMContentLoaded: <1s
- Animaciones: 60 FPS
- Ripple effect: 600ms
- Contador: ~1.2s

### Compatibilidad
✅ Chrome 90+
✅ Firefox 88+
✅ Safari 14+
✅ Edge 90+
✅ Mobile (iOS 12+, Android 9+)

---

## 🛠️ Troubleshooting

### La página se ve lenta
**Solución:**
1. Desactivar parallax: comentar línea ~130 en `main.js`
2. Reducir animaciones: borrar `@keyframes` no usados

### Las imágenes no cargan
**Solución:**
1. Verificar que existe: `/assets/img/hero-pets.jpg`
2. Usar fallback de color: modificar `hero__image-wrapper` background

### El menú móvil no cierra
**Solución:**
1. Click en un link debe cerrar el menú
2. Agregar código en `main.js` para auto-cerrar

### Animaciones no funcionan
**Solución:**
1. Verificar que HTML tiene `data-animate`
2. Verificar que CSS tiene `.is-visible` selector
3. Abrir DevTools y revisar Console

---

## 📝 Próximas Mejoras (TODO)

- [ ] Añadir formulario de cotización real
- [ ] Integrar sistema de pagos
- [ ] Agregar analytics (Google Analytics)
- [ ] Optimizar imágenes (WebP)
- [ ] PWA (Progressive Web App)
- [ ] Multi-idioma (ES/EN)
- [ ] Dark mode
- [ ] Accessibility audit

---

## 📞 Contacto y Soporte

**Qbrete** - Tu seguro reinventado
- **Lema:** 100% Digital, 100% Confiable
- **Respaldado por:** Equidad Seguros
- **Servicio:** 24/7
- **Mercado:** Colombia

---

## 📚 Documentación Completa

Para documentación técnica más detallada, revisa:
- [README.md](README.md) - Descripción general del proyecto
- [DOCUMENTACION_TECNICA.md](DOCUMENTACION_TECNICA.md) - Especificaciones técnicas

---

*Última actualización: 30 de Marzo, 2026*
*Versión: 1.0*

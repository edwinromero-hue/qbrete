# Qbrete - Landing Page de Seguros Digitales

## Descripción General

Qbrete es una landing page moderna y responsiva para una empresa de seguros digitales respaldada por **Equidad Seguros**. El sitio ofrece seguros innovadores para mascotas y bicicletas con un enfoque 100% digital.

**Características principales:**
- ✅ 100% Digital - Activación instantánea
- ✅ 100% Confiable - Respaldado por Equidad Seguros
- ✅ Interfaz moderna con animaciones fluidas
- ✅ Totalmente responsivo (móvil, tablet, desktop)
- ✅ Rendimiento optimizado
- ✅ Accesibilidad mejorada

---

## Estructura del Proyecto

```
qbrete-website/
├── index.html              # Archivo HTML principal
├── start.sh                # Script para iniciar servidor local
├── assets/
│   ├── css/
│   │   └── style.css       # Estilos de toda la página
│   ├── img/                # Imágenes y activos visuales
│   └── js/
│       └── main.js         # Scripts de interactividad
└── README.md               # Este archivo
```

---

## Archivos y Contenido

### 1. **index.html** - Estructura HTML

Archivo principal que contiene la estructura semántica del sitio con las siguientes secciones:

| Sección | ID | Descripción |
|---------|------|-------------|
| **Header** | `header` | Barra de navegación fija con logo, menú y botón CTA |
| **Hero** | `hero` | Sección inicial con propuesta de valor y estadísticas |
| **Seguros** | `seguros` | Grid de tarjetas de productos (mascotas y bicicletas) |
| **Por qué elegirnos** | `nosotros` | Barras apiladas con diferenciadores de marca |
| **CTA** | `cotizar` | Llamada a la acción principal |
| **Testimonios** | `contacto` | Grid de cartas de clientes reales |
| **Footer** | N/A | Información legal y enlaces rápidos |

**Características técnicas:**
- Semántica HTML5 correcta
- Meta tags para SEO y responsive
- Fuente Google Fonts (Inter)
- Elementos SVG inline para iconos
- Atributos `data-animate` para animaciones con Intersection Observer

### 2. **assets/css/style.css** - Estilos y Animaciones

Archivo CSS completo que maneja:

#### Variables CSS (`:root`)
```css
--orange: #EA580C              /* Color primario */
--gray-900: #1a1a1a            /* Texto oscuro */
--gray-500: #737373            /* Texto secundario */
--radius-sm/md/lg: 12px/16px/24px    /* Border radius */
--shadow-sm/md/lg: sombras     /* Profundidad */
```

#### Componentes principales
- **Buttons** (`.btn`): Primario, outline, white con efectos hover
- **Header**: Navegación fija con efecto glassmorphism al scroll
- **Hero**: Sección hero con gradiente, badges y estadísticas con contadores
- **Cards (Seguros)**: Efecto tilt 3D al pasar mouse
- **Why Stack**: Barras de diferenciadores con gradientes y animación de entrada
- **Testimonios**: Grid responsive con efecto glow al hover
- **CTA**: Sección de conversión con gradiente naranja

#### Animaciones clave
```css
@keyframes fadeUp/Down/Left/Right   /* Entrada de elementos */
@keyframes float                     /* Flotación suave */
@keyframes pulse                     /* Pulsación de badges */
@keyframes slideBarIn               /* Entrada de barras */
@keyframes ripple                   /* Efecto ripple en botones */
```

#### Responsive Design
- Desktop (> 1024px): Layout de 2 columnas
- Tablet (768px - 1024px): Transformaciones de escala
- Móvil (< 768px): Stack vertical, barras escaladas

### 3. **assets/js/main.js** - Interactividad y Animaciones

Archivo JavaScript que gestiona todas las interacciones dinámicas:

#### 1. **Progress Bar** (Barra de progreso de scroll)
```javascript
- Crea barra de progreso en la parte superior
- Se actualiza en porcentaje al hacer scroll
```

#### 2. **Header Scroll Effect** (Efecto glassmorphism)
```javascript
- Aplica clase 'is-scrolled' cuando scrollY > 60px
- Activa backdrop-filter blur y sombra
```

#### 3. **Intersection Observer - Animaciones**
```javascript
- Observa elementos con data-animate
- Activa animaciones CSS cuando entran al viewport
- Soporta delays con data-delay
```

#### 4. **Counter Animation** (Números animados)
```javascript
- Anima números en estadísticas del hero
- Usa data-count para valor objetivo
- Incremente suave de 40 pasos en 30ms
```

#### 5. **Image Load Shimmer** (Efecto de carga de imagen)
```javascript
- Detecta cuando imagen .hero__image se carga
- Añade clase 'loaded' para remover shimmer
- Fallback a 3s si imagen no carga
```

#### 6. **Smooth Scroll** (Scroll suave de anclas)
```javascript
- Todos los links #ancla tienen scroll suave
- Offset para no ocultarse bajo header fijo
```

#### 7. **Mobile Hamburger Menu** (Menú móvil)
```javascript
- Toggle del menú de navegación en móvil
- Posición y estilos aplicados dinámicamente
```

#### 8. **Magnetic Button Effect** (Efecto magnético)
```javascript
- Botones primarios se "magnetizan" al mouse
- Translación suave de 15% a velocidad del cursor
```

#### 9. **Card Tilt Effect** (Efecto de inclinación 3D)
```javascript
- Cards de seguros se inclinan en perspectiva
- Basado en posición relativa del mouse
```

#### 10. **Parallax Effect** (Efecto parallax)
```javascript
- Bg curve se mueve a velocidad diferente que scroll
- Translate 30% + rotate sutil
```

#### 11. **Ripple Effect** (Efecto ondas)
```javascript
- Efecto de onda al hacer click en botones
- Escala y opacidad animadas
```

#### 12. **Testimonial Glow** (Efecto glow dinámico)
```javascript
- Cards de testimonios brillan donde está el cursor
- Gradiente radial que sigue al mouse
```

### 4. **start.sh** - Script de Inicio

Script bash para iniciar servidor local automáticamente.

**Funcionalidades:**
- Verifica si Python 3 está disponible
- Si falla, intenta con PHP
- Abre navegador automáticamente
- Levanta servidor en puerto 8080
- Mensaje claro de instrucciones

---

## Guía de Uso

### Iniciación rápida

```bash
# Dar permisos de ejecución
chmod +x start.sh

# Ejecutar script
./start.sh
```

El servidor se abrirá automáticamente en `http://localhost:8080`

### Navegación

| Enlace | Sección |
|--------|---------|
| **Inicio** | Hero principal |
| **Servicios** | Products (seguros) |
| **Nosotros** | Por qué elegirnos |
| **Seguros** | Grid de productos |
| **Contacto** | Testimonios |
| **Cotizar** | CTA principal |

---

## Tipos de Seguros

### 1. **Seguro para Mascotas** (Popular)
- Consultas veterinarias ilimitadas
- Cirugías y hospitalización
- Vacunas y tratamientos preventivos
- Medicamentos cubiertos al 100%
- Responsabilidad civil incluida

### 2. **Seguro para Bicicletas**
- Cobertura contra robo
- Daños accidentales cubiertos
- Asistencia en carretera 24/7
- Reemplazo de piezas
- Responsabilidad civil

---

## Tecnologías Utilizadas

| Tecnología | Uso | Versión |
|------------|-----|---------|
| **HTML5** | Estructura semántica | - |
| **CSS3** | Estilos y animaciones | - |
| **JavaScript (Vanilla)** | Interactividad | ES6+ |
| **Google Fonts** | Tipografía (Inter) | - |
| **SVG** | Iconos escalables | - |

---

## Optimizaciones Implementadas

✅ **Performance**
- CSS comprimido y eficiente
- Lazy loading de imágenes
- Animaciones con GPU acceleration
- Event listeners con `passive: true`

✅ **Accesibilidad**
- Semántica HTML5 correcta
- Labels en inputs y buttons
- Contraste de colores WCAG
- Attributes ARIA donde necesario

✅ **SEO**
- Meta tags descriptivos
- Estructura de headings correcta
- Keywords relevantes
- Open Graph listo

---

## Colores y Estilos

### Paleta de Colores
```
Primario:   #EA580C (Naranja vivo)
Claro:      #FFF7ED (Naranja muy claro)
Oscuro:     #C2410C (Naranja oscuro)
Texto:      #1a1a1a (Casi negro)
Gris:       #737373 (Secundario)
```

### Tipografía
```
Font Family: Inter (Google Fonts)
Pesos usados: 400, 500, 600, 700, 800
```

---

## Notas de Desarrollo

### Para agregar nuevas secciones:
1. Añadir HTML con estructura semántica
2. Usar clases BEM para CSS
3. Agregar `data-animate` para animaciones automáticas
4. Los Intersection Observers se aplican automáticamente

### Para editar animaciones:
- Modificar `@keyframes` en CSS
- Ajustar `cubic-bezier()` para timing
- Los delays se controlan con `data-delay` en HTML

### Para componentes dinámicos:
- Usar Intersection Observer para visibilidad
- Evitar animaciones pesadas en viewport pequeño
- Usar `will-change` para optimización

---

## Browser Compatibility

✅ Chrome 90+
✅ Firefox 88+
✅ Safari 14+
✅ Edge 90+
✅ Mobile (iOS 12+, Android 9+)

---

## Contacto y Soporte

**Qbrete** - 100% Digital, 100% Confiable  
Respaldado por **Equidad Seguros**  
Atención 24/7

---

*Documento actualizado: 30 de Marzo, 2026*

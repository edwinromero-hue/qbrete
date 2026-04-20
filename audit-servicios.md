# Audit: servicios.html vs Figma Design (Node 269:571)

**Date:** 2026-04-07
**Figma Frame:** 1440x2966px "servicios"
**HTML File:** `/Users/usuario1/Desktop/Proyecto_Qbrete/servicios.html`

---

## 1. CRITICAL ISSUES

### 1.1 Missing Decorative Vector (SVG element absent)
**Figma:** Absolute-positioned vector at x:1092, y:46 -- 479x885px, fill #FF4E00, opacity 0.2.
**HTML:** The `.deco-vector` class is styled in CSS (lines 51-63) but **no SVG element exists in the HTML markup**. There is no `<svg class="deco-vector">` anywhere in the body. The decorative orange shape is completely missing from the rendered page.

**Fix:**
```html
<!-- Add immediately after <div class="page-wrapper"> -->
<svg class="deco-vector" viewBox="0 0 479 885" xmlns="http://www.w3.org/2000/svg">
  <path d="M479 0C479 0 350 150 400 350C450 550 300 700 250 885H479V0Z" fill="#FF4E00" fill-opacity="0.2"/>
</svg>
```
*Note: The exact path data should be exported from the Figma vector node. The path above is a placeholder approximation. Use the actual SVG export from the `assets/images/decorative/deco-right.svg` file if it matches.*

Alternatively, reference the existing asset:
```html
<img src="assets/images/decorative/deco-right.svg" class="deco-vector" alt="" aria-hidden="true" />
```

### 1.2 Page Header Not Centered
**Figma:** The entire page-header section (269:993) is 1240px wide with items center-aligned. The badge, title, and subtitle are all center-aligned within the section.
**HTML:** `.page-header` uses `flex-direction: column` with no `align-items: center`. The badge is left-aligned (only `width: fit-content`), while the title and subtitle use `text-align: center`. The badge should be centered.

**Fix:**
```css
.page-header {
  display: flex;
  flex-direction: column;
  align-items: center; /* ADD THIS */
  gap: 21px;
}
```

### 1.3 Badge Padding Mismatch
**Figma:** Badge container is 253x72px with padding `0 16px` (top/bottom 0, left/right 16px). The height comes from the 40px icon + vertical centering in a 72px container, meaning the badge has vertical padding of 16px.
**HTML:** `.page-header-badge` has `padding: 16px` (all sides). This creates 16px padding on all four sides, which gives roughly the correct size, but the Figma spec says `padding: 0 16px` with the height being fixed at 72px.

**Fix:**
```css
.page-header-badge {
  padding: 0 16px;
  height: 72px;
}
```

### 1.4 Service Cards Have No Background Images
**Figma:** Each service card's image area (384x200px) contains an IMAGE fill -- actual product photos behind the icon and chip overlay.
**HTML:** `.service-card-image` uses a gradient placeholder `linear-gradient(135deg, #FFF5ED 0%, #FFE8D6 100%)` instead of actual product images.

**Fix:** Add background images to each card. Available product images in `assets/images/products/`:
```css
/* Card 1 - Mascotas */
.service-card:nth-child(1) .service-card-image {
  background: url('assets/images/products/product-mascotas-img.png') center/cover;
}
/* Card 2 - Hogar */
.service-card:nth-child(2) .service-card-image {
  background: url('assets/images/products/product-2.png') center/cover;
}
/* Card 3 - Veterinario Premium */
.service-card:nth-child(3) .service-card-image {
  background: url('assets/images/products/product-mascotas-2.png') center/cover;
}
/* Repeat for cards 4-6 accordingly */
```
Remove the fallback gradient or keep it as a fallback behind the image.

### 1.5 Service Card Fixed Height Missing
**Figma:** Each ServiceCard is exactly 384x533px.
**HTML:** `.service-card` has `width: 384px` but no height constraint. Cards will be different heights depending on text content. The `flex: 1` on `.service-card-body` helps, but there is no min-height or fixed height to match the Figma 533px.

**Fix:**
```css
.service-card {
  width: 384px;
  min-height: 533px; /* Match Figma */
}
```

### 1.6 "Cotizar" Button Has Extra Arrow Icons
**Figma:** The button inside service cards contains only the text "Cotizar" -- 16px Montserrat SemiBold, full-width, bg #FF4E00, radius 16px, padding 12px 20px. No arrow icons.
**HTML:** Each `.btn-primary` inside service cards contains TWO arrow SVG icons (one before and one after the text "Cotizar"). This does not match the Figma design.

**Fix:** Remove both SVGs from each service card button:
```html
<!-- BEFORE (wrong) -->
<a href="#" class="btn-primary">
  <svg ...></svg>
  Cotizar
  <svg ...></svg>
</a>

<!-- AFTER (correct) -->
<a href="#" class="btn-primary">Cotizar</a>
```

---

## 2. MISSING ELEMENTS

### 2.1 Mobile Hamburger Menu Button
**Figma:** Not specified (desktop only), but the `index.html` has a hamburger button pattern. The `servicios.html` is missing a hamburger button for mobile, and the `main.js` references `.hamburger-btn` which does not exist in this file.

**Fix:** Add a hamburger button inside the header for mobile:
```html
<button class="hamburger-btn" aria-label="Menu" aria-expanded="false" style="display:none;">
  <span></span><span></span><span></span>
</button>
```
And corresponding CSS:
```css
@media (max-width: 767px) {
  .hamburger-btn { display: flex !important; flex-direction: column; gap: 5px; background: none; border: none; cursor: pointer; padding: 4px; }
  .hamburger-btn span { width: 24px; height: 2px; background: #000; border-radius: 1px; }
}
```

### 2.2 Mobile Navigation Overlay
The `main.js` references `#mobileNav` and `.mobile-nav-close`, but no mobile navigation overlay exists in `servicios.html`.

**Fix:** Add a mobile nav overlay before closing `</body>`:
```html
<div id="mobileNav" class="mobile-nav">
  <button class="mobile-nav-close" aria-label="Cerrar">&times;</button>
  <a href="index.html">Inicio</a>
  <a href="servicios.html" class="active">Servicios</a>
  <a href="#">Mi comunidad</a>
  <a href="#">Beneficios</a>
  <a href="#">PQRS</a>
  <a href="#">Reporta tu siniestro</a>
</div>
```

### 2.3 Header Shadow Not in Figma
**Figma:** Header has bg #fff, radius 24px, no shadow specified.
**HTML:** Header has `box-shadow: 0 2px 20px rgba(0,0,0,0.06)` which is not in the Figma spec.

**Fix (optional):** If pixel-perfect to Figma is required, remove the shadow:
```css
.header { box-shadow: none; }
```
However, the shadow improves UX on scroll, so this may be intentional.

### 2.4 Service Card Description Text Missing from Some Cards
**Figma spec mentions specific descriptions for each card type, but the HTML descriptions do not exactly match for all cards. Verify each card's description against copywriting.**

### 2.5 Footer Social Media Icons
**Figma footer:** The footer body has horizontal layout with padding 32px. The HTML footer is missing any social media icons or links that might be present in the full Figma footer design. (Cannot confirm without full footer node data.)

---

## 3. WRONG VALUES

### 3.1 Body Background
**Figma:** Overall frame has no explicit background gradient -- it is a flat container.
**HTML:** `body { background: linear-gradient(155deg, #ffffff 0%, #fff7ed 100%); }` -- this warm gradient is not specified in the Figma design.

**Fix:**
```css
body { background: #ffffff; }
```
Or keep the gradient if it is an intentional enhancement.

### 3.2 Page Header Title Width
**Figma:** Title width is explicitly 983px.
**HTML:** `.page-header h1` has no `max-width`. On a 1240px container, the title can span the full width.

**Fix:**
```css
.page-header h1 {
  max-width: 983px;
}
```

### 3.3 Page Header Badge Line-Height
**Figma:** Badge text "Nuestros servicios" has line-height 28px.
**HTML:** `.page-header-badge span` has no line-height specified.

**Fix:**
```css
.page-header-badge span {
  line-height: 28px;
}
```

### 3.4 Page Header Badge Shadow
**Figma:** No shadow on badge.
**HTML:** `.page-header-badge { box-shadow: 0 2px 12px rgba(0,0,0,0.04); }` -- this shadow is not in the Figma spec.

**Fix:**
```css
.page-header-badge { box-shadow: none; }
```

### 3.5 Step Number Badge Border-Radius
**Figma:** Number badge has `radius: 20px` on a 32x32px element, creating a full circle.
**HTML:** `.step-number { border-radius: 50%; }` -- This is functionally correct (50% on a square = circle). **No fix needed.**

### 3.6 Steps Connecting Line Position
**Figma:** The connecting line (274:489) is 874px wide, positioned at approximately y~48px (center of 96px icons).
**HTML:** `.steps-line { top: 48px; left: 130px; right: 130px; height: 2px; }` -- The left/right offsets are approximations. The Figma line is exactly 874px.

**Fix:** Calculate precise offsets. Container is 1240px - 96px(2*padding) = 1144px usable. Line should be 874px centered on the icon centers:
```css
.steps-line {
  top: 48px;
  left: calc(48px + 18px); /* icon center (48px) + card padding (18px) */
  width: 874px;
  right: auto;
}
```
Or more precisely, the line should connect from the center of the first icon to the center of the last icon.

### 3.7 Services Section Header Gap
**Figma:** The "Nuestros Servicios" header has the title and subtitle with an implied gap (margin-bottom on h2 is not specified as separate container gap).
**HTML:** `.services-header h2 { margin-bottom: 12px; }` -- 12px gap between title and subtitle. Figma does not specify an explicit gap value here but uses a container with gap. Verify against Figma -- likely the gap should match the 16px pattern used elsewhere.

**Fix (if gap should be 16px):**
```css
.services-header h2 { margin-bottom: 16px; }
```

### 3.8 Service Card Icon Box Padding
**Figma:** Icon box inside service cards has `padding: 8px`.
**HTML:** `.service-icon-box` has no padding. The icon SVG inside is 32x32 in a 48x48 box, which implicitly creates 8px padding via flex centering. **Functionally correct but fragile.**

### 3.9 Service Chip Text Color
**Figma:** Chip text "Popular" -- 14px Montserrat SemiBold. Color not explicitly stated in the spec but typically dark or orange.
**HTML:** `.service-chip { color: #FF4E00; }` -- Orange text. Verify this matches the Figma. If Figma uses dark text, fix:
```css
.service-chip { color: #101828; }
```

### 3.10 Footer Ellipse Dimensions
**Figma:** Ellipse is 2178x534px, fill #3A3A3A.
**HTML:** `<ellipse cx="720" cy="100" rx="1089" ry="100"/>` -- rx=1089 (so width=2178, correct), but ry=100 (height=200px), not 534px. The ellipse is much flatter than in Figma.

**Fix:**
```html
<svg class="footer-curve" viewBox="0 0 1440 267" preserveAspectRatio="none" fill="#3A3A3A">
  <ellipse cx="720" cy="267" rx="1089" ry="267"/>
</svg>
```
And update CSS:
```css
.footer-curve {
  height: 267px; /* half of 534px ellipse height */
}
```

### 3.11 Footer Height and Padding
**Figma:** Footer body is 1440x515px with padding 32px, horizontal layout.
**HTML:** `.footer { padding: 32px; }` -- padding matches. But `.footer-inner` uses `flex-direction: column` with `gap: 64px`. Figma says the footer body has horizontal layout.

**Fix:**
```css
.footer-inner {
  display: flex;
  flex-direction: row; /* horizontal, not column */
  gap: 64px;
}
```
*Note: Need to verify if the Figma footer body truly uses horizontal layout at the top level or if there are nested containers.*

### 3.12 Main Section Width
**Figma:** Main section is 1240px wide.
**HTML:** `.main-section` has no explicit width. The `page-wrapper` is `max-width: 1440px` with `padding: 10px 100px`, giving 1240px content area. **This is correct.**

### 3.13 "How It Works" Card Width
**Figma:** 1240x485px card.
**HTML:** No explicit width on `.how-it-works`. It fills the parent (1240px from padding), which is correct. No explicit height either -- this is fine as it should be content-driven but verify visually that it matches 485px.

### 3.14 Step Card Width
**Figma:** Each StepCard is 341x237px.
**HTML:** `.step-card { flex: 1; }` -- This distributes equally. With 1144px (1240-96 padding) and 10px gaps, each card gets ~(1144 - 20) / 3 = 374px. The Figma spec says 341px per card. The discrepancy is 33px per card.

**Fix:** The Figma cards at 341px * 3 + 10px * 2 gaps = 1043px, which is less than the 1144px available (1240 - 48*2 = 1144px). This means cards are NOT stretching to fill. They should have fixed width:
```css
.step-card {
  flex: none;
  width: 341px;
}
.steps-container {
  justify-content: space-between; /* or center with gap */
}
```

### 3.15 Gradient Direction on Step Icons
**Figma:** Icon gradient is `#FF4E00 -> #FF8A5C` (the spec doesn't specify angle explicitly, but typical is 180deg top-to-bottom).
**HTML:** `.step-icon { background: linear-gradient(180deg, #FF4E00, #FF8A5C); }` -- **Matches.**

### 3.16 Service Card Width Calculation for Responsive
**HTML (line 449):** At `max-width: 1023px`, cards use `width: calc(50% - 16px)`. This assumes gap of 32px split between 2 cards (16px each). This is correct for a 2-column layout.

### 3.17 Header CTA Button Size
**Figma:** CTA button is 98x42px.
**HTML:** `.btn-primary { padding: 12px 20px; }` -- With 16px font, this gives roughly 40px height (16px + 24px padding). The width depends on text content "Cotizar" -- likely close to 98px. May need explicit sizing:
```css
.header .btn-primary {
  min-width: 98px;
  height: 42px;
  padding: 0 20px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}
```

### 3.18 Overall Page Gap
**Figma:** Overall frame gap is 70px between major sections (header, main, footer area).
**HTML:** `.main-section { margin-top: 70px; }` and `.footer-wrapper { margin-top: 70px; }` -- **Correct.**

---

## 4. NAVIGATION ISSUES

### 4.1 "Mi comunidad", "Beneficios", "PQRS", "Reporta tu siniestro" Links Are Dead
All four nav links point to `href="#"`. They should link to actual pages or anchors.

**Fix:** Update href values once those pages exist:
```html
<a href="comunidad.html">Mi comunidad</a>
<a href="beneficios.html">Beneficios</a>
<a href="pqrs.html">PQRS</a>
<a href="siniestro.html">Reporta tu siniestro</a>
```

### 4.2 "Servicios" Nav Link Active State
**HTML:** `<a href="servicios.html" class="active">Servicios</a>` with `.header nav a.active { color: #FF4E00; font-weight: 600; }` -- Active state is present and correct.

### 4.3 "Cotizar" Buttons in Cards Are Dead Links
All six service cards have `<a href="#" class="btn-primary">Cotizar</a>`. These should route to a quote/checkout flow.

**Fix:** Update each card's button to route appropriately:
```html
<a href="cotizar.html?producto=mascotas" class="btn-primary">Cotizar</a>
```

### 4.4 Header "Cotizar" CTA Is a Dead Link
The header CTA `<a href="#" class="btn-primary">Cotizar</a>` also points to `#`.

**Fix:**
```html
<a href="cotizar.html" class="btn-primary">Cotizar</a>
```

### 4.5 Footer Links Are All Dead
All footer links (`Mascotas`, `Bicicletas`, `Hogar`, `Nosotros`, `Blog`, `Contacto`, `Terminos`, `Privacidad`, `Cookies`) point to `href="#"`.

### 4.6 Logo Links
Header logo correctly links to `index.html`. Footer logo (white version) has no link wrapper -- it's just an `<img>`.

**Fix:**
```html
<a href="index.html"><img src="assets/logos/logo-qbrete-white.svg" alt="Qbrete" class="brand-logo" /></a>
```

---

## 5. ANIMATION READINESS

### 5.1 Missing `data-animate` Attributes
The `assets/css/style.css` defines animation classes using `[data-animate]` attributes (`fade-up`, `fade-down`, `fade-right`, `fade-left`, `float`), but `servicios.html` uses GSAP inline scripts instead. This creates two parallel animation systems. For consistency, consider choosing one approach.

**Current GSAP animations present:**
- `.page-header-badge` -- fade up
- `.page-header h1` -- fade up
- `.page-header .subtitle` -- fade up
- `.how-it-works` -- fade up on scroll
- `.step-card` -- staggered fade up on scroll
- `.steps-line` -- scale X from left on scroll
- `.service-card` -- staggered fade up on scroll

**Missing animations (for polish):**
- Header entrance animation (slide down on load)
- Footer entrance animation (fade up on scroll)
- Service card hover states for the image area (zoom effect on background image)
- Badge icon pulse/breathing animation

### 5.2 Components Needing data-attributes for Future Animation
If migrating to CSS-based animations, add these attributes:
```html
<div class="page-header-badge" data-animate="fade-up">
<h1 data-animate="fade-up" data-delay="150">
<p class="subtitle" data-animate="fade-up" data-delay="250">
<section class="how-it-works" data-animate="fade-up">
<div class="step-card" data-animate="fade-up" data-delay="0|150|300">
<div class="service-card" data-animate="fade-up" data-delay="0|100|200|300|400|500">
```

### 5.3 Scroll Progress Bar
Created dynamically via `main.js` (line 9). The `.scroll-progress` class is defined in both `servicios.html` inline CSS and `assets/css/style.css`. **No conflict** since `style.css` is not loaded in `servicios.html`.

### 5.4 GSAP autoAlpha Requires visibility:hidden
GSAP's `autoAlpha` property combines `opacity` and `visibility`. The `from` tween sets `autoAlpha: 0` which means elements start invisible. However, if JavaScript fails to load, elements remain invisible. Consider adding a fallback:
```css
.no-js .page-header-badge,
.no-js .page-header h1,
.no-js .page-header .subtitle,
.no-js .how-it-works,
.no-js .step-card,
.no-js .service-card {
  opacity: 1 !important;
  visibility: visible !important;
}
```
And add `class="no-js"` to `<html>`, removing it via JS:
```html
<html lang="es" class="no-js">
<script>document.documentElement.classList.remove('no-js');</script>
```

### 5.5 Service Card Hover Transform Conflict with GSAP
`.service-card:hover { transform: translateY(-4px); }` may conflict with GSAP-applied transforms. GSAP sets inline styles, and the CSS hover may not override them.

**Fix:** Use `!important` or apply GSAP transforms via CSS class toggling instead:
```css
.service-card { will-change: transform; }
.service-card:hover { transform: translateY(-4px) !important; }
```

---

## 6. SPECIFIC FIX INSTRUCTIONS (PRIORITY ORDER)

### P0 -- Must Fix

1. **Add decorative vector SVG to HTML** (Section 1.1)
   - Use the existing `assets/images/decorative/deco-right.svg` as an `<img>` with class `deco-vector`
   - Ensure `pointer-events: none` and `z-index: 0`

2. **Center the page-header badge** (Section 1.2)
   - Add `align-items: center` to `.page-header`

3. **Remove arrow icons from service card buttons** (Section 1.6)
   - Delete both `<svg>` elements inside each `.btn-primary` in service cards
   - The Figma button is text-only: "Cotizar"

4. **Add actual product images to service cards** (Section 1.4)
   - Replace gradient backgrounds with `background-image` using photos from `assets/images/products/`
   - Keep gradient as fallback

5. **Fix footer ellipse proportions** (Section 3.10)
   - Change `ry` from 100 to 267
   - Update viewBox and height accordingly

### P1 -- Should Fix

6. **Set max-width on page title** (Section 3.2)
   - Add `max-width: 983px` to `.page-header h1`

7. **Fix badge padding** (Section 1.3)
   - Change to `padding: 0 16px; height: 72px;`
   - Remove `box-shadow` from badge (Section 3.4)

8. **Fix step card widths** (Section 3.14)
   - Set `flex: none; width: 341px;` on `.step-card`
   - Adjust steps-container to center or space-between

9. **Fix service card min-height** (Section 1.5)
   - Add `min-height: 533px` to `.service-card`

10. **Set header CTA explicit dimensions** (Section 3.17)
    - `min-width: 98px; height: 42px;`

### P2 -- Nice to Have

11. **Add line-height to badge text** (Section 3.3)
12. **Remove body gradient if not in Figma** (Section 3.1)
13. **Add hamburger menu for mobile** (Section 2.1, 2.2)
14. **Fix footer layout direction** (Section 3.11)
15. **Add no-JS fallback for animations** (Section 5.4)
16. **Update dead navigation links** (Sections 4.1-4.5)

---

## SUMMARY

| Category | Count |
|----------|-------|
| Critical Issues | 6 |
| Missing Elements | 5 |
| Wrong Values | 18 |
| Navigation Issues | 6 |
| Animation Items | 5 |
| Total Issues | 40 |

**Most impactful fixes** (ordered by visual impact):
1. Add decorative vector SVG element to DOM
2. Center page-header badge
3. Remove arrow icons from "Cotizar" buttons in cards
4. Add product images to service cards
5. Fix footer curve proportions
6. Set title max-width to 983px
7. Fix step card widths to 341px

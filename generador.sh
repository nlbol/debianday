#!/bin/bash
set -euo pipefail

# ============================================================
#  DEBIANDAY LANDING PAGE GENERATOR
#  Genera un sitio web estatico profesional para DebianDay
#  Listo para GitHub Pages - Solo HTML/CSS/JS vanilla
# ============================================================

# ============================================================
# >> CONFIGURACION DEL EVENTO <<
# Modifica solo estas variables para personalizar el sitio
# ============================================================

####################################################
# CONFIGURACION GENERAL
####################################################
TITULO_EVENTO="DebianDay 2026"
SUBTITULO="Celebrando la libertad del software libre"
DESCRIPCION="El evento más importante de la comunidad Debian en Latinoamérica. Conferencias, talleres y networking para toda la comunidad de software libre."
FECHA="15 de Agosto de 2026"
HORA="00:00 - 00:00"
LUGAR="UAGRM - Salón auditorio Politecnica"
CIUDAD="Santa Cruz"
PAIS="Bolivia"
BOTON_REGISTRO="Registrarme"
URL_REGISTRO="https://example.com"
DOMINIO="https://debianday.nucleolinux.org"

####################################################
# APARIENCIA
####################################################
COLOR_PRIMARIO="#D70A53"
COLOR_SECUNDARIO="#2B5797"
COLOR_ACENTO="#E8A0B0"
TEXT_SECONDARY_COLOR="#FFFFFF"

####################################################
# TEMA (Dark / Light)
####################################################
TEMA_PREDETERMINADO="dark"
ENABLE_THEME_SWITCH=false

####################################################
# HERO
####################################################
HERO_TITULO="DebianDay"
HERO_DESCRIPCION="Un evento para toda la comunidad: aprendé, compartí y colaborá con el ecosistema Debian."
HERO_BOTON_REGISTRO="Quiero asistir"
HERO_BOTON_CRONOGRAMA="Ver cronograma"

####################################################
# INFORMACION
####################################################
INFO_TITULO="Sobre el evento"
INFO_DESCRIPCION="DebianDay es un evento anual organizado por la comunidad Debian que reúne a entusiastas, desarrolladores y usuarios del sistema operativo universal."
INFO_OBJETIVOS="Difundir Debian, fomentar la colaboración, compartir conocimiento"
INFO_PUBLICO="Desarrolladores, sysadmins, estudiantes y entusiastas del software libre"
INFO_ORGANIZA="Comunidad Nucleo Linux Bolivia (NLBOL)"

####################################################
# ESTADISTICAS
####################################################
CANTIDAD_CONFERENCIAS="3"
CANTIDAD_TALLERES="3"
CANTIDAD_PONENTES="6"
CANTIDAD_PATROCINADORES="1"
CANTIDAD_PARTICIPANTES="25+"

####################################################
# SPEAKERS
####################################################
# Formato: "FOTO|NOMBRE|CARGO|EMPRESA|BIO|GITHUB|MASTODON|LINKEDIN|WEB"
declare -a SPEAKERS
SPEAKERS+=(
  "assets/img/speakers/fershouno.jpeg|Fersho Uno|Administrador de Infraestructura|Grupo Editorial La Hoguera|Contribuidor oficial de proyectos FOSS desde 2019. Especialista en Seguridad Informatica, Servidores y Redes.|https://github.com/FershoUno||https://www.linkedin.com/in/fershouno|https://fershouno.me"
)

####################################################
# CRONOGRAMA
####################################################
# Formato: "HORA_INICIO|HORA_FIN|TITULO|PONENTE|TIPO|UBICACION|DESCRIPCION|COLOR"
declare -a CRONOGRAMA
CRONOGRAMA+=(
  "09:00|09:30|Registro y bienvenida|-|Registro|Entrada principal|Acreditación y café de bienvenida|#0B0F1A"
  "09:30|10:15|Debian: de 0 a 100|Alguien Mas|Conferencia|Auditorio|Historia y visión del proyecto Debian|#0B0F1A"
  "10:15|11:00|Instalación de Debian para principiantes|Fersho Uno|Taller|Auditorio|Guía paso a paso para instalar Debian sin romperse la cabeza :D|#0B0F1A"
  "11:00|11:30|Preguntas y Stickers|—|Pausa|Auditorio|Descanso con soda y algo|#0B0F1A"
  "11:30|12:00|Debian en el servidor|Fersho Uno|Conferencia|Auditorio|Debian como servidor de producción|#0B0F1A"
  "12:05|12:20|Cierre y sorteos|Organizacion|Charla|Auditorio |Palabras finales y cierre del evento|#0B0F1A"
)

####################################################
# UBICACION
####################################################
LATITUD="-17.775122"
LONGITUD="-63.193719"
ZOOM="17"
TITULO_UBICACION="UAGRM - Salón auditorio Politecnica"
DESCRIPCION_UBICACION="El evento se realizará en el Centro de Convenciones, ubicado en el corazón de la ciudad, con fácil acceso en transporte público."

####################################################
# CONFIGURACION DEL MAPA
####################################################
MAP_MARKER_ICON=""
MAP_MARKER_WIDTH=32
MAP_MARKER_HEIGHT=40

####################################################
# FAQ
####################################################
# Formato: "PREGUNTA|RESPUESTA"
declare -a FAQ
FAQ+=(
  "¿El evento es gratuito?|Sí, DebianDay es completamente gratuito para todos los asistentes."
  "¿Necesito conocimientos previos?|No, el evento está diseñado para todos los niveles, desde principiantes hasta expertos."
  "¿Debo llevar mi computadora?|Recomendamos traer tu laptop para participar en los talleres prácticos."
  "¿Habrá certificados?|No, no se entregarán certificados de asistencia."
  "¿Habrá traducción?|Las charlas serán en español. Algunas podrían tener soporte en inglés."
)

####################################################
# PATROCINADORES
####################################################
# Formato: "NOMBRE|LOGO|URL|CATEGORIA"
# Categorias: Gold, Silver, Bronze, Community
declare -a SPONSORS
SPONSORS+=(
  "Nucleo Linux Bolivia|assets/img/sponsors/nlbol.jpg|https://nucleolinux.org|Community"
  "Nucleo Linux UAGRM|assets/img/sponsors/nluagrm.png|https://nluagrm.org|Community"
)

####################################################
# REDES SOCIALES
####################################################
declare -A SOCIAL
SOCIAL[facebook]="https://facebook.com/"
SOCIAL[instagram]=""
SOCIAL[x]=""
SOCIAL[telegram]="https://t.me/+Ou8hL-sMLrg1MTIx"
SOCIAL[matrix]=""
SOCIAL[discord]=""
SOCIAL[github]="https://github.com/nlbol"
SOCIAL[gitlab]=""
SOCIAL[mastodon]=""
SOCIAL[youtube]="https://www.youtube.com/@NucleoLinuxBolivia"
SOCIAL[linkedin]=""
SOCIAL[website]="https://debianday.nucleolinux.org"

####################################################
# FOOTER
####################################################
COPYRIGHT="DebianDay 2026"
ORGANIZADOR="Comunidad Nucleo Linux Bolivia"
CORREO="fershouno@proton.me"
LICENCIA="CC BY-SA 4.0"

####################################################
# MASCOTAS
####################################################
MASCOTA_TUX="assets/img/mascots/tux.svg"
MASCOTA_GNU="assets/img/mascots/gnu.svg"

####################################################
# LOGOS
####################################################
ENABLE_DEBIAN_LOGO=true
DEBIAN_LOGO_IMAGE="assets/img/logos/debian.svg"

####################################################
# CONFIGURACION DE IMAGENES
####################################################
FAVICON="assets/img/icons/favicon.svg"
LOGO_PRINCIPAL="assets/img/logos/logo.svg"
LOGO_CLARO="assets/img/logos/logo-light.svg"
LOGO_OSCURO="assets/img/logos/logo-dark.svg"
IMAGEN_HERO="assets/img/hero/hero-bg.svg"
IMAGEN_HERO_BG="assets/img/hero/hero-bg.svg"

####################################################
# LOGO COMO FONDO (WATERMARK)
####################################################
ENABLE_DEBIAN_BACKGROUND=true
DEBIAN_BACKGROUND_IMAGE="assets/img/background/debian-watermark.svg"
DEBIAN_BACKGROUND_OPACITY="0.03"
DEBIAN_BACKGROUND_SIZE="contain"
DEBIAN_BACKGROUND_POSITION="center"

####################################################
# CONFIGURACION DE ICONOS (Lucide Icons)
####################################################
ICON_CALENDAR="calendar"
ICON_LOCATION="map-pin"
ICON_CLOCK="clock"
ICON_TICKET="ticket"
ICON_MENU="menu"
ICON_SUN="sun"
ICON_MOON="moon"
ICON_GITHUB="github"
ICON_LINKEDIN="linkedin"
ICON_GLOBE="globe"
ICON_AT_SIGN="at-sign"
ICON_TARGET="target"
ICON_USERS="users"
ICON_HEART="heart"
ICON_MAIL="mail"
ICON_YOUTUBE="youtube"
ICON_FACEBOOK="facebook"
ICON_INSTAGRAM="instagram"
ICON_TWITTER="twitter"
ICON_SPEAKER="mic"
ICON_FAQ="help-circle"
ICON_SPONSOR="award"
ICON_MASTODON="mastodon"
ICON_TELEGRAM="send"
ICON_DISCORD="message-circle"
ICON_MATRIX="message-square"
ICON_GITLAB="gitlab"
ICON_WEBSITE="globe"

####################################################
# CONFIGURACION AVANZADA
####################################################
declare -a SECTION_ORDER
SECTION_ORDER=(
  hero
  information
  statistics
  speakers
  schedule
  sponsors
  faq
  location
  footer
)
SHOW_HERO=true
SHOW_INFORMATION=true
SHOW_STATISTICS=true
SHOW_SPEAKERS=true
SHOW_SCHEDULE=true
SHOW_LOCATION=true
SHOW_SPONSORS=true
SHOW_FAQ=true
SHOW_FOOTER=true

# ============================================================
# >> FIN DE LA CONFIGURACION <<
# No modificar nada de aqui en adelante a menos que sepas
# lo que estas haciendo.
# ============================================================

# --- Directorios ---
OUTPUT_DIR="public"
ASSETS_SRC="assets"
DIRS=(
  "$OUTPUT_DIR/assets/img/hero"
  "$OUTPUT_DIR/assets/img/speakers"
  "$OUTPUT_DIR/assets/img/sponsors"
  "$OUTPUT_DIR/assets/img/mascots"
  "$OUTPUT_DIR/assets/img/icons"
  "$OUTPUT_DIR/assets/img/logos"
  "$OUTPUT_DIR/assets/img/background"
  "$OUTPUT_DIR/assets/data/json"
  "$OUTPUT_DIR/assets/description"
  "$OUTPUT_DIR/css"
  "$OUTPUT_DIR/js"
)

# ============================================================
# HELPER: escape para JSON
# ============================================================
json_escape() {
  printf '%s' "$1" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | sed 's/\t/\\t/g' | sed 's/\r//g' | sed ':a;N;$!ba;s/\n/\\n/g'
}

# ============================================================
# GENERAR: Directorios
# ============================================================
generar_directorios() {
  echo "  Creando directorios..."
  for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
  done
}

# ============================================================
# COPIAR: Assets desde el directorio fuente
# ============================================================
copiar_assets_desde_fuente() {
  echo "  Copiando assets desde $ASSETS_SRC/img/ a $OUTPUT_DIR/assets/img/ ..."
  if [ -d "$ASSETS_SRC/img" ]; then
    cp -rn "$ASSETS_SRC/img/"* "$OUTPUT_DIR/assets/img/" 2>/dev/null || true
  fi
  if [ -d "$ASSETS_SRC/data/json" ]; then
    echo "  Copiando datos JSON desde $ASSETS_SRC/data/json/ ..."
    cp -rn "$ASSETS_SRC/data/json/"* "$OUTPUT_DIR/assets/data/json/" 2>/dev/null || true
  fi
}

# ============================================================
# GENERAR: JSON del evento
# ============================================================
generar_json_evento() {
  cat > "$OUTPUT_DIR/assets/description/event.json" << JSONEOF
{
  "title": "$(json_escape "$TITULO_EVENTO")",
  "subtitle": "$(json_escape "$SUBTITULO")",
  "description": "$(json_escape "$DESCRIPCION")",
  "date": "$(json_escape "$FECHA")",
  "time": "$(json_escape "$HORA")",
  "venue": "$(json_escape "$LUGAR")",
  "city": "$(json_escape "$CIUDAD")",
  "country": "$(json_escape "$PAIS")",
  "registerButton": "$(json_escape "$BOTON_REGISTRO")",
  "registerUrl": "$(json_escape "$URL_REGISTRO")",
  "domain": "$(json_escape "$DOMINIO")",
  "primaryColor": "$COLOR_PRIMARIO",
  "secondaryColor": "$COLOR_SECUNDARIO",
  "accentColor": "$COLOR_ACENTO",
  "hero": {
    "title": "$(json_escape "$HERO_TITULO")",
    "description": "$(json_escape "$HERO_DESCRIPCION")",
    "buttonRegister": "$(json_escape "$HERO_BOTON_REGISTRO")",
    "buttonSchedule": "$(json_escape "$HERO_BOTON_CRONOGRAMA")"
  },
  "information": {
    "title": "$(json_escape "$INFO_TITULO")",
    "description": "$(json_escape "$INFO_DESCRIPCION")",
    "objectives": "$(json_escape "$INFO_OBJETIVOS")",
    "audience": "$(json_escape "$INFO_PUBLICO")",
    "organizer": "$(json_escape "$INFO_ORGANIZA")"
  },
  "statistics": {
    "conferences": "$CANTIDAD_CONFERENCIAS",
    "workshops": "$CANTIDAD_TALLERES",
    "speakers": "$CANTIDAD_PONENTES",
    "sponsors": "$CANTIDAD_PATROCINADORES",
    "participants": "$CANTIDAD_PARTICIPANTES"
  },
  "location": {
    "title": "$(json_escape "$TITULO_UBICACION")",
    "description": "$(json_escape "$DESCRIPCION_UBICACION")",
    "latitude": $LATITUD,
    "longitude": $LONGITUD,
    "zoom": $ZOOM,
    "markerIcon": "$MAP_MARKER_ICON",
    "markerWidth": $MAP_MARKER_WIDTH,
    "markerHeight": $MAP_MARKER_HEIGHT
  },
  "footer": {
    "copyright": "$(json_escape "$COPYRIGHT")",
    "organizer": "$(json_escape "$ORGANIZADOR")",
    "email": "$(json_escape "$CORREO")",
    "license": "$(json_escape "$LICENCIA")"
  },
  "images": {
    "favicon": "$FAVICON",
    "logo": "$LOGO_PRINCIPAL",
    "logoLight": "$LOGO_CLARO",
    "logoDark": "$LOGO_OSCURO",
    "hero": "$IMAGEN_HERO",
    "heroBg": "$IMAGEN_HERO_BG",
    "footerBg": "",
    "banner": "",
    "mascotTux": "$MASCOTA_TUX",
    "mascotGnu": "$MASCOTA_GNU"
  },
  "icons": {
    "calendar": "$ICON_CALENDAR",
    "location": "$ICON_LOCATION",
    "clock": "$ICON_CLOCK",
    "ticket": "$ICON_TICKET",
    "menu": "$ICON_MENU",
    "sun": "$ICON_SUN",
    "moon": "$ICON_MOON",
    "github": "$ICON_GITHUB",
    "linkedin": "$ICON_LINKEDIN",
    "globe": "$ICON_GLOBE",
    "atSign": "$ICON_AT_SIGN",
    "target": "$ICON_TARGET",
    "users": "$ICON_USERS",
    "heart": "$ICON_HEART",
    "mail": "$ICON_MAIL",
    "youtube": "$ICON_YOUTUBE",
    "facebook": "$ICON_FACEBOOK",
    "instagram": "$ICON_INSTAGRAM",
    "twitter": "$ICON_TWITTER",
    "speaker": "$ICON_SPEAKER",
    "faq": "$ICON_FAQ",
    "sponsor": "$ICON_SPONSOR",
    "mastodon": "$ICON_MASTODON",
    "telegram": "$ICON_TELEGRAM",
    "discord": "$ICON_DISCORD",
    "matrix": "$ICON_MATRIX",
    "gitlab": "$ICON_GITLAB",
    "website": "$ICON_WEBSITE"
  },
  "appearance": {
    "textSecondaryColor": "$TEXT_SECONDARY_COLOR"
  },
  "debian": {
    "enableLogo": $ENABLE_DEBIAN_LOGO,
    "logoImage": "$DEBIAN_LOGO_IMAGE",
    "enableBackground": $ENABLE_DEBIAN_BACKGROUND,
    "backgroundImage": "$DEBIAN_BACKGROUND_IMAGE",
    "backgroundOpacity": "$DEBIAN_BACKGROUND_OPACITY",
    "backgroundSize": "$DEBIAN_BACKGROUND_SIZE",
    "backgroundPosition": "$DEBIAN_BACKGROUND_POSITION"
  },
  "settings": {
    "defaultTheme": "$TEMA_PREDETERMINADO",
    "enableThemeSwitch": $ENABLE_THEME_SWITCH,
    "order": [$(for s in "${SECTION_ORDER[@]}"; do echo -n "\"$s\","; done | sed 's/,$//')],
    "visibility": {
      "hero": $SHOW_HERO,
      "information": $SHOW_INFORMATION,
      "statistics": $SHOW_STATISTICS,
      "speakers": $SHOW_SPEAKERS,
      "schedule": $SHOW_SCHEDULE,
      "location": $SHOW_LOCATION,
      "sponsors": $SHOW_SPONSORS,
      "faq": $SHOW_FAQ,
      "footer": $SHOW_FOOTER
    }
  }
}
JSONEOF
}

# ============================================================
# GENERAR: JSON de speakers
# ============================================================
generar_json_speakers() {
  echo -n '[' > "$OUTPUT_DIR/assets/description/speakers.json"
  local first=true
  for entry in "${SPEAKERS[@]}"; do
    IFS='|' read -r foto nombre cargo empresa bio github mastodon linkedin web <<< "$entry"
    if [ "$first" = true ]; then first=false; else echo -n ',' >> "$OUTPUT_DIR/assets/description/speakers.json"; fi
    cat >> "$OUTPUT_DIR/assets/description/speakers.json" << JSONEOF
{
  "photo": "$(json_escape "$foto")",
  "name": "$(json_escape "$nombre")",
  "role": "$(json_escape "$cargo")",
  "company": "$(json_escape "$empresa")",
  "bio": "$(json_escape "$bio")",
  "github": "$(json_escape "$github")",
  "mastodon": "$(json_escape "$mastodon")",
  "linkedin": "$(json_escape "$linkedin")",
  "web": "$(json_escape "$web")"
}
JSONEOF
  done
  echo ']' >> "$OUTPUT_DIR/assets/description/speakers.json"
}

# ============================================================
# GENERAR: JSON de cronograma
# ============================================================
generar_json_cronograma() {
  echo -n '[' > "$OUTPUT_DIR/assets/description/schedule.json"
  local first=true
  for entry in "${CRONOGRAMA[@]}"; do
    IFS='|' read -r h_inicio h_fin titulo ponente tipo ubicacion descripcion color <<< "$entry"
    if [ "$first" = true ]; then first=false; else echo -n ',' >> "$OUTPUT_DIR/assets/description/schedule.json"; fi
    cat >> "$OUTPUT_DIR/assets/description/schedule.json" << JSONEOF
{
  "start": "$(json_escape "$h_inicio")",
  "end": "$(json_escape "$h_fin")",
  "title": "$(json_escape "$titulo")",
  "speaker": "$(json_escape "$ponente")",
  "type": "$(json_escape "$tipo")",
  "location": "$(json_escape "$ubicacion")",
  "description": "$(json_escape "$descripcion")",
  "color": "$(json_escape "$color")"
}
JSONEOF
  done
  echo ']' >> "$OUTPUT_DIR/assets/description/schedule.json"
}

# ============================================================
# GENERAR: JSON de FAQ
# ============================================================
generar_json_faq() {
  echo -n '[' > "$OUTPUT_DIR/assets/description/faq.json"
  local first=true
  for entry in "${FAQ[@]}"; do
    IFS='|' read -r pregunta respuesta <<< "$entry"
    if [ "$first" = true ]; then first=false; else echo -n ',' >> "$OUTPUT_DIR/assets/description/faq.json"; fi
    cat >> "$OUTPUT_DIR/assets/description/faq.json" << JSONEOF
{
  "question": "$(json_escape "$pregunta")",
  "answer": "$(json_escape "$respuesta")"
}
JSONEOF
  done
  echo ']' >> "$OUTPUT_DIR/assets/description/faq.json"
}

# ============================================================
# GENERAR: JSON de sponsors
# ============================================================
generar_json_sponsors() {
  echo -n '[' > "$OUTPUT_DIR/assets/description/sponsors.json"
  local first=true
  for entry in "${SPONSORS[@]}"; do
    IFS='|' read -r nombre logo url categoria <<< "$entry"
    if [ "$first" = true ]; then first=false; else echo -n ',' >> "$OUTPUT_DIR/assets/description/sponsors.json"; fi
    cat >> "$OUTPUT_DIR/assets/description/sponsors.json" << JSONEOF
{
  "name": "$(json_escape "$nombre")",
  "logo": "$(json_escape "$logo")",
  "url": "$(json_escape "$url")",
  "category": "$(json_escape "$categoria")"
}
JSONEOF
  done
  echo ']' >> "$OUTPUT_DIR/assets/description/sponsors.json"
}

# ============================================================
# GENERAR: JSON de redes sociales
# ============================================================
generar_json_social() {
  local keys=("facebook" "instagram" "x" "telegram" "matrix" "discord" "github" "gitlab" "mastodon" "youtube" "linkedin" "website")
  local labels=("Facebook" "Instagram" "X" "Telegram" "Matrix" "Discord" "GitHub" "GitLab" "Mastodon" "YouTube" "LinkedIn" "Website")
  local icons=("$ICON_FACEBOOK" "$ICON_INSTAGRAM" "$ICON_TWITTER" "$ICON_TELEGRAM" "$ICON_MATRIX" "$ICON_DISCORD" "$ICON_GITHUB" "$ICON_GITLAB" "$ICON_MASTODON" "$ICON_YOUTUBE" "$ICON_LINKEDIN" "$ICON_WEBSITE")
  echo -n '[' > "$OUTPUT_DIR/assets/description/social.json"
  local first=true
  for (( i=0; i<${#keys[@]}; i++ )); do
    local key="${keys[$i]}"
    local url="${SOCIAL[$key]:-}"
    if [ -n "$url" ]; then
      if [ "$first" = true ]; then first=false; else echo -n ',' >> "$OUTPUT_DIR/assets/description/social.json"; fi
      cat >> "$OUTPUT_DIR/assets/description/social.json" << JSONEOF
{
  "name": "${labels[$i]}",
  "key": "$key",
  "url": "$(json_escape "$url")",
  "icon": "${icons[$i]}"
}
JSONEOF
    fi
  done
  echo ']' >> "$OUTPUT_DIR/assets/description/social.json"
}

# ============================================================
# GENERAR: Estilos CSS
# ============================================================
generar_css() {
  echo "  Generando CSS..."
  cat > "$OUTPUT_DIR/css/style.css" << CSSEOF
:root {
  --color-primary: $COLOR_PRIMARIO;
  --color-secondary: $COLOR_SECUNDARIO;
  --color-accent: $COLOR_ACENTO;
  --color-primary-light: #f4a0b8;
  --color-primary-dark: #a0083e;
  --color-bg-light: #fafafa;
  --color-bg-dark: #1a1a2e;
  --color-text-secondary: $TEXT_SECONDARY_COLOR;
  --glass-bg: rgba(255, 255, 255, 0.15);
  --glass-border: rgba(255, 255, 255, 0.2);
  --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.debian-watermark {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: -1;
  background-image: url($DEBIAN_BACKGROUND_IMAGE);
  background-repeat: no-repeat;
  background-position: $DEBIAN_BACKGROUND_POSITION;
  background-size: $DEBIAN_BACKGROUND_SIZE;
  opacity: $DEBIAN_BACKGROUND_OPACITY;
}

.dark .debian-watermark {
  opacity: calc($DEBIAN_BACKGROUND_OPACITY * 1.5);
}

.debian-logo-nav {
  display: inline-flex;
  align-items: center;
}

html { scroll-behavior: smooth; }

body {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  overflow-x: hidden;
}

.glass {
  background: var(--glass-bg);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid var(--glass-border);
  box-shadow: var(--glass-shadow);
}

.dark .glass {
  --glass-bg: rgba(30, 30, 60, 0.4);
  --glass-border: rgba(255, 255, 255, 0.08);
}

/* Hero */
.hero-section {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  overflow: hidden;
}

.hero-bg-shapes {
  position: absolute;
  inset: 0;
  overflow: hidden;
  z-index: 0;
}

.hero-bg-shapes svg {
  position: absolute;
  width: 100%;
  height: 100%;
}

.shape-blob {
  position: absolute;
  border-radius: 50%;
  filter: blur(60px);
  opacity: 0.3;
  animation: blobFloat 20s ease-in-out infinite;
}

.shape-blob:nth-child(1) {
  width: 400px;
  height: 400px;
  background: var(--color-primary-light);
  top: -10%;
  right: -5%;
  animation-delay: 0s;
}

.shape-blob:nth-child(2) {
  width: 350px;
  height: 350px;
  background: #a0c4e8;
  bottom: -5%;
  left: -8%;
  animation-delay: -5s;
}

.shape-blob:nth-child(3) {
  width: 250px;
  height: 250px;
  background: #c5a8e2;
  top: 40%;
  left: 50%;
  animation-delay: -10s;
}

@keyframes blobFloat {
  0%, 100% { transform: translate(0, 0) scale(1); }
  25% { transform: translate(30px, -30px) scale(1.05); }
  50% { transform: translate(-20px, 20px) scale(0.95); }
  75% { transform: translate(20px, 30px) scale(1.02); }
}

.hero-shape-dots {
  position: absolute;
  bottom: 10%;
  right: 5%;
  width: 120px;
  height: 120px;
  background-image: radial-gradient(circle, var(--color-primary-light) 1px, transparent 1px);
  background-size: 15px 15px;
  opacity: 0.2;
  z-index: 0;
}

.dark .hero-shape-dots { opacity: 0.1; }

/* Cards */
.card-hover {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.card-hover:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
}

.dark .card-hover:hover {
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3);
}

/* Speaker */
.speaker-card {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.speaker-card:hover { transform: translateY(-6px); }

.speaker-card .speaker-img {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid var(--color-primary-light);
  transition: all 0.3s ease;
}

.speaker-card:hover .speaker-img {
  border-color: var(--color-primary);
  transform: scale(1.05);
}

/* Schedule - Card list */
.schedule-list {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.schedule-card {
  padding: 0.875rem 1.25rem;
  border-radius: 0.75rem;
  transition: all 0.3s ease;
}

.schedule-card:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06) !important;
}

.schedule-card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.75rem;
  margin-bottom: 0.375rem;
  flex-wrap: wrap;
}

.schedule-time {
  font-family: ui-monospace, monospace;
  font-weight: 700;
  font-size: 0.8rem;
  color: var(--color-primary);
  line-height: 1.3;
  white-space: nowrap;
}

.schedule-type {
  display: inline-flex;
  align-items: center;
  padding: 0.125rem 0.625rem;
  border-radius: 9999px;
  font-size: 0.65rem;
  font-weight: 600;
  color: white;
  white-space: nowrap;
  flex-shrink: 0;
}

/* Stats */
.stat-item {
  text-align: center;
  padding: 2rem 1rem;
}

.stat-number {
  font-size: 3rem;
  font-weight: 700;
  line-height: 1;
  background: linear-gradient(135deg, var(--color-primary), var(--color-accent));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.dark .stat-number {
  background: linear-gradient(135deg, #f4a0b8, #a0c4e8);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

/* Sponsor grid */
.sponsor-grid {
  display: grid;
  gap: 1.5rem;
  align-items: center;
}

.sponsor-grid.gold { grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); }
.sponsor-grid.silver { grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); }
.sponsor-grid.bronze { grid-template-columns: repeat(auto-fit, minmax(160px, 1fr)); }
.sponsor-grid.community { grid-template-columns: repeat(auto-fit, minmax(140px, 1fr)); }

.sponsor-item {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1.5rem;
  border-radius: 1rem;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: all 0.3s ease;
  height: 120px;
}

.sponsor-item:hover {
  transform: scale(1.05);
  border-color: var(--color-primary-light);
}

.sponsor-item img {
  max-width: 80%;
  max-height: 60px;
  filter: grayscale(0.2);
  transition: all 0.3s ease;
}

.sponsor-item:hover img { filter: grayscale(0); }

.dark .sponsor-item {
  background: rgba(0, 0, 0, 0.2);
  border-color: rgba(255, 255, 255, 0.05);
}

/* Section titles */
.section-title {
  font-size: 2.5rem;
  font-weight: 700;
  letter-spacing: -0.02em;
  line-height: 1.2;
}

@media (max-width: 640px) { .section-title { font-size: 2rem; } }

.section-subtitle {
  font-size: 1.125rem;
  color: #666;
  max-width: 600px;
  margin: 0 auto;
}

.dark .section-subtitle { color: #aaa; }

/* Navbar */
.navbar-blur {
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  background: rgba(255, 255, 255, 0.8);
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.dark .navbar-blur {
  background: rgba(26, 26, 46, 0.8);
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}

/* Mascots */
.mascot-container {
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.mascot-container svg {
  width: 100%;
  height: auto;
  transition: all 0.3s ease;
}

.mascot-container:hover svg {
  transform: scale(1.05) rotate(-2deg);
}

.mascot-sm svg { max-width: 60px; }
.mascot-md svg { max-width: 100px; }
.mascot-lg svg { max-width: 160px; }

/* Section dividers */
.section-divider {
  position: relative;
  height: 1px;
  background: linear-gradient(to right, transparent, var(--color-primary-light), transparent);
  margin: 0 auto;
  max-width: 80%;
  opacity: 0.3;
}

/* Map */
.map-container {
  width: 100%;
  height: 400px;
  border-radius: 1rem;
  overflow: hidden;
  border: none;
  position: relative;
}

.map-container iframe {
  width: 100%;
  height: 100%;
  border: none;
}

.map-container .leaflet-container {
  width: 100%;
  height: 100%;
  border-radius: 1rem;
  z-index: 1;
}

.dark .leaflet-layer {
  filter: brightness(0.7) invert(1) hue-rotate(200deg);
}

.dark .leaflet-control-zoom a {
  background: #2a2a3e;
  color: #ccc;
  border-color: #444;
}

.dark .leaflet-control-attribution {
  background: rgba(30, 30, 50, 0.8) !important;
  color: #999;
}

.dark .leaflet-control-attribution a {
  color: #aaa;
}

/* Social buttons */
.social-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  transition: all 0.3s ease;
  color: #666;
}

.dark .social-btn { color: #aaa; }

.social-btn:hover {
  background: var(--color-primary-light);
  color: white;
  transform: translateY(-2px);
}

/* Section padding */
.section-padding {
  padding: 5rem 1rem;
}

@media (min-width: 768px) { .section-padding { padding: 6rem 2rem; } }
@media (min-width: 1024px) { .section-padding { padding: 7rem 2rem; } }

/* Dark mode image adjustments */
.dark .sponsor-item img,
.dark .speaker-img { filter: brightness(0.9); }

/* Focus */
:focus-visible {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
  border-radius: 4px;
}

/* Skip link */
.skip-link {
  position: absolute;
  top: -100%;
  left: 50%;
  transform: translateX(-50%);
  z-index: 100;
  padding: 0.5rem 1rem;
  background: var(--color-primary);
  color: white;
  border-radius: 0 0 0.5rem 0.5rem;
  transition: top 0.2s ease;
}

.skip-link:focus { top: 0; }

section { position: relative; }

/* Scrollbar */
::-webkit-scrollbar { width: 8px; }
::-webkit-scrollbar-track { background: transparent; }
::-webkit-scrollbar-thumb {
  background: var(--color-primary-light);
  border-radius: 4px;
}
::-webkit-scrollbar-thumb:hover { background: var(--color-primary); }

/* Card grid */
.card-grid {
  display: grid;
  gap: 1.5rem;
}

.card-grid-2 { grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); }
.card-grid-3 { grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); }
.card-grid-4 { grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); }

@media (max-width: 640px) {
  .card-grid-2,
  .card-grid-3,
  .card-grid-4 { grid-template-columns: 1fr; }
}

/* Floating animation */
@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

.float-animation {
  animation: float 4s ease-in-out infinite;
}

/* Badge categories */
.badge-gold { background: #fbbf24; color: #1a1a2e; }
.badge-silver { background: #d1d5db; color: #1a1a2e; }
.badge-bronze { background: #d97706; color: white; }
.badge-community { background: var(--color-secondary); color: white; }

/* Button pulse */
.btn-pulse {
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% { box-shadow: 0 0 0 0 rgba(215, 10, 83, 0.4); }
  70% { box-shadow: 0 0 0 12px rgba(215, 10, 83, 0); }
  100% { box-shadow: 0 0 0 0 rgba(215, 10, 83, 0); }
}

/* AOS refinements */
[data-aos] {
  pointer-events: none;
}

[data-aos].aos-animate {
  pointer-events: auto;
}
CSSEOF
}

# ============================================================
# GENERAR: JavaScript
# ============================================================
generar_js() {
  echo "  Generando JavaScript..."
  cat > "$OUTPUT_DIR/js/app.js" << 'JSEOF'
(function () {
  'use strict';

  var DATA = window.DEBIANDAY_DATA || {};
  var I = DATA.icons || {};
  function icn(name) { return 'data-lucide="' + (I[name] || name) + '"'; }

  // ============================================================
  // RENDER: Section builders
  // ============================================================

  function renderHero(d) {
    var e = d.event;
    return '<section id="hero" class="hero-section min-h-screen relative" aria-label="Hero">'
      + '<div class="hero-bg-shapes" aria-hidden="true"><div class="shape-blob"></div><div class="shape-blob"></div><div class="shape-blob"></div></div>'
      + '<div class="hero-shape-dots" aria-hidden="true"></div>'
      + '<div class="container mx-auto px-4 sm:px-6 lg:px-8 relative z-10">'
      + '<div class="flex flex-col lg:flex-row items-center gap-12 lg:gap-16 min-h-[80vh] py-20">'
      + '<div class="flex-1 text-center lg:text-left" data-aos="fade-up" data-aos-duration="1000">'
      + '<div class="inline-flex items-center gap-3 mb-6" data-aos="fade-up" data-aos-delay="100">'
      + '<div class="mascot-container mascot-md float-animation">' + d.tux + '</div>'
      + '<span class="px-3 py-1.5 bg-[var(--color-primary-light)]/20 text-[var(--color-primary)] rounded-full text-sm font-semibold">' + e.date + '</span>'
      + '</div>'
      + '<h1 class="text-5xl sm:text-6xl md:text-7xl lg:text-8xl font-extrabold tracking-tight leading-[1.05] mb-6">'
      + '<span class="text-[var(--color-primary)]">Debian</span> <span class="text-[var(--color-secondary)]">Day</span>'
      + '</h1>'
      + '<p class="text-lg sm:text-xl md:text-2xl text-gray-600 dark:text-gray-300 max-w-2xl mx-auto lg:mx-0 mb-8 leading-relaxed">' + e.hero.description + '</p>'
      + '<div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">'
      + '<a href="' + e.registerUrl + '" target="_blank" rel="noopener noreferrer" class="btn btn-lg rounded-full border-none text-white shadow-lg hover:shadow-xl transition-all duration-300" style="background:var(--color-primary);" data-aos="fade-up" data-aos-delay="200">'
      + '<i ' + icn('ticket') + ' class="w-5 h-5 mr-2"></i>' + e.hero.buttonRegister + '</a>'
      + '<a href="#schedule" class="btn btn-lg rounded-full btn-outline btn-pulse shadow-lg hover:shadow-xl transition-all duration-300" style="border-color:var(--color-primary);color:var(--color-primary);" data-aos="fade-up" data-aos-delay="300">'
      + '<i ' + icn('calendar') + ' class="w-5 h-5 mr-2"></i>' + e.hero.buttonSchedule + '</a>'
      + '</div>'
      + '<div class="flex items-center gap-6 mt-10 justify-center lg:justify-start text-sm text-gray-400" data-aos="fade-up" data-aos-delay="400">'
      + '<span class="flex items-center gap-2"><i ' + icn('location') + ' class="w-4 h-4"></i> ' + e.venue + ', ' + e.city + '</span>'
      + '<span class="flex items-center gap-2"><i ' + icn('clock') + ' class="w-4 h-4"></i> ' + e.time + '</span>'
      + '</div></div>'
      + '<div class="flex-1 flex justify-center lg:justify-end" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="200">'
      + '<div class="relative">'
      + '<div class="w-64 h-64 sm:w-80 sm:h-80 md:w-96 md:h-96 rounded-full bg-gradient-to-br from-[var(--color-primary-light)]/30 to-[var(--color-accent)]/20 flex items-center justify-center float-animation">'
      + '<div class="mascot-container mascot-lg">' + d.gnu + '</div></div>'
      + '<div class="absolute -bottom-4 -right-4 w-24 h-24 sm:w-32 sm:h-32 rounded-full bg-[var(--color-primary-light)]/20 flex items-center justify-center float-animation" style="animation-delay:-2s;">'
      + '<div class="mascot-container" style="max-width:60px;">' + d.tux + '</div></div></div></div></div></div></section>';
  }

  function renderInformation(d) {
    var e = d.event;
    return '<section id="information" class="section-padding bg-white/50 dark:bg-gray-900/30" aria-label="Informacion del evento">'
      + '<div class="container mx-auto max-w-6xl">'
      + '<div class="text-center mb-16" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">' + e.information.title + '</h2>'
      + '<p class="section-subtitle">' + e.information.description + '</p></div>'
      + '<div class="card-grid card-grid-4">'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="0">'
      + '<div class="w-14 h-14 rounded-2xl bg-[var(--color-primary-light)]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('target') + ' class="w-7 h-7 text-[var(--color-primary)]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Objetivos</h3>'
      + '<p class="text-gray-600 dark:text-gray-400 leading-relaxed">' + e.information.objectives + '</p></div>'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="100">'
      + '<div class="w-14 h-14 rounded-2xl bg-[var(--color-accent)]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('users') + ' class="w-7 h-7 text-[var(--color-accent)]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Publico</h3>'
      + '<p class="text-gray-600 dark:text-gray-400 leading-relaxed">' + e.information.audience + '</p></div>'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="200">'
      + '<div class="w-14 h-14 rounded-2xl bg-[#a0c4e8]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('heart') + ' class="w-7 h-7 text-[#2B5797]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Organiza</h3>'
      + '<p class="text-gray-600 dark:text-gray-400 leading-relaxed">' + e.information.organizer + '</p></div>'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="300">'
      + '<div class="w-14 h-14 rounded-2xl bg-[#c5a8e2]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('location') + ' class="w-7 h-7 text-[#7c3aed]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Ubicacion</h3>'
      + '<p class="text-gray-600 dark:text-gray-400 leading-relaxed">' + e.venue + ', ' + e.city + ', ' + e.country + '</p></div>'
      + '</div></div></section>';
  }

  function renderStatistics(d) {
    var s = d.event.statistics;
    var items = [
      { label: 'Conferencias', target: s.conferences },
      { label: 'Talleres', target: s.workshops },
      { label: 'Ponentes', target: s.speakers },
      { label: 'Patrocinadores', target: s.sponsors },
      { label: 'Participantes', target: s.participants }
    ];
    var html = '<section id="statistics" class="section-padding relative overflow-hidden" aria-label="Estadisticas del evento">'
      + '<div class="absolute inset-0 bg-gradient-to-br from-[var(--color-primary-light)]/5 to-[#a0c4e8]/5" aria-hidden="true"></div>'
      + '<div class="container mx-auto max-w-6xl">'
      + '<div class="text-center mb-12" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">En numeros</h2>'
      + '<p class="section-subtitle">Lo que hace de DebianDay un evento unico</p></div>'
      + '<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">';
    for (var i = 0; i < items.length; i++) {
      html += '<div class="stat-item" data-aos="zoom-in" data-aos-delay="' + (i * 100) + '">'
        + '<div class="stat-number" data-target="' + items[i].target + '">0</div>'
        + '<div class="text-gray-500 dark:text-gray-400 mt-2 font-medium">' + items[i].label + '</div></div>';
    }
    html += '</div></div></section>';
    return html;
  }

  function renderSpeakers(d) {
    var list = d.speakers;
    if (!list || !list.length) return '';
    var html = '<section id="speakers" class="section-padding bg-white/50 dark:bg-gray-900/30" aria-label="Ponentes">'
      + '<div class="container mx-auto max-w-6xl">'
      + '<div class="text-center mb-16" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">Ponentes</h2>'
      + '<p class="section-subtitle">Conoce a las personas que haran de este evento una experiencia inolvidable</p></div>'
      + '<div class="card-grid card-grid-3">';
    for (var i = 0; i < list.length; i++) {
      var sp = list[i];
      var social = '';
      if (sp.github) social += '<a href="' + sp.github + '" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="GitHub de ' + sp.name + '"><i ' + icn('github') + ' class="w-4 h-4"></i></a>';
      if (sp.mastodon) social += '<a href="' + sp.mastodon + '" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="Mastodon de ' + sp.name + '"><i ' + icn('mastodon') + ' class="w-4 h-4"></i></a>';
      if (sp.linkedin) social += '<a href="' + sp.linkedin + '" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="LinkedIn de ' + sp.name + '"><i ' + icn('linkedin') + ' class="w-4 h-4"></i></a>';
      if (sp.web) social += '<a href="' + sp.web + '" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="Web de ' + sp.name + '"><i ' + icn('globe') + ' class="w-4 h-4"></i></a>';
      var company = sp.company ? '<span class="text-[var(--color-primary)] font-medium">@ ' + sp.company + '</span>' : '';
      html += '<div class="speaker-card bg-white dark:bg-gray-800/60 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50 shadow-sm hover:shadow-lg" data-aos="fade-up" data-aos-delay="' + (i * 50) + '">'
        + '<div class="flex flex-col items-center text-center">'
        + '<img src="' + sp.photo + '" alt="' + sp.name + '" class="speaker-img mb-5" loading="lazy">'
        + '<h3 class="text-xl font-bold mb-1">' + sp.name + '</h3>'
        + '<p class="text-gray-500 dark:text-gray-400 text-sm mb-1">' + sp.role + '</p>'
        + company
        + '<p class="text-gray-500 dark:text-gray-400 text-sm mt-4 leading-relaxed">' + sp.bio + '</p>'
        + '<div class="flex gap-2 mt-5">' + social + '</div></div></div>';
    }
    html += '</div></div></section>';
    return html;
  }

  function renderSchedule(d) {
    var list = d.schedule;
    if (!list || !list.length) return '';
    var html = '<section id="schedule" class="section-padding" aria-label="Cronograma">'
      + '<div class="container mx-auto max-w-4xl">'
      + '<div class="text-center mb-16" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">Cronograma</h2>'
      + '<p class="section-subtitle">Agenda completa del evento</p>'
      + '<p class="text-sm text-gray-400 mt-2">' + d.event.date + ' \u2014 ' + d.event.venue + ', ' + d.event.city + '</p></div>'
      + '<div class="schedule-list">';
    for (var i = 0; i < list.length; i++) {
      var sl = list[i];
      var color = sl.color || '#E8A0B0';
      html += '<div class="schedule-card bg-white dark:bg-gray-800/60 border border-gray-100 dark:border-gray-700/50 shadow-sm hover:shadow-md" data-aos="fade-up" data-aos-delay="' + (i * 50) + '">'
        + '<div class="schedule-card-header">'
        + '<span class="schedule-time">' + sl.start + ' \u2013 ' + sl.end + '</span>'
        + '<span class="schedule-type" style="background:' + color + ';">' + sl.type + '</span>'
        + '</div>'
        + '<h3 class="text-lg font-bold mb-1 leading-snug">' + sl.title + '</h3>'
        + '<p class="text-sm text-gray-500 dark:text-gray-400 flex items-center gap-2 flex-wrap">'
        + '<span class="flex items-center gap-1"><svg class="w-3.5 h-3.5 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>' + sl.speaker + '</span>'
        + '<span class="text-gray-300 dark:text-gray-600 hidden sm:inline">|</span>'
        + '<span class="flex items-center gap-1"><svg class="w-3.5 h-3.5 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>' + sl.location + '</span></p>'
        + '<p class="text-sm text-gray-500 dark:text-gray-400 leading-relaxed mt-2">' + sl.description + '</p></div>';
    }
    html += '</div></div></section>';
    return html;
  }

  function renderSponsors(d) {
    var list = d.sponsors;
    if (!list || !list.length) return '';
    var cats = ['Gold', 'Silver', 'Bronze', 'Community'];
    var catHtml = '';
    for (var c = 0; c < cats.length; c++) {
      var cat = cats[c];
      var items = list.filter(function(s) { return s.category === cat; });
      if (!items.length) continue;
      var badgeClass = 'badge-' + cat.toLowerCase();
      var gridClass = cat.toLowerCase();
      var catItems = '';
      for (var i = 0; i < items.length; i++) {
        catItems += '<a href="' + items[i].url + '" target="_blank" rel="noopener noreferrer" class="sponsor-item" data-aos="fade-up" data-aos-delay="' + (i * 50) + '">'
          + '<img src="' + items[i].logo + '" alt="' + items[i].name + '" loading="lazy"></a>';
      }
      catHtml += '<div class="mb-12" data-aos="fade-up">'
        + '<div class="flex items-center justify-center gap-4 mb-8">'
        + '<span class="h-px flex-1 bg-gradient-to-r from-transparent to-gray-300 dark:to-gray-600"></span>'
        + '<span class="px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider ' + badgeClass + '">' + cat + '</span>'
        + '<span class="h-px flex-1 bg-gradient-to-l from-transparent to-gray-300 dark:to-gray-600"></span></div>'
        + '<div class="sponsor-grid ' + gridClass + '">' + catItems + '</div></div>';
    }
    return '<section id="sponsors" class="section-padding bg-white/50 dark:bg-gray-900/30" aria-label="Patrocinadores">'
      + '<div class="container mx-auto max-w-5xl">'
      + '<div class="text-center mb-16" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">Patrocinadores</h2>'
      + '<p class="section-subtitle">Empresas y organizaciones que hacen posible este evento</p></div>'
      + catHtml + '</div></section>';
  }

  function renderFAQ(d) {
    var list = d.faq;
    if (!list || !list.length) return '';
    var html = '<section id="faq" class="section-padding" aria-label="Preguntas frecuentes">'
      + '<div class="container mx-auto max-w-3xl">'
      + '<div class="text-center mb-16" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">Preguntas frecuentes</h2>'
      + '<p class="section-subtitle">Todo lo que necesitas saber sobre DebianDay</p></div>'
      + '<div class="space-y-4">';
    for (var i = 0; i < list.length; i++) {
      var checked = i === 0 ? 'checked' : '';
      html += '<div class="collapse collapse-arrow bg-white dark:bg-gray-800/60 border border-gray-100 dark:border-gray-700/50 rounded-xl shadow-sm" data-aos="fade-up" data-aos-delay="' + (i * 50) + '">'
        + '<input type="radio" name="faq-accordion" id="faq-' + i + '" ' + checked + ' />'
        + '<label for="faq-' + i + '" class="collapse-title text-lg font-semibold cursor-pointer">' + list[i].question + '</label>'
        + '<div class="collapse-content"><p class="text-gray-600 dark:text-gray-400 leading-relaxed">' + list[i].answer + '</p></div></div>';
    }
    html += '</div></div></section>';
    return html;
  }

  var MAP_INITIALIZED = false;

  function renderLocation(d) {
    var loc = d.event.location;
    var e = d.event;
    var zoom = loc.zoom || 17;
    var lat = parseFloat(loc.latitude) || -17.775122;
    var lng = parseFloat(loc.longitude) || -63.193719;
    var html = '<section id="location" class="section-padding bg-white/50 dark:bg-gray-900/30" aria-label="Ubicacion">'
      + '<div class="container mx-auto max-w-6xl">'
      + '<div class="text-center mb-16" data-aos="fade-up">'
      + '<h2 class="section-title mb-4">' + loc.title + '</h2>'
      + '<p class="section-subtitle">' + loc.description + '</p></div>'
      + '<div id="leaflet-map" class="map-container shadow-sm" data-aos="zoom-in" data-aos-delay="100" style="z-index:1;"></div>'
      + '</div></section>';
    setTimeout(function () {
      if (typeof L !== 'undefined' && document.getElementById('leaflet-map') && !MAP_INITIALIZED) {
        MAP_INITIALIZED = true;
        var mapEl = document.getElementById('leaflet-map');
        var map = L.map(mapEl, {
          center: [lat, lng],
          zoom: zoom,
          zoomControl: true,
          scrollWheelZoom: true
        });
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        var markerIcon = L.icon({
          iconUrl: loc.markerIcon || 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
          iconSize: [loc.markerWidth || 32, loc.markerHeight || 40],
          iconAnchor: [16, 40],
          popupAnchor: [0, -40]
        });
        L.marker([lat, lng], { icon: markerIcon })
          .addTo(map)
          .bindPopup('<b>' + loc.title + '</b><br>' + loc.description);
        setTimeout(function () { map.invalidateSize(); }, 300);
      }
    }, 500);
    return html;
  }

  function renderFooter(d) {
    var e = d.event;
    var socialList = d.social || [];
    var socialHtml = '';
    for (var i = 0; i < socialList.length; i++) {
      socialHtml += '<a href="' + socialList[i].url + '" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="' + socialList[i].name + '"><i ' + icn(socialList[i].icon) + ' class="w-5 h-5"></i></a>';
    }
    var contactHtml = '';
    if (e.footer.organizer) contactHtml += '<li class="flex items-center gap-2"><i ' + icn('users') + ' class="w-4 h-4"></i> ' + e.footer.organizer + '</li>';
    if (e.footer.email) contactHtml += '<li class="flex items-center gap-2"><i ' + icn('mail') + ' class="w-4 h-4"></i> <a href="mailto:' + e.footer.email + '" class="hover:text-[var(--color-primary)] transition-colors">' + e.footer.email + '</a></li>';
    if (e.venue) contactHtml += '<li class="flex items-center gap-2"><i ' + icn('location') + ' class="w-4 h-4"></i> ' + e.venue + ', ' + e.city + '</li>';
    var licenseHtml = e.footer.license ? '<span>' + e.footer.license + '</span>' : '';
    return '<footer class="bg-gray-50 dark:bg-gray-900/80 border-t border-gray-100 dark:border-gray-800" aria-label="Pie de pagina">'
      + '<div class="container mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-16">'
      + '<div class="grid grid-cols-1 md:grid-cols-3 gap-12">'
      + '<div data-aos="fade-up" data-aos-delay="0">'
      + '<div class="flex items-center gap-3 mb-4">'
      + '<div class="mascot-container" style="max-width:40px;">' + d.tux + '</div>'
      + '<span class="text-xl font-bold"><span class="text-[var(--color-primary)]">Debian</span><span class="text-[var(--color-secondary)]">Day</span></span></div>'
      + '<p class="text-sm text-gray-500 dark:text-gray-400 leading-relaxed">' + e.description + '</p></div>'
      + '<div data-aos="fade-up" data-aos-delay="100">'
      + '<h3 class="text-sm font-semibold uppercase tracking-wider text-gray-400 mb-4">Contacto</h3>'
      + '<ul class="space-y-3 text-sm text-gray-500 dark:text-gray-400">' + contactHtml + '</ul></div>'
      + '<div data-aos="fade-up" data-aos-delay="200">'
      + '<h3 class="text-sm font-semibold uppercase tracking-wider text-gray-400 mb-4">Redes</h3>'
      + '<div class="flex flex-wrap gap-2">' + socialHtml + '</div></div></div>'
      + '<div class="section-divider my-8"></div>'
      + '<div class="flex flex-col sm:flex-row justify-between items-center gap-4 text-sm text-gray-400">'
      + '<p>&copy; ' + e.footer.copyright + '</p>'
      + '<div class="flex items-center gap-4">' + licenseHtml + '</div></div></div></footer>';
  }

  var RENDER = {
    hero: renderHero,
    information: renderInformation,
    statistics: renderStatistics,
    speakers: renderSpeakers,
    schedule: renderSchedule,
    sponsors: renderSponsors,
    faq: renderFAQ,
    location: renderLocation,
    footer: renderFooter
  };

  // ============================================================
  // BUILD: Render sections in order
  // ============================================================

  function buildSections() {
    var main = document.getElementById('main-content');
    if (!main) return;
    var settings = DATA.event && DATA.event.settings;
    if (!settings) return;
    var order = settings.order || ['hero', 'information', 'statistics', 'speakers', 'schedule', 'sponsors', 'faq', 'location', 'footer'];
    var visibility = settings.visibility || {};
    var html = '';
    for (var i = 0; i < order.length; i++) {
      var section = order[i];
      if (visibility[section] !== false && RENDER[section]) {
        html += RENDER[section](DATA);
      }
    }
    main.innerHTML = html;
  }

  // ============================================================
  // INIT
  // ============================================================

  function init() {
    buildSections();

    // AOS
    AOS.init({
      duration: 800,
      easing: 'ease-out-cubic',
      once: true,
      offset: 50,
      disable: window.innerWidth < 640 ? 'mobile' : false
    });

    // Text secondary color
    var appearance = DATA.event && DATA.event.appearance;
    if (appearance && appearance.textSecondaryColor) {
      var style = document.createElement('style');
      style.textContent = '.text-secondary-custom { color: ' + appearance.textSecondaryColor + '; }';
      document.head.appendChild(style);
    }

    // Theme
    var themeToggle = document.getElementById('theme-toggle');
    var htmlEl = document.documentElement;
    var settings = DATA.event && DATA.event.settings;

    function getPreferredTheme() {
      var stored = localStorage.getItem('debianday-theme');
      if (stored) return stored;
      var def = settings && settings.defaultTheme;
      if (def === 'light' || def === 'dark') return def;
      return 'dark';
    }

    function setTheme(theme) {
      htmlEl.setAttribute('data-theme', theme);
      htmlEl.classList.toggle('dark', theme === 'dark');
      localStorage.setItem('debianday-theme', theme);
      if (themeToggle) {
        var icon = themeToggle.querySelector('i[data-lucide]');
        if (icon) {
          icon.setAttribute('data-lucide', theme === 'dark' ? 'sun' : 'moon');
          if (typeof lucide !== 'undefined') lucide.createIcons();
        }
      }
    }

    setTheme(getPreferredTheme());

    if (themeToggle) {
      themeToggle.addEventListener('click', function () {
        var next = htmlEl.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
        setTheme(next);
      });
    }

    // Smooth scroll
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
      anchor.addEventListener('click', function (e) {
        var target = document.querySelector(this.getAttribute('href'));
        if (target) {
          e.preventDefault();
          var top = target.getBoundingClientRect().top + window.scrollY - 80;
          window.scrollTo({ top: top, behavior: 'smooth' });
        }
      });
    });

    // Navbar scroll effect
    var navbar = document.querySelector('.navbar-blur');
    if (navbar) {
      function updateNavbar() {
        if (window.scrollY > 50) {
          navbar.classList.add('shadow-sm');
        } else {
          navbar.classList.remove('shadow-sm');
        }
      }
      window.addEventListener('scroll', updateNavbar, { passive: true });
      updateNavbar();
    }

    // Counter animation
    function animateCounter(el, target, dur) {
      var isSuffixed = typeof target === 'string' && target.indexOf('+') >= 0;
      var numTarget = isSuffixed ? parseInt(target, 10) : (typeof target === 'string' ? parseInt(target, 10) : target);
      if (isNaN(numTarget)) { el.textContent = target; return; }
      var start = 0;
      var startTime = performance.now();
      function update(now) {
        var elapsed = now - startTime;
        var progress = Math.min(elapsed / dur, 1);
        var eased = 1 - Math.pow(1 - progress, 3);
        var current = Math.floor(start + (numTarget - start) * eased);
        el.textContent = current + (isSuffixed ? '+' : '');
        if (progress < 1) requestAnimationFrame(update);
        else el.textContent = target;
      }
      requestAnimationFrame(update);
    }

    var statsEl = document.getElementById('statistics');
    if (statsEl) {
      var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            var counters = statsEl.querySelectorAll('.stat-number');
            counters.forEach(function (c) {
              var raw = c.getAttribute('data-target');
              if (raw) {
                var t = raw.indexOf('+') >= 0 ? raw : parseInt(raw, 10);
                animateCounter(c, t, 2000);
              }
            });
            observer.disconnect();
          }
        });
      }, { threshold: 0.3 });
      observer.observe(statsEl);
    }

    // Mobile menu
    var menuToggle = document.getElementById('menu-toggle');
    var mobileMenu = document.getElementById('mobile-menu');
    if (menuToggle && mobileMenu) {
      menuToggle.addEventListener('click', function () {
        var expanded = menuToggle.getAttribute('aria-expanded') === 'true' ? false : true;
        menuToggle.setAttribute('aria-expanded', expanded);
        mobileMenu.classList.toggle('hidden');
      });
      mobileMenu.querySelectorAll('a').forEach(function (link) {
        link.addEventListener('click', function () {
          mobileMenu.classList.add('hidden');
          menuToggle.setAttribute('aria-expanded', 'false');
        });
      });
    }

    // Lucide icons
    if (typeof lucide !== 'undefined') lucide.createIcons();

    // Escape key
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && mobileMenu && !mobileMenu.classList.contains('hidden')) {
        mobileMenu.classList.add('hidden');
        if (menuToggle) menuToggle.setAttribute('aria-expanded', 'false');
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

})();
JSEOF
}

# ============================================================
# GENERAR: Mascota SVG (Tux)
# ============================================================
generar_tux_svg() {
  if [ -f "$ASSETS_SRC/img/mascots/tux.svg" ]; then
    cp "$ASSETS_SRC/img/mascots/tux.svg" "$OUTPUT_DIR/assets/img/mascots/tux.svg"
  else
    cat > "$OUTPUT_DIR/assets/img/mascots/tux.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 240" fill="none">
  <circle cx="100" cy="120" r="90" fill="#2B2B2B" opacity="0.9"/>
  <ellipse cx="100" cy="140" rx="70" ry="80" fill="#1a1a1a"/>
  <ellipse cx="100" cy="100" rx="60" ry="50" fill="#333"/>
  <ellipse cx="85" cy="90" rx="10" ry="8" fill="white"/>
  <ellipse cx="115" cy="90" rx="10" ry="8" fill="white"/>
  <ellipse cx="87" cy="92" rx="5" ry="5" fill="#1a1a1a"/>
  <ellipse cx="117" cy="92" rx="5" ry="5" fill="#1a1a1a"/>
  <ellipse cx="100" cy="108" rx="8" ry="4" fill="#FF8C00"/>
  <path d="M70 75 Q100 55 130 75" stroke="#555" stroke-width="2" fill="none"/>
  <ellipse cx="70" cy="170" rx="25" ry="15" fill="#1a1a1a" transform="rotate(-15 70 170)"/>
  <ellipse cx="130" cy="170" rx="25" ry="15" fill="#1a1a1a" transform="rotate(15 130 170)"/>
  <ellipse cx="60" cy="200" rx="20" ry="10" fill="#333" transform="rotate(-10 60 200)"/>
  <ellipse cx="140" cy="200" rx="20" ry="10" fill="#333" transform="rotate(10 140 200)"/>
  <circle cx="40" cy="85" r="12" fill="#FFD700" opacity="0.3"/>
  <circle cx="35" cy="80" r="3" fill="#FFD700" opacity="0.5"/>
</svg>
SVGEOF
  fi
}

# ============================================================
# GENERAR: Mascota SVG (GNU)
# ============================================================
generar_gnu_svg() {
  if [ -f "$ASSETS_SRC/img/mascots/gnu.svg" ]; then
    cp "$ASSETS_SRC/img/mascots/gnu.svg" "$OUTPUT_DIR/assets/img/mascots/gnu.svg"
  else
    cat > "$OUTPUT_DIR/assets/img/mascots/gnu.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 240" fill="none">
  <ellipse cx="100" cy="130" rx="55" ry="70" fill="#8B4513" opacity="0.85"/>
  <ellipse cx="100" cy="120" rx="50" ry="45" fill="#A0522D"/>
  <path d="M60 80 Q100 40 140 80" stroke="#6B3410" stroke-width="3" fill="#8B4513"/>
  <path d="M70 70 L65 45 L75 60" fill="#6B3410"/>
  <path d="M130 70 L135 45 L125 60" fill="#6B3410"/>
  <ellipse cx="85" cy="110" rx="8" ry="6" fill="#1a1a1a"/>
  <ellipse cx="115" cy="110" rx="8" ry="6" fill="#1a1a1a"/>
  <ellipse cx="85" cy="112" rx="3" ry="2" fill="white" opacity="0.8"/>
  <ellipse cx="115" cy="112" rx="3" ry="2" fill="white" opacity="0.8"/>
  <path d="M92 125 Q100 132 108 125" stroke="#1a1a1a" stroke-width="2" fill="none"/>
  <rect x="90" y="175" width="20" height="40" rx="3" fill="#A0522D"/>
  <rect x="65" y="185" width="15" height="35" rx="5" fill="#8B4513" transform="rotate(-20 72 200)"/>
  <rect x="120" y="185" width="15" height="35" rx="5" fill="#8B4513" transform="rotate(20 127 200)"/>
  <rect x="80" y="195" width="12" height="30" rx="4" fill="#6B3410" transform="rotate(-10 86 210)"/>
  <rect x="108" y="195" width="12" height="30" rx="4" fill="#6B3410" transform="rotate(10 114 210)"/>
  <ellipse cx="100" cy="168" rx="20" ry="8" fill="#A0522D"/>
  <path d="M100 168 L95 178 L105 178 Z" fill="#6B3410"/>
</svg>
SVGEOF
  fi
}

# ============================================================
# GENERAR: Logo SVG
# ============================================================
generar_logo_svg() {
  if [ -f "$ASSETS_SRC/img/logos/logo.svg" ]; then
    cp "$ASSETS_SRC/img/logos/logo.svg" "$OUTPUT_DIR/assets/img/logos/logo.svg"
  else
    cat > "$OUTPUT_DIR/assets/img/logos/logo.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 120" fill="none">
  <text x="40" y="80" font-family="system-ui, sans-serif" font-size="60" font-weight="800" fill="#D70A53">Debian</text>
  <text x="220" y="80" font-family="system-ui, sans-serif" font-size="60" font-weight="300" fill="#2B5797">Day</text>
  <circle cx="320" cy="30" r="6" fill="#E8A0B0" opacity="0.6"/>
  <circle cx="340" cy="20" r="4" fill="#A8D5E2" opacity="0.5"/>
  <circle cx="355" cy="35" r="3" fill="#C5A8E2" opacity="0.4"/>
</svg>
SVGEOF
  fi
  if [ -f "$ASSETS_SRC/img/logos/logo-light.svg" ]; then
    cp "$ASSETS_SRC/img/logos/logo-light.svg" "$OUTPUT_DIR/assets/img/logos/logo-light.svg"
  else
    cp "$OUTPUT_DIR/assets/img/logos/logo.svg" "$OUTPUT_DIR/assets/img/logos/logo-light.svg"
  fi
  if [ -f "$ASSETS_SRC/img/logos/logo-dark.svg" ]; then
    cp "$ASSETS_SRC/img/logos/logo-dark.svg" "$OUTPUT_DIR/assets/img/logos/logo-dark.svg"
  else
    cp "$OUTPUT_DIR/assets/img/logos/logo.svg" "$OUTPUT_DIR/assets/img/logos/logo-dark.svg"
  fi
}

# ============================================================
# GENERAR: Hero background SVG
# ============================================================
generar_hero_svg() {
  if [ -f "$ASSETS_SRC/img/hero/hero-bg.svg" ]; then
    cp "$ASSETS_SRC/img/hero/hero-bg.svg" "$OUTPUT_DIR/assets/img/hero/hero-bg.svg"
  else
    cat > "$OUTPUT_DIR/assets/img/hero/hero-bg.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 900" fill="none">
  <defs>
    <linearGradient id="hero-grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#f4a0b8" stop-opacity="0.1"/>
      <stop offset="50%" stop-color="#a0c4e8" stop-opacity="0.05"/>
      <stop offset="100%" stop-color="#c5a8e2" stop-opacity="0.1"/>
    </linearGradient>
  </defs>
  <rect width="1440" height="900" fill="url(#hero-grad)"/>
  <circle cx="1200" cy="200" r="300" fill="#f4a0b8" opacity="0.08"/>
  <circle cx="200" cy="700" r="250" fill="#a0c4e8" opacity="0.06"/>
  <circle cx="700" cy="450" r="200" fill="#c5a8e2" opacity="0.05"/>
  <path d="M0 800 Q360 700 720 800 T1440 750 L1440 900 L0 900 Z" fill="#f4a0b8" opacity="0.03"/>
  <path d="M0 850 Q480 780 960 850 T1440 800 L1440 900 L0 900 Z" fill="#a0c4e8" opacity="0.02"/>
</svg>
SVGEOF
  fi
}

# ============================================================
# GENERAR: Icono favicon
# ============================================================
generar_favicon() {
  if [ -f "$ASSETS_SRC/img/icons/favicon.svg" ]; then
    cp "$ASSETS_SRC/img/icons/favicon.svg" "$OUTPUT_DIR/assets/img/icons/favicon.svg"
  else
    cat > "$OUTPUT_DIR/assets/img/icons/favicon.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" fill="none">
  <rect width="32" height="32" rx="6" fill="#D70A53"/>
  <text x="16" y="22" font-family="system-ui, sans-serif" font-size="18" font-weight="800" fill="white" text-anchor="middle">D</text>
</svg>
SVGEOF
  fi
}

# ============================================================
# GENERAR: Placeholder para speakers
# ============================================================
generar_speaker_placeholder() {
  local num="$1"
  local hue=$(( (num * 60) % 360 ))
  local entry="${SPEAKERS[$(( num - 1 ))]}"
  local photo_path
  IFS='|' read -r photo_path _ <<< "$entry"
  local filename
  if [[ "$photo_path" == */* ]]; then
    filename="${photo_path##*/}"
  else
    filename="speaker${num}.svg"
  fi
  if [ ! -f "$OUTPUT_DIR/$photo_path" ] && [ ! -f "$ASSETS_SRC/$photo_path" ]; then
    cat > "$OUTPUT_DIR/assets/img/speakers/${filename}" << SVGEOF
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" fill="none">
  <circle cx="100" cy="100" r="100" fill="hsl(${hue}, 60%, 85%)"/>
  <circle cx="100" cy="80" r="35" fill="hsl(${hue}, 40%, 70%)"/>
  <ellipse cx="100" cy="160" rx="60" ry="40" fill="hsl(${hue}, 40%, 70%)"/>
</svg>
SVGEOF
  fi
}

# ============================================================
# GENERAR: Placeholder para sponsors
# ============================================================
generar_sponsor_placeholder() {
  local num="$1"
  local name="$2"
  local letter="${name:0:1}"
  local entry="${SPONSORS[$(( num - 1 ))]}"
  local logo_path
  IFS='|' read -r _ logo_path _ _ <<< "$entry"
  local filename
  if [[ "$logo_path" == */* ]]; then
    filename="${logo_path##*/}"
  else
    filename="sponsor${num}.svg"
  fi
  if [ ! -f "$OUTPUT_DIR/$logo_path" ] && [ ! -f "$ASSETS_SRC/$logo_path" ]; then
    cat > "$OUTPUT_DIR/assets/img/sponsors/${filename}" << SVGEOF
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 80" fill="none">
  <rect width="200" height="80" rx="8" fill="#f3f4f6"/>
  <text x="100" y="48" font-family="system-ui, sans-serif" font-size="28" font-weight="700" fill="#9ca3af" text-anchor="middle">${letter}</text>
  <text x="100" y="68" font-family="system-ui, sans-serif" font-size="10" fill="#d1d5db" text-anchor="middle">${name}</text>
</svg>
SVGEOF
  fi
}

# ============================================================
# GENERAR: HTML
# ============================================================
generar_html() {
  echo "  Generando HTML..."

  # Build inline SVG data for mascots
  local TUX_SVG=$(cat "$OUTPUT_DIR/assets/img/mascots/tux.svg" | sed 's/"/\\"/g' | tr -d '\n')
  local GNU_SVG=$(cat "$OUTPUT_DIR/assets/img/mascots/gnu.svg" | sed 's/"/\\"/g' | tr -d '\n')

  # Theme toggle button (configurable)
  local THEME_TOGGLE_HTML=""
  if [ "$ENABLE_THEME_SWITCH" = "true" ]; then
    THEME_TOGGLE_HTML='<button id="theme-toggle" class="btn btn-ghost btn-circle" aria-label="Cambiar tema">
            <i data-lucide="moon" class="w-5 h-5"></i>
          </button>'
  fi

  # Debian background watermark
  local DEBIAN_WATERMARK_HTML=""
  if [ "$ENABLE_DEBIAN_BACKGROUND" = "true" ] && [ -n "$DEBIAN_BACKGROUND_IMAGE" ]; then
    DEBIAN_WATERMARK_HTML='<div class="debian-watermark" aria-hidden="true"></div>'
  fi

  # Debian logo in navbar
  local DEBIAN_LOGO_NAV=""
  if [ "$ENABLE_DEBIAN_LOGO" = "true" ] && [ -n "$DEBIAN_LOGO_IMAGE" ]; then
    DEBIAN_LOGO_NAV='<span class="debian-logo-nav">'"<img src=\"$DEBIAN_LOGO_IMAGE\" alt=\"Debian\" class=\"h-8 w-auto opacity-60 hover:opacity-100 transition-opacity\">"'</span>'
  fi

  # Debian background CSS class for html element
  local DEBIAN_BG_CLASS=""
  if [ "$ENABLE_DEBIAN_BACKGROUND" = "true" ] && [ -n "$DEBIAN_BACKGROUND_IMAGE" ]; then
    DEBIAN_BG_CLASS=' has-debian-bg'
  fi

  # Build nav items from section order
  local NAV_ITEMS=""
  declare -A NAV_LABELS
  NAV_LABELS[hero]="Inicio"
  NAV_LABELS[information]="Informacion"
  NAV_LABELS[statistics]="Estadisticas"
  NAV_LABELS[speakers]="Ponentes"
  NAV_LABELS[schedule]="Cronograma"
  NAV_LABELS[sponsors]="Patrocinadores"
  NAV_LABELS[faq]="FAQ"
  NAV_LABELS[location]="Ubicacion"
  for section in "${SECTION_ORDER[@]}"; do
    if [ "$section" = "footer" ]; then continue; fi
    local label="${NAV_LABELS[$section]:-$section}"
    NAV_ITEMS+="<li><a href=\"#$section\" class=\"text-sm font-medium hover:text-[var(--color-primary)] transition-colors\">$label</a></li>"
  done

  cat > "$OUTPUT_DIR/index.html" << HTMLMAIN
<!DOCTYPE html>
<html lang="es" data-theme="$TEMA_PREDETERMINADO"$DEBIAN_BG_CLASS>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$(json_escape "$TITULO_EVENTO")</title>
  <meta name="description" content="$(json_escape "$DESCRIPCION")">
  <meta name="robots" content="index, follow">
  <meta name="theme-color" content="$COLOR_PRIMARIO">

  <meta property="og:title" content="$(json_escape "$TITULO_EVENTO")">
  <meta property="og:description" content="$(json_escape "$DESCRIPCION")">
  <meta property="og:type" content="website">
  <meta property="og:url" content="$DOMINIO">
  <meta property="og:image" content="$DOMINIO/$LOGO_PRINCIPAL">
  <meta property="og:locale" content="es_AR">

  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="$(json_escape "$TITULO_EVENTO")">
  <meta name="twitter:description" content="$(json_escape "$DESCRIPCION")">
  <meta name="twitter:image" content="$DOMINIO/$LOGO_PRINCIPAL">

  <link rel="icon" type="image/svg+xml" href="$FAVICON">

  <link rel="preconnect" href="https://cdn.jsdelivr.net">
  <link rel="preconnect" href="https://unpkg.com">

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.23/dist/full.min.css" rel="stylesheet">
  <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css">
  <link rel="stylesheet" href="css/style.css">

  <script>
    tailwind.config = {
      darkMode: 'class',
      theme: { extend: { fontFamily: { sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'] } } }
    }
  </script>
</head>
<body>
  $DEBIAN_WATERMARK_HTML
  <a href="#hero" class="skip-link">Saltar al contenido principal</a>

  <div class="navbar-blur fixed top-0 left-0 right-0 z-50">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8">
      <div class="navbar px-0">
        <div class="navbar-start">
          <a href="#hero" class="flex items-center gap-2">
            $DEBIAN_LOGO_NAV
            <div class="mascot-container" style="max-width:32px;">
              $(cat "$OUTPUT_DIR/assets/img/mascots/tux.svg")
            </div>
            <span class="text-lg font-bold hidden sm:inline">
              <span style="color:var(--color-primary);">Debian</span><span style="color:var(--color-secondary);">Day</span>
            </span>
          </a>
        </div>
        <div class="navbar-center hidden lg:flex">
          <ul class="menu menu-horizontal px-1 gap-1">
            $NAV_ITEMS
          </ul>
        </div>
        <div class="navbar-end gap-2">
          $THEME_TOGGLE_HTML
          <a href="$URL_REGISTRO" target="_blank" rel="noopener noreferrer" class="btn btn-sm rounded-full border-none text-white hidden sm:inline-flex shadow-md" style="background:var(--color-primary);">
            <i data-lucide="ticket" class="w-4 h-4 mr-1"></i>
            $(json_escape "$BOTON_REGISTRO")
          </a>
          <button id="menu-toggle" class="btn btn-ghost btn-circle lg:hidden" aria-expanded="false" aria-label="Abrir menu">
            <i data-lucide="menu" class="w-5 h-5"></i>
          </button>
        </div>
      </div>
    </div>
    <div id="mobile-menu" class="hidden lg:hidden border-t border-gray-100 dark:border-gray-800 bg-white dark:bg-gray-900">
      <ul class="menu menu-vertical p-4 gap-1">
        $NAV_ITEMS
      </ul>
    </div>
  </div>

  <main id="main-content"></main>

  <!-- Embedded data -->
  <script>
    window.DEBIANDAY_DATA = {
      tux: "$TUX_SVG",
      gnu: "$GNU_SVG",
      event: $(cat "$OUTPUT_DIR/assets/description/event.json"),
      speakers: $(cat "$OUTPUT_DIR/assets/description/speakers.json"),
      schedule: $(cat "$OUTPUT_DIR/assets/description/schedule.json"),
      faq: $(cat "$OUTPUT_DIR/assets/description/faq.json"),
      sponsors: $(cat "$OUTPUT_DIR/assets/description/sponsors.json"),
      social: $(cat "$OUTPUT_DIR/assets/description/social.json")
    };
  </script>

  <script src="https://unpkg.com/lucide@0.468.0/dist/umd/lucide.min.js"></script>
  <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
  <script src="js/app.js"></script>

</body>
</html>
HTMLMAIN
}

# ============================================================
# VALIDAR
# ============================================================
validar() {
  echo ""
  echo "  =========================================="
  echo "  Validando proyecto generado..."
  echo "  =========================================="
  local errores=0

  for f in "index.html" "css/style.css" "js/app.js"; do
    if [ ! -f "$OUTPUT_DIR/$f" ]; then
      echo "  ERROR: Falta $f"
      errores=$(( errores + 1 ))
    else
      echo "  OK: $f ($(wc -c < "$OUTPUT_DIR/$f") bytes)"
    fi
  done

  for d in "${DIRS[@]}"; do
    if [ ! -d "$d" ]; then
      echo "  ERROR: Falta directorio $d"
      errores=$(( errores + 1 ))
    else
      echo "  OK: $d/"
    fi
  done

  for jf in "event.json" "speakers.json" "schedule.json" "faq.json" "sponsors.json" "social.json"; do
    if [ ! -f "$OUTPUT_DIR/assets/description/$jf" ]; then
      echo "  ERROR: Falta $jf"
      errores=$(( errores + 1 ))
    else
      local jsize=$(wc -c < "$OUTPUT_DIR/assets/description/$jf")
      if [ "$jsize" -lt 10 ]; then
        echo "  WARN: $jf parece vacio ($jsize bytes)"
      else
        echo "  OK: assets/description/$jf ($jsize bytes)"
      fi
    fi
  done

  if grep -q "<html" "$OUTPUT_DIR/index.html" 2>/dev/null; then
    echo "  OK: HTML contiene tag <html>"
  else
    echo "  ERROR: HTML no contiene tag <html>"
    errores=$(( errores + 1 ))
  fi

  if grep -q "</html>" "$OUTPUT_DIR/index.html" 2>/dev/null; then
    echo "  OK: HTML contiene closing </html>"
  else
    echo "  ERROR: HTML no contiene </html>"
    errores=$(( errores + 1 ))
  fi

  if grep -q "DEBIANDAY_DATA" "$OUTPUT_DIR/index.html" 2>/dev/null; then
    echo "  OK: Datos JSON embebidos en HTML"
  else
    echo "  ERROR: No se encontraron datos JSON embebidos"
    errores=$(( errores + 1 ))
  fi

  if grep -q 'src="http://localhost\|src="file://' "$OUTPUT_DIR/index.html" 2>/dev/null; then
    echo "  ERROR: Hay referencias locales en HTML"
    errores=$(( errores + 1 ))
  else
    echo "  OK: No hay referencias locales rotas"
  fi

  for cdn in "cdn.tailwindcss.com" "cdn.jsdelivr.net" "unpkg.com"; do
    if grep -q "$cdn" "$OUTPUT_DIR/index.html" 2>/dev/null; then
      echo "  OK: CDN $cdn presente"
    else
      echo "  WARN: CDN $cdn no encontrado"
    fi
  done

  local json_valid=true
  for jf in "$OUTPUT_DIR/assets/description/"*.json; do
    if python3 -c "import json; json.load(open('$jf'))" 2>/dev/null; then
      echo "  OK: JSON valido: $(basename "$jf")"
    else
      echo "  ERROR: JSON invalido: $(basename "$jf")"
      json_valid=false
      errores=$(( errores + 1 ))
    fi
  done

  for img in $(grep -oP 'src="([^"]+)"' "$OUTPUT_DIR/index.html" | grep -v 'http' | grep -v '//' | sed 's/src="//;s/"//'); do
    local imgpath="$OUTPUT_DIR/$img"
    if [ ! -f "$imgpath" ] && [ ! -f "$OUTPUT_DIR/$img" ]; then
      echo "  WARN: Imagen local no encontrada: $img"
    fi
  done

  echo ""
  if [ "$errores" -eq 0 ] && [ "$json_valid" != false ]; then
    echo "  ✓ Validacion completada sin errores."
  else
    if [ "$errores" -eq 0 ]; then
      echo "  ✓ Validacion completada sin errores."
    else
      echo "  ✗ Se encontraron $errores errores."
      exit 1
    fi
  fi
  echo "  =========================================="
}

# ============================================================
# MOSTRAR: Resumen
# ============================================================
mostrar_resumen() {
  echo ""
  echo "  =========================================="
  echo "  Sitio generado exitosamente!"
  echo "  =========================================="
  echo ""
  echo "  Directorio: $OUTPUT_DIR/"
  echo "  Pagina principal: $OUTPUT_DIR/index.html"
  echo ""
  echo "  Estructura generada:"
  echo "  ├── index.html"
  echo "  ├── css/style.css"
  echo "  ├── js/app.js"
  echo "  ├── assets/"
  echo "  │   ├── description/ (JSON data)"
  echo "  │   └── img/"
  echo "  │       ├── speakers/ (${#SPEAKERS[@]})"
  echo "  │       ├── sponsors/ (${#SPONSORS[@]})"
  echo "  │       ├── mascots/"
  echo "  │       ├── icons/"
  echo "  │       ├── hero/"
  echo "  │       └── logos/"
  echo "  └── (listo para GitHub Pages)"
  echo ""
  echo "  Para desplegar: npx serve $OUTPUT_DIR"
  echo "  O: python3 -m http.server 8080 -d $OUTPUT_DIR"
  echo ""
  echo "  =========================================="
}

# ============================================================
# MAIN
# ============================================================
main() {
  echo ""
  echo "  ╔══════════════════════════════════════════╗"
  echo "  ║     DebianDay Landing Page Generator     ║"
  echo "  ╚══════════════════════════════════════════╝"
  echo ""

  generar_directorios
  copiar_assets_desde_fuente
  generar_css
  generar_js
  generar_tux_svg
  generar_gnu_svg
  generar_logo_svg
  generar_hero_svg
  generar_favicon

  # Clean up old placeholder files that no longer match config
  rm -f "$OUTPUT_DIR/assets/img/speakers/"speaker*.svg "$OUTPUT_DIR/assets/img/sponsors/"sponsor*.svg

  local sp_count="${#SPEAKERS[@]}"
  for (( i=1; i<=sp_count; i++ )); do
    generar_speaker_placeholder "$i"
  done

  for (( i=0; i<${#SPONSORS[@]}; i++ )); do
    IFS='|' read -r s_name _ _ _ <<< "${SPONSORS[$i]}"
    generar_sponsor_placeholder "$(( i + 1 ))" "$s_name"
  done

  generar_json_evento
  generar_json_speakers
  generar_json_cronograma
  generar_json_faq
  generar_json_sponsors
  generar_json_social
  generar_html

  echo ""
  echo "  Sitio generado en: $OUTPUT_DIR/"
  echo ""

  validar
  mostrar_resumen
}

main "$@"

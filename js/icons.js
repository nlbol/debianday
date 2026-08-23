/* ============================================================
   Iconos centralizados - Lucide
   Fuente unica de verdad: bloque ICON_* en generador.sh
   Registro: nombre semantico -> nombre de icono Lucide
   ============================================================ */
(function (global) {
  'use strict';

  var ICONS = {
    "calendar": "calendar",
    "location": "map-pin",
    "clock": "clock",
    "ticket": "ticket",
    "menu": "menu",
    "sun": "sun",
    "moon": "moon",
    "github": "github",
    "linkedin": "linkedin",
    "globe": "globe",
    "at-sign": "at-sign",
    "target": "target",
    "users": "users",
    "heart": "heart",
    "mail": "mail",
    "youtube": "youtube",
    "facebook": "facebook",
    "instagram": "instagram",
    "twitter": "twitter",
    "speaker": "mic",
    "faq": "help-circle",
    "sponsor": "award",
    "mastodon": "share-2",
    "telegram": "send",
    "discord": "message-circle",
    "matrix": "message-square",
    "gitlab": "gitlab",
    "website": "globe"
  };

  // Icono de respaldo si un nombre no existe en la version de Lucide cargada.
  var FALLBACK = 'circle';

  // Convierte "map-pin" -> "MapPin" (los nombres en lucide.icons son PascalCase).
  function toPascalCase(str) {
    return String(str).replace(/(^|-)(\w)/g, function (m, p1, p2) { return p2.toUpperCase(); });
  }

  // Verifica que el nombre exista en la libreria Lucide cargada.
  function exists(name) {
    if (typeof lucide === 'undefined' || !lucide.icons) return true;
    var kebab = String(name).trim();
    return !!lucide.icons[kebab] || !!lucide.icons[toPascalCase(kebab)];
  }

  // Devuelve el atributo data-lucide con un nombre valido.
  function icn(name) {
    var resolved = (ICONS[name] !== undefined ? ICONS[name] : name);
    if (!exists(resolved)) {
      if (typeof console !== 'undefined' && console.warn) {
        console.warn('[iconos] "' + resolved + '" no existe en Lucide; usando "' + FALLBACK + '"');
      }
      resolved = FALLBACK;
    }
    return 'data-lucide="' + resolved + '"';
  }

  global.DEBIANDAY_ICONS = {
    icn: icn,
    icons: ICONS,
    exists: exists,
    fallback: FALLBACK
  };
})(window);

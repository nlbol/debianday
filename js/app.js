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
      + '<span class="px-3 py-1.5 bg-[var(--color-primary)] text-white rounded-full text-sm font-bold shadow-sm">' + e.date + '</span>'
      + '</div>'
      + '<h1 class="text-5xl sm:text-6xl md:text-7xl lg:text-8xl font-extrabold tracking-tight leading-[1.05] mb-6">'
      + '<span class="text-[var(--color-primary)]">Debian</span> <span class="text-[var(--color-secondary)]">Day</span>'
      + '<span class="codename"> ' + e.hero.codename + '</span>'
      + '</h1>'
      + '<p class="text-lg sm:text-xl md:text-2xl text-gray-600 dark:text-gray-300 max-w-2xl mx-auto lg:mx-0 mb-8 leading-relaxed">' + e.hero.description + '</p>'
      + '<div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">'
      + '<a href="' + e.registerUrl + '" target="_blank" rel="noopener noreferrer" class="btn btn-lg rounded-full border-none text-white shadow-lg hover:shadow-xl transition-all duration-300" style="background:var(--color-primary);" data-aos="fade-up" data-aos-delay="200">'
      + '<i ' + icn('ticket') + ' class="w-5 h-5 mr-2"></i>' + e.hero.buttonRegister + '</a>'
      + '<a href="#schedule" class="btn btn-lg rounded-full btn-outline btn-pulse shadow-lg hover:shadow-xl transition-all duration-300" style="border-color:var(--color-primary);color:var(--color-primary);" data-aos="fade-up" data-aos-delay="300">'
      + '<i ' + icn('calendar') + ' class="w-5 h-5 mr-2"></i>' + e.hero.buttonSchedule + '</a>'
      + '</div>'
      + '<div class="flex items-center gap-6 mt-10 justify-center lg:justify-start text-sm text-gray-500 dark:text-gray-300" data-aos="fade-up" data-aos-delay="400">'
      + '<span class="flex items-center gap-2"><i ' + icn('location') + ' class="w-4 h-4"></i> ' + e.venue + ', ' + e.city + '</span>'
      + '<span class="flex items-center gap-2"><i ' + icn('clock') + ' class="w-4 h-4"></i> ' + e.time + '</span>'
      + '</div></div>'
      + '<div class="flex-1 flex justify-center lg:justify-end" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="200">'
      + '<div class="relative w-full max-w-sm lg:max-w-md">'
      + '<img src="' + d.poster + '" alt="' + e.title + ' Poster" class="poster-img" loading="lazy">'
      + '</div></div></div></div></section>';
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
      + '<p class="text-gray-600 dark:text-gray-300 leading-relaxed">' + e.information.objectives + '</p></div>'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="100">'
      + '<div class="w-14 h-14 rounded-2xl bg-[var(--color-accent)]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('users') + ' class="w-7 h-7 text-[var(--color-accent)]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Publico</h3>'
      + '<p class="text-gray-600 dark:text-gray-300 leading-relaxed">' + e.information.audience + '</p></div>'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="200">'
      + '<div class="w-14 h-14 rounded-2xl bg-[#a0c4e8]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('heart') + ' class="w-7 h-7 text-[#2B5797]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Organiza</h3>'
      + '<p class="text-gray-600 dark:text-gray-300 leading-relaxed">' + e.information.organizer + '</p></div>'
      + '<div class="card bg-white dark:bg-gray-800/60 shadow-sm hover:shadow-md transition-all duration-300 rounded-2xl p-8 border border-gray-100 dark:border-gray-700/50" data-aos="fade-up" data-aos-delay="300">'
      + '<div class="w-14 h-14 rounded-2xl bg-[#c5a8e2]/20 flex items-center justify-center mb-5">'
      + '<i ' + icn('location') + ' class="w-7 h-7 text-[#7c3aed]"></i></div>'
      + '<h3 class="text-xl font-bold mb-3">Ubicacion</h3>'
      + '<p class="text-gray-600 dark:text-gray-300 leading-relaxed">' + e.venue + ', ' + e.city + ', ' + e.country + '</p></div>'
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
        + '<div class="text-gray-500 dark:text-gray-300 mt-2 font-medium text-xs sm:text-sm">' + items[i].label + '</div></div>';
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
        + '<p class="text-gray-500 dark:text-gray-300 text-sm mb-1">' + sp.role + '</p>'
        + company
        + '<p class="text-gray-500 dark:text-gray-300 text-sm mt-4 leading-relaxed">' + sp.bio + '</p>'
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
      + '<p class="text-sm text-gray-500 dark:text-gray-300 mt-2">' + d.event.date + ' \u2014 ' + d.event.venue + ', ' + d.event.city + '</p></div>'
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
        + '<p class="text-sm text-gray-500 dark:text-gray-300 flex items-center gap-2 flex-wrap">'
        + '<span class="flex items-center gap-1"><svg class="w-3.5 h-3.5 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>' + sl.speaker + '</span>'
        + '<span class="text-gray-300 dark:text-gray-600 hidden sm:inline">|</span>'
        + '<span class="flex items-center gap-1"><svg class="w-3.5 h-3.5 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>' + sl.location + '</span></p>'
        + '<p class="text-sm text-gray-500 dark:text-gray-300 leading-relaxed mt-2">' + sl.description + '</p></div>';
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
        + '<div class="collapse-content"><p class="text-gray-600 dark:text-gray-300 leading-relaxed">' + list[i].answer + '</p></div></div>';
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
      + '<span class="text-xl font-bold"><span class="text-[var(--color-primary)]">Debian</span><span class="text-[var(--color-secondary)]">Day</span><span class="codename"> ' + d.event.hero.codename + '</span></span></div>'
      + '<p class="text-sm text-gray-500 dark:text-gray-300 leading-relaxed">' + e.description + '</p></div>'
      + '<div data-aos="fade-up" data-aos-delay="100">'
      + '<h3 class="text-sm font-semibold uppercase tracking-wider text-gray-400 mb-4">Contacto</h3>'
      + '<ul class="space-y-3 text-sm text-gray-500 dark:text-gray-300">' + contactHtml + '</ul></div>'
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

    // Keyboard navigation: arrow keys between sections
    (function () {
      var sections = document.querySelectorAll('section[id]');
      var ids = [];
      for (var i = 0; i < sections.length; i++) {
        ids.push(sections[i].id);
      }
      if (!ids.length) return;
      var busy = false;
      function onKey(e) {
        var el = document.activeElement;
        if (el) {
          var t = el.tagName;
          if (t === 'INPUT' || t === 'TEXTAREA' || t === 'SELECT') return;
          if (el.isContentEditable) return;
        }
        if (e.key !== 'ArrowDown' && e.key !== 'ArrowUp') return;
        e.preventDefault();
        if (busy) return;
        busy = true;
        setTimeout(function () { busy = false; }, 600);
        var best = ids[0], bestDist = Infinity;
        for (var i = 0; i < ids.length; i++) {
          var el = document.getElementById(ids[i]);
          if (!el) continue;
          var d = Math.abs(el.getBoundingClientRect().top);
          if (d < bestDist) { bestDist = d; best = ids[i]; }
        }
        var idx = ids.indexOf(best);
        if (idx < 0) return;
        var next = e.key === 'ArrowDown'
          ? Math.min(idx + 1, ids.length - 1)
          : Math.max(idx - 1, 0);
        if (next === idx) return;
        var target = document.getElementById(ids[next]);
        if (target) {
          var top = target.getBoundingClientRect().top + window.scrollY - 80;
          window.scrollTo({ top: top, behavior: 'smooth' });
        }
      }
      document.addEventListener('keydown', onKey);
    })();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

})();

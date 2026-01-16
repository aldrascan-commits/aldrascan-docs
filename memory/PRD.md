# AldraScan - Catálogo Digital de Productos Dentales

## Descripción del Proyecto
Catálogo web visual premium estilo Apple/Medit para la marca "AldraScan" de productos dentales. Diseño "clínico-tecnológico" con fondo claro, tarjetas blancas, tipografía Inter, amplio espacio en blanco y badges estilo pill.

## Estado Actual
**MVP COMPLETO** - Aplicación frontend funcional

## Características Implementadas

### UI/UX
- [x] Diseño "clínico-tecnológico" limpio y profesional
- [x] Header con logo AldraScan, navegación por categorías, toggle de tema
- [x] Hero Section con badge "Catálogo 2025", títulos y CTAs
- [x] Cards de productos con imágenes, badges pill, descripciones
- [x] 3 niveles de precio: PVP, Distribuidor, Gold
- [x] Footer completo con contacto, links y nota de IVA
- [x] Modal "Solicitar Oferta" con formulario
- [x] Modo oscuro/claro toggle
- [x] Diseño responsive

### Categorías de Productos
- [x] Escáneres Intraorales (6 productos)
- [x] Packs (múltiples packs con productos incluidos)
- [x] CAD/CAM (fresadoras y software)
- [x] Radiología (equipos de rayos X)
- [x] Servicios (formación, instalación, soporte)

### Contenido
- [x] Todos los productos con nombre, descripción, imagen
- [x] Precios en 3 niveles (PVP, Distribuidor, Gold)
- [x] Badges informativos (3 Años Garantía, Incluye iPad/Mac, etc.)
- [x] Logo AldraScan integrado

### Exportación
- [x] ZIP del código fuente disponible en `/app/aldrascan-catalog.zip`

## Arquitectura Técnica

```
/app/frontend/
├── src/
│   ├── components/
│   │   ├── layout/
│   │   │   ├── Header.jsx
│   │   │   └── Footer.jsx
│   │   ├── sections/
│   │   │   ├── HeroSection.jsx
│   │   │   ├── FeaturedSection.jsx
│   │   │   ├── CategorySection.jsx
│   │   │   └── CTASection.jsx
│   │   ├── ProductCard.jsx
│   │   ├── QuoteModal.jsx
│   │   └── ThemeToggle.jsx
│   ├── data/
│   │   └── catalog.js  (todos los datos de productos)
│   └── pages/
│       └── CatalogPage.jsx
```

## Stack Tecnológico
- **Frontend**: React, Tailwind CSS, shadcn/ui, Lucide Icons
- **Fuente**: Inter
- **Datos**: Hardcoded en catalog.js (sin backend)

## Tareas Pendientes (Backlog)

### P1 - Backend Integration (Opcional)
- [ ] Modelo MongoDB para solicitudes de cotización
- [ ] Endpoint POST `/api/quotes` para guardar formularios
- [ ] Endpoint GET `/api/catalog` para servir datos
- [ ] Refactorizar frontend para consumir API

### P2 - Mejoras UX
- [ ] Animaciones de entrada en scroll
- [ ] Filtros de búsqueda de productos
- [ ] Comparador de productos
- [ ] Galería de imágenes por producto

## Verificación Completada
- Fecha: Enero 2026
- Resultado: Todas las secciones funcionando correctamente
- Modo oscuro: Funcionando
- Modal de cotización: Funcionando
- Precios: 3 niveles visibles (PVP, Distribuidor, Gold)

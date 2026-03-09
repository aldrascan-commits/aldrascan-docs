import '../models/product.dart';

class ProductData {
  static const List<Product> products = [

    // ─── ESCÁNERES INTRAORALES ────────────────────────────────────────────────
    Product(
      id: 'medit_i600',
      name: 'Medit i600',
      subtitle: 'Iniciación Premium',
      category: 'scanner',
      price: 5900,
      financing: '60 meses · desde 98 €/mes',
      description:
          'Escáner intraoral de alta precisión con escaneo rápido a 35 FPS. Ultraligero con 245 gramos. Amortización en 12 meses. La entrada perfecta al flujo de trabajo digital.',
      features: [
        'Velocidad 35 FPS de vídeo',
        'Ultraligero 245 gramos',
        'Plug & Scan fácil uso',
        'Garantía oficial 3 años',
        'Envío en 24h',
        'Formación clínica incluida',
      ],
      imageAsset:
          'assets/products/medit_i600.png',
      badge: 'Oferta Estrella',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i600 (5.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'panda_smart',
      name: 'Panda Smart',
      subtitle: 'Escáner Ultraligero 138g',
      category: 'scanner',
      price: 6900,
      financing: '60 meses · desde 115 €/mes',
      description:
          'El escáner intraoral más ligero del mercado con solo 138 gramos. Incluye PC de alto rendimiento. Tecnología USB-C Plug & Play para máxima facilidad de uso. Amortización en 12 meses.',
      features: [
        'Ultraligero 138 gramos — sin fatiga',
        'Escaneo fluido 35 FPS',
        'Conexión USB-C Plug & Play',
        'Calibración automática',
        'PC de alto rendimiento incluido',
        'Botón Motion integrado',
      ],
      imageAsset:
          'assets/products/panda_smart.png',
      badge: 'Ultraligero',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Panda Smart (6.900€ + PC incluido). ¿Podéis darme más información?',
    ),

    Product(
      id: 'medit_i700',
      name: 'Medit i700 / i700w',
      subtitle: 'Velocidad Profesional',
      category: 'scanner',
      price: 8500,
      financing: '60 meses · desde 142 €/mes',
      description:
          'El doble de velocidad que el i600 con 70 FPS y precisión profesional de 10,9 µm. Disponible en versión wireless i700w. Amortización en 10-15 meses.',
      features: [
        'Velocidad 70 FPS (2x vs i600)',
        'Precisión 10,9 µm profesional',
        'Opción wireless i700w disponible',
        'LED UV-C desinfección integrada',
        'Garantía oficial 3 años',
        'Formación incluida',
      ],
      imageAsset:
          'assets/products/medit_i700_real.png',
      badge: 'Oferta Core',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i700/i700w (8.500€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'aoralscan_elf',
      name: 'Aoralscan Elf',
      subtitle: 'Escáner Premium 106g',
      category: 'scanner',
      price: 9900,
      financing: '60 meses · desde 165 €/mes',
      description:
          'El escáner más ligero del mercado con solo 106 gramos — líder en ergonomía. Tecnología IntelliBite de Shining 3D. 3 puntas incluidas. Amortización en 10 meses.',
      features: [
        'Peso pluma 106 gramos',
        'Tecnología IntelliBite',
        '3 puntas incluidas (19x14/16x12/12x9mm)',
        'Dimensiones 245x27x30mm',
        'Software gratuito incluido',
        'Envío inmediato',
      ],
      imageAsset:
          'assets/products/aoralscan_elf.png',
      badge: 'Novedad',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Aoralscan Elf de Shining 3D (9.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'medit_i900_classic',
      name: 'Medit i900 Classic+',
      subtitle: 'Máxima Precisión + Portátil',
      category: 'scanner',
      price: 12900,
      financing: '60 meses · desde 215 €/mes',
      description:
          'El buque insignia de Medit con hasta 70 FPS, FOV 100x más grande y precisión de 10,9 µm. Incluye MacBook Air M4. 12 ScanBodys de regalo para usuarios AldraScan.',
      features: [
        'Hasta 70 FPS con Medit Flexscan',
        'FOV 100x más grande',
        'Precisión 10,9 µm',
        'Peso ultraligero 268g',
        'MacBook Air M4 incluido',
        '12 ScanBodys de regalo',
        'Garantía oficial 3 años',
      ],
      imageAsset:
          'assets/products/medit_i900_classic_real.png',
      badge: 'Portátil Incluido',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i900 Classic+ con MacBook Air M4 (12.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'medit_i900_mobility',
      name: 'Medit i900 Mobility',
      subtitle: 'Libertad Total + iPad Pro',
      category: 'scanner',
      price: 13900,
      financing: '60 meses · desde 232 €/mes',
      description:
          '100% inalámbrico con batería integrada. iPad Pro incluido de regalo. Hasta 70 FPS, FOV ampliado 100x y 317g con batería. 12 ScanBodys de regalo. La libertad total en el escaneo.',
      features: [
        '100% inalámbrico con batería',
        'iPad Pro incluido',
        'Velocidad hasta 70 FPS',
        'FOV ampliado 100x más grande',
        'Ultraligero 317g con batería',
        '12 ScanBodys de regalo',
        'Configuración Apple incluida',
        'Soporte clínico especializado',
      ],
      imageAsset:
          'assets/products/medit_i900_mobility_real.png',
      badge: 'iPad Pro Regalo',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i900 Mobility con iPad Pro (13.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'aoralscan_elite_scanbody',
      name: 'Aoralscan Elite + Kit ScanBody',
      subtitle: 'Más Vendido Shining 3D',
      category: 'scanner',
      price: 13900,
      financing: '60 meses · desde 232 €/mes',
      description:
          'Tecnología IPG 2 en 1 con fotogrametría. Kit ScanBody de regalo valorado en 2.000€ (precio sin kit: 15.900€). Alta precisión con campo 19x14mm y solo 124g.',
      features: [
        'Tecnología IPG 2 en 1 + Fotogrametría',
        'Kit ScanBody incluido (valor 2.000€)',
        'Sistema Alta Precisión 19x14mm',
        'Ultraligero 124 gramos',
        'Escaneo IA + Movimiento',
        'Autoclave 100 ciclos',
        'Amortización 8-12 meses',
      ],
      imageAsset:
          'assets/products/aoralscan_elite_scanbody.png',
      badge: 'Kit ScanBody Regalo',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Aoralscan Elite + Kit ScanBody (13.900€). ¿Podéis darme más información?',
    ),

    // ─── PACKS TODO EN UNO ────────────────────────────────────────────────────
    Product(
      id: 'pack_medit_i900_todo',
      name: 'Pack Medit i900',
      subtitle: 'Todo en Uno — Best Seller',
      category: 'pack',
      price: 13900,
      financing: '60 meses · desde 232 €/mes',
      description:
          'Precio especial feria 2026. Pack profesional completo: Medit i900 + Mac Mini + Pantalla 24" + Mueble clínico. Instalación, envío inmediato y formación incluidos. Garantía oficial AldraScan.',
      features: [
        'Medit i900 escáner profesional',
        'Mac Mini última generación',
        'Pantalla 24" Touch incluida',
        'Mueble clínico integrado',
        'Garantía oficial 3 años',
        'Instalación incluida',
        'Formación clínica completa',
        'Envío inmediato',
      ],
      imageAsset:
          'assets/products/pack_medit_i900.png',
      badge: 'Oferta Estrella',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Pack Medit i900 Todo en Uno (13.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'pack_aldrascan_pro',
      name: 'Pack AldraScan Pro',
      subtitle: 'Solución Clínica Total',
      category: 'pack',
      price: 39900,
      financing: '60 meses · desde 665 €/mes',
      description:
          'La solución más completa del mercado. Medit i900 + Software ClinicCAD con IA + Fresadora 5 ejes. Produce 40-60 coronas/mes. Flujo completo: escaneo 90 min + fresado 90 min. Ahorra 10.100€ vs PVP.',
      features: [
        'Medit i900 escáner top de gama',
        'ClinicCAD — Diseño con IA',
        'Fresadora 5 ejes incluida',
        '40-60 coronas por mes',
        'Sin provisionales · Sin segundas citas',
        'Instalación VIP incluida',
        'Formación clínica completa',
        'Ahorra 10.100€ vs PVP 50.000€',
      ],
      imageAsset:
          'assets/products/pack_aldrascan_pro.png',
      badge: 'Top Ventas',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Pack AldraScan Pro (39.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'pack_laboratorio_digital',
      name: 'Pack Laboratorio Digital',
      subtitle: 'Fresado + Sinterizado + Impresión 3D',
      category: 'pack',
      price: 29900,
      financing: '60 meses · consultar cuota',
      description:
          'Del diseño digital al producto final. Pack completo 3 etapas: Lilivis Mill LM-100 (fresadora) + Duotron T-3200 (sinterizado) + Elegoo Mars 5 (impresión 3D). Ahorra +9.000€. Solo oferta Expodental.',
      features: [
        'Lilivis Mill LM-100 — Fresadora Dual 3 Ejes',
        'Duotron T-3200 — Sinterizado Max 1100°C',
        'Elegoo Mars 5 — Impresión 3D LCD Mono 4K',
        '+500€ en materiales incluidos',
        'Flujo completo en clínica',
        'Ahorra +9.000€ vs compra separada',
        'Solo disponible en feria / fin de stock',
      ],
      imageAsset:
          'assets/products/pack_laboratorio_digital.png',
      badge: 'Oferta Expodental',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Pack Laboratorio Digital (29.900€). ¿Podéis darme más información?',
    ),

    // ─── FRESADORAS ──────────────────────────────────────────────────────────
    Product(
      id: 'lilivis_mill_lm100',
      name: 'Lilivis Mill LM-100',
      subtitle: 'Fresadora Dental Doble 3 Ejes',
      category: 'fresadora',
      price: null,
      financing: 'Consultar oferta Expodental',
      description:
          'Fresadora dental Wet & Dry de alta precisión. Dual Spindles con 4 motores a 50.000 rpm. Precisión ±25µm. Procesa disilicato, híbrida y zirconia. Compacta y silenciosa ≤69dB.',
      features: [
        'Dual 3 Axis simultáneo',
        '4 motores / 50.000 rpm',
        'Precisión repetibilidad ±25µm',
        'Velocidad 8-15 min por pieza',
        'Materiales: Disilicato, Híbrida, Zirconia, PMMA',
        'Pantalla táctil LCD 7"',
        'Tamaño compacto 743x464x455mm / 61kg',
        'Unidades limitadas',
      ],
      imageAsset:
          'assets/products/lilivis_mill.png',
      badge: 'Unidades Limitadas',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Lilivis Mill LM-100. ¿Podéis darme precio y más información?',
    ),

    Product(
      id: 'deprag_w4',
      name: 'DEPRAG W4',
      subtitle: 'Fresadora 4 Ejes Wet Milling',
      category: 'fresadora',
      price: 17500,
      financing: '60 meses · desde 292 €/mes',
      description:
          'Fresadora dental de 4 ejes especializada en cerámica vítrea. Precisión 0,01mm / 5µm. Sistema Wet/Tanque con 20 bloques de capacidad. Auto-calibración con -15% desperdicio.',
      features: [
        '4 ejes de fresado',
        'Potencia 2,5kW / 60.000 rpm',
        'Precisión 0,01mm / 5µm',
        '20 bloques de capacidad',
        'Sistema Wet / Tanque',
        'Materiales: Cerámica / PMMA',
        'Pantalla LCD 19,5" Windows 10',
        'Especializada en Cerámica Vítrea',
      ],
      imageAsset:
          'assets/products/deprag_w4.png',
      badge: 'Precio Feria',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la DEPRAG W4 (17.500€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_s410',
      name: 'Philden S410 Húmedo',
      subtitle: 'Fresadora CAM Iniciación',
      category: 'fresadora',
      price: 16990,
      financing: 'Consultar financiación',
      description:
          'Sistema CAM de iniciación de Philden. Sistema húmedo compacto con capacidad básica de 15-25 coronas/día. Precio feria desde 16.990€ (antes 19.292€).',
      features: [
        'Sistema húmedo compacto',
        'Capacidad 15-25 coronas/día',
        'Nivel iniciación',
        'Precio feria especial',
      ],
      imageAsset:
          'assets/products/philden_s410.png',
      badge: 'Iniciación',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden S410 (16.990€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_s510',
      name: 'Philden S510 Seco',
      subtitle: 'Fresadora CAM Estándar',
      category: 'fresadora',
      price: 15900,
      financing: 'Consultar financiación',
      description:
          'Fresadora CAM seca estándar de 5 ejes con electrónica Pro. 20-35 coronas/día. Precio feria 15.900€ (-15% OFF, antes 16.442€).',
      features: [
        '5 ejes seco',
        'Electrónica Pro',
        '20-35 coronas/día',
        '-15% OFF precio feria',
      ],
      imageAsset:
          'assets/products/philden_s510.png',
      badge: '-15% OFF',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden S510 (15.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_x500',
      name: 'Philden X500 Híbrida',
      subtitle: 'Elite Híbrida — Mejor Oferta',
      category: 'fresadora',
      price: 31900,
      financing: 'Consultar financiación',
      description:
          'La fresadora más avanzada de Philden. Sistema Húmedo/Seco, alta producción industrial. 40-80 coronas/día. Ahorra 12.633€ (-28% vs PVP 43.778€).',
      features: [
        'Sistema Húmedo y Seco',
        'Alta producción 40-80 coronas/día',
        'Versatilidad total',
        'Alta producción industrial',
        'Ahorra 12.633€ vs PVP',
        '-28% descuento feria',
      ],
      imageAsset:
          'assets/products/philden_x500.png',
      badge: 'Mejor Oferta',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden X500 Híbrida (31.900€). ¿Podéis darme más información?',
    ),

    // ─── IMPRESORAS 3D ────────────────────────────────────────────────────────
    Product(
      id: 'lilivis_print_lp100',
      name: 'Lilivis Print LP-100 + UV',
      subtitle: 'Impresora 3D Dental MSLA',
      price: null,
      category: 'impresora',
      financing: 'Consultar condiciones Expodental',
      description:
          'Impresora 3D dental MSLA Adaptativa con sistema LSA de auto-calibración al 95%. Resolución 50µm XY, velocidad 10-30 min/trabajo. Lentes Fresnel patentadas. Incluye sistema UV.',
      features: [
        'Tecnología MSLA Adaptativa',
        'Resolución 50µm (XY) / 405nm',
        'Sistema LSA auto-calibración 95%',
        'Velocidad 10-30 min por trabajo',
        'Plataforma 120x75x120mm',
        'Lentes Fresnel asféricas patentadas',
        'Sistema abierto multi-materiales',
        'Software L-CAD integrado',
      ],
      imageAsset:
          'assets/products/lilivis_print.png',
      badge: 'Solicitar Oferta',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Lilivis Print LP-100. ¿Podéis darme precio y condiciones Expodental?',
    ),

    Product(
      id: 'duotron_t3200',
      name: 'Duotron T-3200',
      subtitle: 'Horno Sinterizado Pro',
      category: 'impresora',
      price: 4300,
      financing: '60 meses · desde 72 €/mes',
      description:
          'Horno de sinterizado profesional Max 1100°C con bomba de vacío integrada. Ahorra 1.320€ (antes 5.620€). Ciclo 2-4 horas, cámara Ø92x66mm. Bandejas de cocción incluidas.',
      features: [
        'Temperatura máx. 1.100°C',
        'Ciclo 2-4 horas',
        'Cámara Ø92x66mm',
        'Vacío integrado',
        'Bandejas cocción incluidas',
        'Control automático',
        'Ahorra 1.320€ vs PVP',
        'Kit materiales de regalo',
      ],
      imageAsset:
          'assets/products/duotron_t3200.png',
      badge: 'Ahorra 1.320€',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Duotron T-3200 (4.300€). ¿Podéis darme más información?',
    ),

    // ─── CBCT 3D ─────────────────────────────────────────────────────────────
    Product(
      id: 'rayscan_3d',
      name: 'Rayscan Alpha 3D',
      subtitle: 'CBCT Premium con IA',
      category: 'cbct',
      price: 29900,
      financing: '60 meses · desde 498 €/mes',
      description:
          'CBCT premium con tecnología inteligente y IA integrada. FOV variable ø50-ø170mm, Vóxel 70-400µm. Reconst. 8 seg, escaneo 1 seg. Pano + Ceph incluidos. Amortización 9-14 meses.',
      features: [
        'FOV variable ø50-ø170mm máxima versatilidad',
        'Tecnología IA — Filtros Smart antiartefactos',
        'Alta definición Vóxel 70µm - 400µm',
        'Velocidad: Reconst. 8 seg / Scan 1 seg',
        'Pano + Ceph modalidades incluidas',
        'Ultra baja dosis — Certificado CE',
        'Producción 35-60 estudios/mes',
        'Financiación 60 meses disponible',
      ],
      imageAsset:
          'assets/products/rayscan_alpha.png',
      badge: 'Oferta Premium',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Rayscan Alpha 3D (29.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'meyer_3d_13x10',
      name: 'Meyer 3D 13×10',
      subtitle: 'CBCT Alta Resolución',
      category: 'cbct',
      price: 29900,
      financing: '60 meses · desde 498 €/mes',
      description:
          'CBCT panorámico 3D Alta Resolución HD con campo de visión 13x10 cm. Opción líder calidad/precio. Radiografía Pano + modos extra. Baja dosis seguridad paciente. Amortización 10-15 meses.',
      features: [
        'Campo de visión 13x10 cm FOV',
        'Resolución Alta Definición HD',
        'Software 3D de diagnóstico incluido',
        'Velocidad escaneo rápido',
        'Radiografía Pano + Modos Extra',
        'Baja dosis seguridad paciente',
        'Producción 30-50 CBCT/mes',
        'Amortización 10-15 meses',
      ],
      imageAsset:
          'assets/products/meyer_cbct.png',
      badge: 'Líder Calidad/Precio',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Meyer 3D 13x10 (29.900€). ¿Podéis darme más información?',
    ),

    // ─── SILLONES DENTALES ────────────────────────────────────────────────────
    Product(
      id: 'cingol_x1',
      name: 'Sillón Cingol X1',
      subtitle: 'Sillón Dental Ergonómico',
      category: 'sillon',
      price: null,
      financing: 'Consultar precio Expodental',
      description:
          'Sillón dental profesional Cingol X1 de diseño ergonómico y acabados premium. Tapizado de alta resistencia, sistema hidráulico silencioso y brazo articulado para máxima comodidad del paciente y del clínico.',
      features: [
        'Diseño ergonómico premium',
        'Sistema hidráulico silencioso',
        'Tapizado antibacteriano de alta resistencia',
        'Brazo articulado con escupidera',
        'Panel de control digital integrado',
        'Lámpara LED de diagnóstico incluida',
        'Disponible en azul y naranja',
        'Garantía oficial 2 años',
      ],
      imageAsset:
          'assets/products/sillon_x1_blue.png',
      badge: 'Oferta Expodental',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Sillón Cingol X1. ¿Podéis darme precio y más información?',
    ),

    Product(
      id: 'luvis_chair',
      name: 'Luvis Chair',
      subtitle: 'Unidad Dental Inteligente',
      category: 'sillon',
      price: null,
      financing: 'Consultar precio Expodental',
      description:
          'Unidad dental Luvis Chair de Dentis. Diseño moderno con lámpara LED integrada de alta potencia, sistema táctil de control y tapizado ergonómico de lujo. Referencia en clínicas de alto nivel.',
      features: [
        'Lámpara LED Luvis integrada',
        'Control táctil digital avanzado',
        'Tapizado ergonómico premium',
        'Sistema hidráulico ultra silencioso',
        'Escupidera integrada con sensor',
        'Bandeja instrumental articulada',
        'Acabados de alta calidad',
        'Garantía oficial 2 años',
      ],
      imageAsset:
          'assets/products/luvis_chair.png',
      badge: 'Alta Gama',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Luvis Chair (unidad dental Dentis). ¿Podéis darme precio y más información?',
    ),

    // ─── CAD/CAM – FRESADORAS PHILDEN ────────────────────────────────────────

    Product(
      id: 'philden_s500',
      name: 'Philden S500 Seco',
      subtitle: 'Fresadora 5 Ejes Laboratorio',
      category: 'cadcam',
      price: 13550,
      financing: '60 meses · desde 226 €/mes',
      description:
          'Fresadora de fresado seco ideal para laboratorio. 5 ejes, 12 herramientas, husillo 60.000 rpm. Requiere compresor 8 bar. Software CAM incluido. Precisión industrial para producción diaria.',
      features: [
        '5 ejes de precisión industrial',
        '12 herramientas automáticas',
        'Husillo 60.000 rpm / 900W',
        'Fresado en seco (DRY)',
        'Software CAM incluido',
        'Garantía oficial 2 años',
      ],
      imageAsset: 'assets/products/philden_s410.png',
      badge: 'Laboratorio',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden S500 Seco (13.550€ + IVA). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_adc500',
      name: 'Philden ADC-500',
      subtitle: 'Fresadora Automática 24/7',
      category: 'cadcam',
      price: 17990,
      financing: '60 meses · desde 300 €/mes',
      description:
          'Fresadora automática con cargador de 10 discos para producción continua 24/7. 5 ejes, 12 herramientas, cambio automático de bloques. Máxima productividad para laboratorios de alto volumen.',
      features: [
        'Cargador automático 10 discos',
        'Producción 24/7 sin paradas',
        '5 ejes de alta precisión',
        '12 herramientas automáticas',
        'Fresado seco + software CAM',
        'Ideal laboratorio alto volumen',
      ],
      imageAsset: 'assets/products/philden_s510.png',
      badge: 'Producción 24/7',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa la Philden ADC-500 automática (17.990€ + IVA). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_x500',
      name: 'Philden X500 Híbrida',
      subtitle: 'Wet & Dry – Todo en Uno',
      category: 'cadcam',
      price: 32800,
      financing: '60 meses · desde 547 €/mes',
      description:
          'La fresadora industrial todo-en-uno con fresado húmedo Y seco en la misma máquina. 5 ejes, 21 herramientas, potencia 2,5 kW. Sistema profesional para clínicas y laboratorios de máximo rendimiento.',
      features: [
        'Fresado húmedo + seco combinado',
        '5 ejes industriales',
        '21 herramientas automáticas',
        'Potencia 2,5 kW',
        'Sistema todo-en-uno',
        'Máximo rendimiento profesional',
      ],
      imageAsset: 'assets/products/philden_x500.png',
      badge: 'Top Gama',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa la Philden X500 Híbrida (32.800€). ¿Podéis darme más información?',
    ),

    // ─── CAD/CAM – FRESADORAS DEPRAG ─────────────────────────────────────────

    Product(
      id: 'deprag_d5_afe',
      name: 'Deprag D5 AFE',
      subtitle: 'Fresado Seco Sin Compresor',
      category: 'cadcam',
      price: 19900,
      financing: '60 meses · desde 332 €/mes',
      description:
          'Fresadora Deprag 5 ejes con tecnología Airless (sin compresor). 10 herramientas automáticas. Fresado en seco de alta precisión para laboratorio y clínica digital avanzada.',
      features: [
        '5 ejes de alta precisión',
        '10 herramientas automáticas',
        'Sin compresor (Airless)',
        'Fresado seco profesional',
        'Software CAM incluido',
        'Soporte técnico especializado',
      ],
      imageAsset: 'assets/products/deprag_w4.png',
      badge: 'Sin Compresor',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Deprag D5 AFE (19.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'deprag_d5_max',
      name: 'Deprag D5 MAX',
      subtitle: 'Producción Masiva 24/7',
      category: 'cadcam',
      price: 20900,
      financing: '60 meses · desde 348 €/mes',
      description:
          'La fresadora de producción masiva con 8 discos automáticos y 10 herramientas. 5 ejes, 520 kg, funcionamiento 24/7. Para laboratorios de alto volumen que requieren máxima fiabilidad y producción continua.',
      features: [
        '8 discos automáticos',
        'Producción masiva 24/7',
        '5 ejes – 10 herramientas',
        'Peso industrial 520 kg',
        'Máxima fiabilidad',
        'Ideal laboratorio volumen',
      ],
      imageAsset: 'assets/products/deprag_w4.png',
      badge: '8 Discos Auto',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Deprag D5 MAX (20.900€). ¿Podéis darme más información?',
    ),

    // ─── CAD/CAM – HORNOS SINTERIZACIÓN KDF ──────────────────────────────────

    Product(
      id: 'kdf_standard',
      name: 'KDF Zircom Standard',
      subtitle: 'Sinterización Japonesa 1.600°C',
      category: 'cadcam',
      price: 11800,
      financing: '60 meses · desde 197 €/mes',
      description:
          'Horno de sinterización japonés KDF de alta fiabilidad. 1.600°C máximo, 3 bandejas (50 unidades), fabricación japonesa de precisión. Regalo de 1.000€ en material incluido en la compra.',
      features: [
        'Temperatura máx. 1.600°C',
        '3 bandejas – 50 unidades',
        'Fabricación japonesa',
        'Alta fiabilidad y precisión',
        '1.000€ en material de regalo',
        'Garantía oficial 2 años',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: '1.000€ Regalo',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el KDF Zircom Standard (11.800€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'kdf_speed',
      name: 'KDF Zircom Speed',
      subtitle: 'Sinterización Rápida 90 min',
      category: 'cadcam',
      price: 13890,
      financing: '60 meses · desde 232 €/mes',
      description:
          'Horno KDF con modo rápido de sinterización en solo 90 minutos. 1.600°C, 3 bandejas. Perfecto para clínicas que necesitan restauraciones same-day. Regalo de 1.500€ en material incluido.',
      features: [
        'Modo SPEED: 90 minutos',
        'Temperatura máx. 1.600°C',
        '3 bandejas capacidad',
        'Same-day dentistry',
        '1.500€ en material de regalo',
        'Fabricación japonesa premium',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: '90 min · 1.500€ Regalo',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el KDF Zircom Speed (13.890€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'kdf_plus',
      name: 'KDF Zircom Plus',
      subtitle: 'Alta Producción 60-90 Unidades',
      category: 'cadcam',
      price: 15300,
      financing: '60 meses · desde 255 €/mes',
      description:
          'El horno KDF de mayor capacidad: 3 bandejas para 60-90 unidades simultáneas. 1.600°C. Para laboratorios de alta producción que necesitan máxima capacidad. Regalo de 1.500€ en material incluido.',
      features: [
        '60-90 unidades simultáneas',
        '3 bandejas gran capacidad',
        'Temperatura máx. 1.600°C',
        'Alta producción laboratorio',
        '1.500€ en material de regalo',
        'Máxima capacidad KDF',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: 'Alta Producción',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el KDF Zircom Plus (15.300€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'deprag_s7',
      name: 'Deprag S7 MOSI2',
      subtitle: 'Sinterización Rápida WiFi + App',
      category: 'cadcam',
      price: 7500,
      financing: '60 meses · desde 125 €/mes',
      description:
          'Horno de sinterización rápida con tecnología MOSI2. Solo 90 minutos, 1.600°C, control por WiFi y app móvil. El más avanzado tecnológicamente con conectividad total desde el smartphone.',
      features: [
        'Sinterización en 90 minutos',
        'Control WiFi + App móvil',
        'Temperatura máx. 1.600°C',
        'Tecnología MOSI2',
        'Conectividad total',
        'Control remoto desde móvil',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: 'WiFi + App',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Deprag S7 MOSI2 (7.500€). ¿Podéis darme más información?',
    ),

    // ─── CAD/CAM – HORNO COCCIÓN DUOTRON T-5200 ──────────────────────────────

    Product(
      id: 'duotron_t5200',
      name: 'Duotron T-5200',
      subtitle: 'Horno Profesional 1.200°C',
      category: 'cadcam',
      price: 12400,
      financing: '60 meses · desde 207 €/mes',
      description:
          'Horno de cocción profesional de precisión. 1.200°C, soporte inyección, gestión USB, trifásico. Para laboratorios que requieren máxima precisión en cocción de cerámica y materiales premium.',
      features: [
        'Temperatura máx. 1.200°C',
        'Soporte inyección',
        'Gestión programas USB',
        'Trifásico profesional',
        'Precisión total en cocción',
        'Garantía oficial 2 años',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: 'Inyección',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Duotron T-5200 (12.400€). ¿Podéis darme más información?',
    ),

    // ─── CAD/CAM – ASPIRACIÓN ─────────────────────────────────────────────────

    Product(
      id: 'philden_r407',
      name: 'Philden R-407-1',
      subtitle: 'Aspiración Portátil 150 m³/h',
      category: 'cadcam',
      price: 1230,
      financing: null,
      description:
          'Sistema de aspiración portátil para fresadoras de seco. 150 m³/h, 59 dB, plug & play. Compacto y silencioso, compatible con fresadoras Philden y Deprag. Instalación inmediata sin obras.',
      features: [
        'Caudal 150 m³/h',
        'Nivel sonoro 59 dB',
        'Plug & Play – sin instalación',
        'Portátil y compacto',
        'Compatible Philden/Deprag',
        'Filtro HEPA incluido',
      ],
      imageAsset: 'assets/products/philden_r407.png',
      badge: 'Plug & Play',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Philden R-407-1 aspiración (1.230€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_e402',
      name: 'Philden E-402',
      subtitle: 'Aspiración Industrial 220 m³/h',
      category: 'cadcam',
      price: 1390,
      financing: null,
      description:
          'Sistema de aspiración industrial ultrasilencioso para laboratorio. 220 m³/h, solo 53 dB. Mayor potencia y menor ruido que el R-407-1. Ideal para laboratorios con alta producción de fresado en seco.',
      features: [
        'Caudal industrial 220 m³/h',
        'Ultrasilencioso 53 dB',
        'Mayor potencia disponible',
        'Para laboratorio profesional',
        'Compatible todas fresadoras',
        'Filtración de alta eficiencia',
      ],
      imageAsset: 'assets/products/philden_e402.png',
      badge: 'Industrial',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Philden E-402 aspiración industrial (1.390€). ¿Podéis darme más información?',
    ),

    // ─── CAD/CAM – PACK VELTZ ─────────────────────────────────────────────────

    Product(
      id: 'pack_veltz',
      name: 'Pack Veltz',
      subtitle: 'Kit Completo Horno Inyección',
      category: 'cadcam',
      price: 6300,
      financing: '60 meses · desde 105 €/mes',
      description:
          'Pack promocional Veltz completo para horno de inyección. Incluye 100 conos de soporte, 50 pins, kit de limpieza y 3 años de garantía. Todo lo necesario para empezar con inyección cerámica al mejor precio.',
      features: [
        '100 conos de soporte incluidos',
        '50 pins de laboratorio',
        'Kit de limpieza completo',
        'Garantía extendida 3 años',
        'Control PID de precisión',
        'Temperatura máx. 1.200°C',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: 'Pack Completo',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Pack Veltz (6.300€). ¿Podéis darme más información?',
    ),

  ];

  static List<Product> byCategory(String categoryId) {
    if (categoryId == 'all') return products;
    return products.where((p) => p.category == categoryId).toList();
  }

  static List<Product> get featured =>
      products.where((p) => p.isFeatured).toList();

  static List<Product> search(String query) {
    final q = query.toLowerCase();
    return products
        .where((p) =>
            p.name.toLowerCase().contains(q) ||
            p.description.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q) ||
            (p.subtitle?.toLowerCase().contains(q) ?? false))
        .toList();
  }
}

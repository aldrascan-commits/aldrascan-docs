import '../models/product.dart';

class ProductData {
  static const List<Product> products = [

    // ═══════════════════════════════════════════════════════════════════════
    // ESCÁNERES INTRAORALES – CORE BUSINESS (desde 5.900€)
    // ═══════════════════════════════════════════════════════════════════════

    Product(
      id: 'medit_i600',
      name: 'Medit i600',
      category: 'scanner',
      price: 5900,
      financing: '12 meses sin intereses',
      monthlyFee: 98,
      roi: '12 meses',
      description:
          'Escáner intraoral de iniciación premium. Oferta estrella Expodental 2026. '
          'Alta precisión con tecnología de escaneo continuo. Ahorra un 70% vs competencia (avg 20k).',
      features: [
        '35 FPS – Vídeo fluido',
        '245g – Ultraligero',
        '12 meses sin intereses',
        'Financiación 60m: 98 €/mes',
        'ROI amortizado en 12 meses',
        'Garantía 3 años',
        'Demo gratis + instalación',
        'Formación incluida',
        'Envío en 24h',
      ],
      imageUrl: 'medit_i600_b.png',
      badge: 'Oferta Estrella',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Medit i600 – oferta Expodental 2026',
    ),

    Product(
      id: 'panda_smart',
      name: 'Panda Smart',
      category: 'scanner',
      price: 6900,
      financing: '60 meses',
      monthlyFee: 115,
      roi: '12 meses',
      description:
          'Escáner intraoral ultraligero de solo 138g. Incluye PC de alto rendimiento. '
          'Tecnología USB-C plug & play, sin instalación compleja. '
          'El más ligero del mercado, ideal para clínicas con alta rotación de pacientes.',
      features: [
        '138g – El más ligero del mercado',
        '35 FPS – Escaneo fluido',
        'USB-C Plug & Play',
        'PC de alto rendimiento incluido',
        'Financiación 60m: 115 €/mes',
        'ROI amortización 12 meses',
        'Calibración automática',
        'Demo gratis disponible',
      ],
      imageUrl: 'panda_smart.png',
      badge: 'Ultraligero 138g',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Panda Smart – oferta Expodental 2026',
    ),

    Product(
      id: 'medit_i700',
      name: 'Medit i700 / i700w',
      category: 'scanner',
      price: 8500,
      financing: '60 meses',
      monthlyFee: 142,
      roi: '10-15 meses',
      description:
          'Velocidad profesional con 70 FPS (el doble que el i600). '
          'Disponible en versión inalámbrica i700w. Precisión 10.9μm. '
          'La opción ideal para clínicas con volumen medio-alto de trabajo.',
      features: [
        '70 FPS – 2x más rápido que i600',
        'Precisión 10.9μm profesional',
        'Opción wireless i700w disponible',
        'UV-C LED integrado',
        'Financiación 60m: 142 €/mes',
        'ROI 10-15 meses',
        'Garantía 3 años',
        'Stock limitado en feria',
      ],
      imageUrl: 'medit_i700.png',
      badge: 'Oferta Core',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Medit i700/i700w – oferta Expodental 2026',
    ),

    Product(
      id: 'medit_i900_classic',
      name: 'Medit i900 Classic',
      category: 'scanner',
      price: 12900,
      financing: '60 meses',
      monthlyFee: 215,
      roi: '12 meses',
      description:
          'Máxima precisión con portátil MacBook Air M4 incluido. '
          'Tecnología FlexScan con luz estroboscópica. FOV 100x más grande. '
          'Pack completo para clínicas de alta exigencia con implantología.',
      features: [
        '70 FPS – FlexScan / Luz estroboscópica',
        'FOV 100x más grande',
        'Precisión 10.9μm',
        '268g – Diseño equilibrado',
        'MacBook Air M4 incluido',
        '12 ScanBodys de regalo',
        'Financiación 60m: 215 €/mes',
        'Stock inmediato',
        'Garantía 3 años',
      ],
      imageUrl: 'medit_i900_classic.png',
      badge: 'Portátil incluido',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Medit i900 Classic – oferta Expodental 2026',
    ),

    Product(
      id: 'aoralscan_elf',
      name: 'Aoralscan Elf',
      category: 'scanner',
      price: 9900,
      financing: '60 meses',
      monthlyFee: 165,
      roi: '10 meses',
      description:
          'Escáner intraoral premium de 106g. El líder en ergonomía. '
          'Tecnología IntelliBite. 3 puntas incluidas. '
          'Software gratuito, envío inmediato. El más ligero de alta gama. ¡Novedad Expodental 2026!',
      features: [
        '106g – Peso pluma (líder ergonomía)',
        'Tecnología IntelliBite',
        '3 puntas: 19x14 / 16x12 / 12x9mm',
        'Dimensiones 245x27x30mm',
        'Producción 12-18 uds/mes',
        'Financiación 60m: 165 €/mes',
        'ROI 10 meses',
        'Software gratuito incluido',
        'Envío inmediato',
      ],
      imageUrl: 'aoralscan_elf.png',
      badge: '¡Novedad!',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Aoralscan Elf – novedad Expodental 2026',
    ),

    Product(
      id: 'aoralscan_elite_scanbody',
      name: 'Aoralscan Elite + Kit ScanBody',
      category: 'scanner',
      price: 13900,
      savings: '2.000€ + Kit incluido',
      financing: '60 meses',
      monthlyFee: 232,
      roi: '8-12 meses',
      description:
          'Escáner Shining 3D de fotogrametría IPG 2 en 1. '
          'Kit ScanBody de regalo (valor 2.000€). Precio sin kit: 15.900€. '
          'Escaneo IA + movimiento, autoclave 100x ciclos. El más vendido Shining 3D.',
      features: [
        'Tecnología IPG 2 en 1 + Fotogrametría',
        'Sistema de alta precisión: campo 19x14mm',
        '124g – Ultraligero',
        'Kit ScanBody de regalo (valor 2.000€)',
        'Escaneo IA + Movimiento',
        'Autoclave 100x ciclos',
        'Financiación 60m: 232 €/mes',
        'ROI 8-12 meses',
        'El más vendido de Shining 3D',
      ],
      imageUrl: 'aoralscan_elite_scanbody.png',
      badge: 'Kit ScanBody regalo',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Aoralscan Elite + Kit ScanBody – Expodental 2026',
    ),

    // ═══════════════════════════════════════════════════════════════════════
    // PACKS ALL-IN-ONE (desde 13.900€)
    // ═══════════════════════════════════════════════════════════════════════

    Product(
      id: 'pack_medit_i900',
      name: 'Pack Medit i900: Todo en Uno',
      category: 'pack',
      price: 13900,
      financing: '60 meses',
      monthlyFee: 232,
      roi: '8-12 meses',
      description:
          'Estación de trabajo digital completa y lista para usar. '
          'BEST SELLER Expodental 2026. Precio especial feria 2026. '
          'Todo incluido: escáner + Mac Mini + pantalla 24" + mueble. Garantía oficial 3 años.',
      features: [
        'Medit i900 – Escáner top de gama',
        'Mac Mini M2 incluido',
        'Pantalla 24" Acer incluida',
        'Teclado y ratón incluidos',
        'Carro clínico premium',
        'Financiación 60m: 232 €/mes',
        'ROI 8-12 meses',
        'Garantía 3 años',
        'Instalación y formación incluidas',
        'Envío inmediato',
      ],
      imageUrl: 'pack_medit_i900.png',
      badge: 'Best Seller',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Pack Medit i900 Todo en Uno – Expodental 2026',
    ),

    Product(
      id: 'medit_i900_mobility',
      name: 'Medit i900 Mobility',
      category: 'scanner',
      price: 13900,
      financing: '24 meses sin intereses',
      monthlyFee: 580,
      roi: '12 meses',
      description:
          'El escáner intraoral 100% inalámbrico más avanzado del mercado. '
          'Batería integrada para máxima libertad de movimiento. '
          'Precisión 5 µm de clase mundial. Vista extendida 20 mm para casos implantológicos. '
          'Incluye iPad Pro o MacBook: elige tu dispositivo preferido.',
      features: [
        '100% inalámbrico – Batería integrada',
        'Precisión 5 µm – Clase mundial',
        'Vista extendida 20 mm (FOV ampliado)',
        'iPad Pro o MacBook incluido – Tú eliges',
        '24 meses sin intereses',
        'Anti-empañamiento avanzado',
        '70 FPS – FlexScan luz estroboscópica',
        'Diseño ergonómico 317g',
        'Garantía 3 años oficial Medit',
        'Instalación y formación incluidas',
      ],
      imageUrl: 'medit_i900_mobility.png',
      badge: 'iPad Pro o MacBook',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Medit i900 Mobility',
      whatsappNumber: '34662078540',
    ),

    Product(
      id: 'pack_aldrascan_pro',
      name: 'Pack AldraScan Pro',
      category: 'pack',
      price: 39900,
      savings: 'Ahorras 10.100€ (PVP 50k)',
      financing: '60 meses',
      monthlyFee: 665,
      roi: null,
      description:
          'Solución clínica total. Flujo digital completo: Medit i900 + ClinicCAD (diseño IA) + Fresadora 5 ejes. '
          'Sin provisionales. Sin segundas citas. Sin esperas. '
          'Producción 40-60 coronas/mes. TOP VENTAS. Instalación y formación incluida.',
      features: [
        'Medit i900 – Escáner top',
        'ClinicCAD – Diseño con IA',
        'Fresadora 5 ejes',
        'Producción 40-60 coronas/mes',
        'Ahorras 10.100€ vs PVP (50k)',
        'Financiación 60m: 665 €/mes',
        'Formación in-situ incluida',
        'Soporte VIP 24/7',
        'Instalación profesional',
        'Sin provisionales ni segundas citas',
      ],
      imageUrl:
          'pack_aldrascan_pro.png',
      badge: 'Top Ventas',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Pack AldraScan Pro – oferta Expodental 2026',
    ),

    // ═══════════════════════════════════════════════════════════════════════
    // HIGH TECH – CBCT / RAYOS X (desde 27.700€)
    // ═══════════════════════════════════════════════════════════════════════

    Product(
      id: 'rayscan_alpha_3d',
      name: 'Rayscan Alpha 3D',
      category: 'cbct',
      price: 27700,
      financing: '60 meses',
      monthlyFee: 462,
      roi: '9-14 meses',
      description:
          'CBCT Premium con tecnología inteligente. Líder en diagnóstico 3D. '
          'FOV variable ø50-ø170mm. IA para reducción de artefactos. '
          'Producción 35-60 estudios/mes. Certificado CE. Baja dosis ultra.',
      features: [
        'FOV variable ø50-ø170mm',
        'Tecnología IA – Reducción artefactos',
        'Resolución 70μm-400μm',
        'Velocidad: Recon 8 seg / Scan 1 seg',
        'Radiografía Pano+Ceph incluida',
        'Baja dosis ultra – Certificado CE',
        'Producción 35-60 estudios/mes',
        'Financiación 60m: 462 €/mes',
        'Amortización 9-14 meses',
        'CBCT Premium Inteligente',
      ],
      imageUrl: 'rayscan_alpha_3d.png',
      badge: 'Oferta Premium',
      isFeatured: true,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Rayscan Alpha 3D – Expodental 2026',
    ),

    Product(
      id: 'meyer_3d_13x10',
      name: 'Meyer 3D 13×10',
      category: 'cbct',
      price: 29900,
      financing: '60 meses',
      monthlyFee: 498,
      roi: '10-15 meses',
      description:
          'CBCT de alta resolución. Opción líder calidad/precio. '
          'FOV 13x10 cm con variantes 12x10, 15x10, 17x11. '
          'Software 3D incluido. Producción 30-50 CBCT/mes.',
      features: [
        'FOV 13x10 cm (var: 12x10, 15x10, 17x11)',
        'Resolución HD alta definición',
        'Velocidad 12-20 seg (Rapid/HD)',
        'Software diagnóstico 3D incluido',
        'Radiografía Pano + Modos Extra',
        'Baja dosis – Seguridad paciente',
        'Producción 30-50 CBCT/mes',
        'Financiación 60m: 498 €/mes',
        'Amortización 10-15 meses',
      ],
      imageUrl: 'meyer_3d_13x10.png',
      badge: 'Calidad/Precio',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Meyer 3D 13x10 – Expodental 2026',
    ),

    // ═══════════════════════════════════════════════════════════════════════
    // FRESADORAS & LABORATORIO DIGITAL
    // ═══════════════════════════════════════════════════════════════════════

    Product(
      id: 'lilivis_mill_lm100',
      name: 'Lilivis Mill LM-100',
      category: 'fresadora',
      financing: 'Consultar condiciones Expodental',
      description:
          'Fresadora dental doble 3 ejes (Wet & Dry). Fresa 2 restauraciones simultáneas. '
          'DualCraft Tech: ahorro del 50% en tiempo. Sin compresor externo. '
          'Integración L-CAM + monitoreo remoto. Aplicaciones: coronas, inlays, carillas, puentes.',
      features: [
        'Dual 3 Axis simultáneo',
        '4 motores / 50.000 rpm',
        'Repetibilidad ±25μm',
        '8-15 min/pieza',
        'Materiales: Disilicato, Híbrida, Zirconia',
        'Pantalla táctil LCD 7"',
        'Compacta ≤69dB – Sin compresor',
        'DualCraft Tech: 2 piezas simultáneas',
        'Monitoreo remoto incluido',
        'Unidades limitadas feria',
      ],
      imageUrl: 'lilivis_mill_lm100.png',
      badge: 'Expodental',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa la Lilivis Mill LM-100 – Expodental 2026',
    ),

    Product(
      id: 'deprag_w4',
      name: 'DEPRAG W4',
      category: 'fresadora',
      price: 17500,
      financing: '60 meses',
      monthlyFee: 292,
      description:
          'Fresadora 4 ejes especializada en cerámica vítrea. Auto-calibración -15% desperdicio. '
          'Capacidad para 20 bloques. Control LCD 19.5" con Windows 10. Precio especial feria.',
      features: [
        '4 ejes – Wet Milling',
        '2.5kW / 60.000 rpm',
        'Precisión 0.01mm / 5μm',
        'Capacidad 20 bloques',
        'Materiales: Cerámica / PMMA',
        'Control LCD 19.5" Win10',
        'Auto-calibración: -15% desperdicio',
        'Financiación 60m: 292 €/mes',
        'Precio especial feria',
        'Unidades limitadas',
      ],
      imageUrl: 'deprag_w4.png',
      badge: 'Precio Feria',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa la DEPRAG W4 – Expodental 2026',
    ),

    Product(
      id: 'philden_x500',
      name: 'Philden X500 Híbrida',
      category: 'fresadora',
      price: 31900,
      savings: 'Ahorras 12.633€ (PVP 43.778€)',
      description:
          'La mejor oferta en fresadora de alta producción. -28% descuento Expodental. '
          'Sistema húmedo/seco elite híbrida. 40-80 coronas/día. '
          'Alta versatilidad para producción industrial. Disponibilidad limitada.',
      features: [
        'Sistema Húmedo/Seco – Elite Híbrida',
        'Producción 40-80 coronas/día',
        '-28% descuento Expodental',
        'Ahorras 12.633€ vs PVP (43.778€)',
        'Máxima versatilidad y producción',
        'Trabajo 24/7 continuo',
        'Alta producción industrial',
        'Unidades muy limitadas',
      ],
      imageUrl: 'philden_x500.png',
      badge: 'Mejor Oferta -28%',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa la Philden X500 Híbrida – Expodental 2026',
    ),

    Product(
      id: 'pack_laboratorio_digital',
      name: 'Pack Laboratorio Digital',
      category: 'pack',
      price: 29900,
      savings: 'Ahorras +9.000€',
      description:
          'Del diseño digital al producto final en tu clínica. '
          'Pack completo: Lilivis Mill LM-100 + Horno Sinterizado DUOTRON T-3200 + Impresora 3D ELEGOO Mars 5. '
          'Solo oferta Expodental o hasta fin de stock. +500€ en materiales de regalo.',
      features: [
        'Lilivis Mill LM-100 – Fresadora',
        'DUOTRON T-3200 – Horno sinterizado',
        'ELEGOO Mars 5 – Impresora 3D LCD 4K',
        'Flujo completo: fresado + sinterizado + 3D',
        '+500€ en materiales de fresado e impresión',
        'Ahorras +9.000€ vs compra individual',
        'Solo válido en Expodental 2026',
        'Disponibilidad sujeta a stock',
      ],
      imageUrl:
          'pack_aldrascan_pro.png',
      badge: 'Ahorra +9.000€',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Pack Laboratorio Digital – Expodental 2026',
    ),

    // ═══════════════════════════════════════════════════════════════════════
    // SILLONES DENTALES
    // ═══════════════════════════════════════════════════════════════════════

    Product(
      id: 'cingol_x1',
      name: 'Cingol X1',
      category: 'sillon',
      price: 6290,
      description:
          'Unidad dental completa certificada ISO. Mejor valor del mercado. '
          'Sistema T-Master para gestión digital integral. '
          'Estructura robusta 275kg + tapicería PU. Equipamiento full incluido.',
      features: [
        'Certificado ISO',
        'Sistema T-Master – Gestión digital',
        'Estructura robusta 275kg',
        'Tapicería PU de alta calidad',
        'Scaler + pieza de mano + lámpara LED',
        'Equipamiento full incluido',
        'Soporte técnico post-venta',
      ],
      imageUrl: 'cingol_x1.png',
      badge: 'Mejor Valor',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Cingol X1 – Expodental 2026',
    ),

    Product(
      id: 'luvis_chair',
      name: 'Luvis Chair',
      category: 'sillon',
      financing: 'Consultar precio feria',
      description:
          'Sillón dental premiado con Red Design Award y Good Design Award. '
          'Exclusivo en AldraScan. Iluminación premium LED (50k-130k lux). '
          'Control táctil avanzado con sensores de obstáculos y aviso de dolor.',
      features: [
        'Red Design Award + Good Design Award',
        'Iluminación LED C700 (50k lux) / S300 (130k lux)',
        'Mesa motorizada incluida',
        '11 colores disponibles',
        'Panel táctil avanzado',
        'Sensores de obstáculos y aviso dolor',
        'Exclusiva en AldraScan',
        'Disponibilidad sujeta a stock feria',
      ],
      imageUrl: 'luvis_chair.png',
      badge: 'Exclusiva',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el Luvis Chair – Expodental 2026',
    ),

    // ═══════════════════════════════════════════════════════════════════════
    // HORNO / SINTERIZADO
    // ═══════════════════════════════════════════════════════════════════════

    Product(
      id: 'duotron_horno',
      name: 'DUOTRON Horno Sinterizado',
      category: 'fresadora',
      price: 4300,
      savings: 'Antes 5.620€ – Ahorras 1.320€',
      financing: '60 meses',
      monthlyFee: 72,
      description:
          'Horno de sinterizado y cerámica inyección. '
          'Incluye bomba de vacío de alto rendimiento y bandejas de cocción. '
          'Kit de materiales de regalo. Control automático multi-trabajo. '
          'Ahorra 1.320€ vs precio normal.',
      features: [
        'Cerámica + Inyección',
        'Bomba de vacío incluida',
        'Bandejas de cocción incluidas',
        'Kit materiales de regalo',
        'Control automático multi-trabajo',
        'Garantía premium',
        'Antes 5.620€ – Ahorro 1.320€',
        'Financiación 60m: 72 €/mes',
        'Unidades limitadas',
      ],
      imageUrl: 'duotron_horno.png',
      badge: 'Ahorra 1.320€',
      isFeatured: false,
      isExpodental: true,
      whatsappMessage: 'Hola, me interesa el DUOTRON Horno – Expodental 2026',
    ),
  ];

  // ── Filtros ──────────────────────────────────────────────────────────────

  static List<Product> byCategory(String categoryId) {
    if (categoryId == 'all') return products;
    return products.where((p) => p.category == categoryId).toList();
  }

  static List<Product> get featured =>
      products.where((p) => p.isFeatured).toList();

  static List<Product> get expodental =>
      products.where((p) => p.isExpodental).toList();

  static List<Product> search(String query) {
    final q = query.toLowerCase();
    return products
        .where((p) =>
            p.name.toLowerCase().contains(q) ||
            p.description.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q))
        .toList();
  }

  /// Top 3 Ofertas Estrella Expodental
  static List<Product> get topOffers => [
    products.firstWhere((p) => p.id == 'medit_i600'),
    products.firstWhere((p) => p.id == 'pack_medit_i900'),
    products.firstWhere((p) => p.id == 'pack_aldrascan_pro'),
  ];
}

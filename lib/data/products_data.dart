import '../models/product.dart';

class ProductData {
  static const List<Product> products = [

    // ══════════════════════════════════════════════════════════════════════════
    // 1. ESCÁNERES INTRAORALES — ordenados de gama alta a iniciación
    //    → Sin precio visible. CTA único: "Solicita Oferta"
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'medit_i900_mobility',
      name: 'Medit i900 Mobility',
      subtitle: 'Top de gama · 100% inalámbrico · iPad Pro de regalo',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          '100% inalámbrico con batería integrada. El escáner más avanzado del mercado: 70 FPS, FOV 100x ampliado y solo 317g con batería. iPad Pro incluido de regalo. 12 ScanBodys de regalo. La libertad total en el escaneo.',
      features: [
        '100% inalámbrico con batería integrada',
        'iPad Pro incluido de regalo',
        'Velocidad hasta 70 FPS',
        'FOV ampliado 100x más grande',
        'Ultraligero 317g con batería',
        '12 ScanBodys de regalo',
        'Configuración Apple incluida',
        'Soporte clínico especializado',
      ],
      imageAsset: 'assets/products/medit_i900_mobility_real.png',
      badge: 'Top de Gama',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i900 Mobility con iPad Pro. ¿Podéis darme más información y precio?',
    ),

    Product(
      id: 'medit_i900_classic',
      name: 'Medit i900 Classic+',
      subtitle: 'Precisión absoluta · MacBook Air M4 de regalo',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          'El buque insignia cableado de Medit. 70 FPS, FOV 100x más grande y precisión 10,9 µm. Incluye MacBook Air M4 de regalo. 12 ScanBodys incluidos para usuarios AldraScan.',
      features: [
        'Hasta 70 FPS con Medit Flexscan',
        'FOV 100x más grande',
        'Precisión 10,9 µm',
        'Peso ultraligero 268g',
        'MacBook Air M4 de regalo',
        '12 ScanBodys incluidos',
        'Garantía oficial 3 años',
      ],
      imageAsset: 'assets/products/medit_i900_classic_real.png',
      badge: 'MacBook Air M4',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i900 Classic+ con MacBook Air M4. ¿Podéis darme más información y precio?',
    ),

    Product(
      id: 'aoralscan_elite_scanbody',
      name: 'Aoralscan Elite + Kit ScanBody',
      subtitle: 'Más vendido Shining3D · Kit ScanBody de regalo',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          'Tecnología IPG 2 en 1 con fotogrametría integrada. Kit ScanBody valorado en 2.000€ incluido de regalo. Alta precisión con campo 19x14mm y solo 124g. El preferido para implantología digital.',
      features: [
        'Tecnología IPG 2 en 1 + Fotogrametría',
        'Kit ScanBody incluido (valor 2.000€)',
        'Alta Precisión campo 19x14mm',
        'Ultraligero 124 gramos',
        'Escaneo IA + Motion',
        'Autoclave 100 ciclos certificado',
        'Amortización 8-12 meses',
      ],
      imageAsset: 'assets/products/aoralscan_elite_scanbody.png',
      badge: 'Kit ScanBody Regalo',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Aoralscan Elite + Kit ScanBody. ¿Podéis darme más información y precio?',
    ),

    Product(
      id: 'aoralscan_elf',
      name: 'Aoralscan Elf',
      subtitle: 'El más ligero del mercado · 106g',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          'El escáner intraoral más ligero del mundo con solo 106 gramos. Tecnología IntelliBite de Shining3D. 3 puntas incluidas para máxima versatilidad clínica.',
      features: [
        'Peso pluma — solo 106 gramos',
        'Tecnología IntelliBite (Shining3D)',
        '3 puntas incluidas (19×14 / 16×12 / 12×9 mm)',
        'Dimensiones 245×27×30 mm',
        'Software gratuito incluido',
        'Envío inmediato disponible',
      ],
      imageAsset: 'assets/products/aoralscan_elf_new.png',
      badge: 'Ultra Ligero 106g',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Aoralscan Elf (106g). ¿Podéis darme más información y precio?',
    ),

    Product(
      id: 'medit_i700',
      name: 'Medit i700 / i700w',
      subtitle: 'Velocidad profesional · 70 FPS · Versión wireless disponible',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          'El doble de velocidad que el i600 con 70 FPS y precisión profesional de 10,9 µm. Disponible también en versión wireless i700w. Desinfección UV-C integrada.',
      features: [
        'Velocidad 70 FPS (2× vs i600)',
        'Precisión 10,9 µm profesional',
        'Versión wireless i700w disponible',
        'LED UV-C desinfección integrada',
        'Garantía oficial 3 años',
        'Formación clínica incluida',
      ],
      imageAsset: 'assets/products/medit_i700_real.png',
      badge: '70 FPS Wireless',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i700 / i700w. ¿Podéis darme más información y precio?',
    ),

    Product(
      id: 'panda_smart',
      name: 'Panda Smart',
      subtitle: 'Iniciación inteligente · 138g · PC incluido',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          'El escáner ultraligero con solo 138 gramos que incluye PC de alto rendimiento. USB-C Plug & Play, calibración automática y tecnología Motion. La puerta de entrada al escaneo digital sin complicaciones.',
      features: [
        'Ultraligero 138g — sin fatiga en jornada',
        'PC de alto rendimiento incluido',
        'Conexión USB-C Plug & Play',
        'Calibración automática',
        'Escaneo fluido 35 FPS',
        'Botón Motion integrado',
      ],
      imageAsset: 'assets/products/panda_smart.png',
      badge: 'PC Incluido',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Panda Smart (138g + PC incluido). ¿Podéis darme más información y precio?',
    ),

    Product(
      id: 'medit_i600',
      name: 'Medit i600',
      subtitle: 'La entrada al flujo digital · Amortización 12 meses',
      category: 'scanner',
      price: null,
      financing: 'Solicita Oferta',
      description:
          'El escáner ideal para clínicas que dan el primer paso a la odontología digital. Alta precisión, 35 FPS y solo 245g. La relación calidad-precio más equilibrada del catálogo.',
      features: [
        'Velocidad 35 FPS de vídeo',
        'Ultraligero 245 gramos',
        'Plug & Scan — fácil uso inmediato',
        'Garantía oficial 3 años',
        'Envío en 24h garantizado',
        'Formación clínica incluida',
      ],
      imageAsset: 'assets/products/medit_i600.png',
      badge: 'Oferta Estrella',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Medit i600. ¿Podéis darme más información y precio?',
    ),

    // ══════════════════════════════════════════════════════════════════════════
    // 2. PACKS TODO EN UNO — soluciones completas de mayor a menor precio
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'pack_aldrascan_pro',
      name: 'Pack AldraScan Pro',
      subtitle: 'Solución clínica total · Escaneo + Diseño IA + Fresado',
      category: 'pack',
      price: 39900,
      financing: '60 meses · desde 665 €/mes',
      description:
          'La solución más completa del mercado. Medit i900 + Software ClinicCAD con IA + Fresadora 5 ejes. Produce 40-60 coronas/mes. Flujo completo: escaneo 90 min + fresado 90 min. Ahorra 10.100€ vs PVP.',
      features: [
        'Medit i900 — escáner top de gama',
        'ClinicCAD — Diseño con IA integrada',
        'Fresadora 5 ejes incluida',
        '40-60 coronas por mes',
        'Sin provisionales · Sin segundas citas',
        'Instalación VIP incluida',
        'Formación clínica completa',
        'Ahorra 10.100€ vs PVP 50.000€',
      ],
      imageAsset: 'assets/products/pack_aldrascan_pro.png',
      badge: 'Top Ventas',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Pack AldraScan Pro (39.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'pack_laboratorio_digital',
      name: 'Pack Laboratorio Digital',
      subtitle: 'Fresado + Sinterizado + Impresión 3D · Todo incluido',
      category: 'pack',
      price: 29900,
      financing: '60 meses · consultar cuota',
      description:
          'Del diseño digital al producto final. Pack completo 3 etapas: Lilivis Mill LM-100 (fresadora) + Duotron T-3200 (sinterizado) + Elegoo Mars 5 (impresión 3D). Ahorra +9.000€. Solo oferta Expodental.',
      features: [
        'Lilivis Mill LM-100 — Fresadora Dual 3 Ejes',
        'Duotron T-3200 — Sinterizado Máx. 1.100°C',
        'Elegoo Mars 5 — Impresión 3D LCD Mono 4K',
        '+500€ en materiales incluidos',
        'Flujo completo en clínica',
        'Ahorra +9.000€ vs compra separada',
        'Solo disponible en feria / fin de stock',
      ],
      imageAsset: 'assets/products/pack_laboratorio_digital.png',
      badge: 'Oferta Expodental',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Pack Laboratorio Digital (29.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'pack_medit_i900_todo',
      name: 'Pack Medit i900',
      subtitle: 'Todo en Uno · Best Seller · Mac Mini + Pantalla + Mueble',
      category: 'pack',
      price: 13900,
      financing: '60 meses · desde 232 €/mes',
      description:
          'Precio especial feria 2026. Pack profesional completo: Medit i900 + Mac Mini + Pantalla 24" + Mueble clínico. Instalación, envío inmediato y formación incluidos. Garantía oficial AldraScan.',
      features: [
        'Medit i900 — escáner profesional',
        'Mac Mini última generación',
        'Pantalla 24" Touch incluida',
        'Mueble clínico integrado',
        'Garantía oficial 3 años',
        'Instalación incluida',
        'Formación clínica completa',
        'Envío inmediato',
      ],
      imageAsset: 'assets/products/pack_medit_i900.png',
      badge: 'Oferta Estrella',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Pack Medit i900 Todo en Uno (13.900€). ¿Podéis darme más información?',
    ),

    // ══════════════════════════════════════════════════════════════════════════
    // 3. CBCT 3D — diagnóstico por imagen
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'meyer_3d_13x10',
      name: 'Meyer 3D 13×10',
      subtitle: 'CBCT Líder Calidad/Precio · FOV 13×10 cm',
      category: 'cbct',
      price: 29900,
      financing: '60 meses · desde 498 €/mes',
      description:
          'CBCT panorámico 3D Alta Resolución HD con campo de visión 13×10 cm. La opción líder calidad/precio. Radiografía Pano + modos extra. Baja dosis y seguridad para el paciente. Amortización 10-15 meses.',
      features: [
        'Campo de visión 13×10 cm FOV',
        'Resolución Alta Definición HD',
        'Software 3D de diagnóstico incluido',
        'Velocidad de escaneo rápida',
        'Radiografía Pano + Modos Extra',
        'Baja dosis — seguridad paciente',
        'Producción 30-50 CBCT/mes',
        'Amortización 10-15 meses',
      ],
      imageAsset: 'assets/products/meyer_cbct.png',
      badge: 'Líder Calidad/Precio',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Meyer 3D 13x10 (29.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'rayscan_3d',
      name: 'Rayscan Alpha 3D',
      subtitle: 'CBCT Premium con IA · FOV variable hasta ø170 mm',
      category: 'cbct',
      price: 29900,
      financing: '60 meses · desde 498 €/mes',
      description:
          'CBCT premium con IA integrada y la mayor versatilidad del mercado. FOV variable ø50-ø170mm, Vóxel 70-400µm. Reconstrucción en 8 seg, escaneo en 1 seg. Pano + Ceph incluidos.',
      features: [
        'FOV variable ø50-ø170mm',
        'IA — filtros Smart antiartefactos',
        'Alta definición Vóxel 70 µm - 400 µm',
        'Reconstrucción 8 seg / Escaneo 1 seg',
        'Pano + Ceph modalidades incluidas',
        'Ultra baja dosis — Certificado CE',
        'Producción 35-60 estudios/mes',
      ],
      imageAsset: 'assets/products/rayscan_alpha.png',
      badge: 'IA Integrada',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Rayscan Alpha 3D (29.900€). ¿Podéis darme más información?',
    ),

    // ══════════════════════════════════════════════════════════════════════════
    // 4. FRESADORAS CAD/CAM — de alto rendimiento a iniciación
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'philden_x500',
      name: 'Philden X500 Híbrida',
      subtitle: 'Elite Húmedo + Seco · Alta producción 40-80 coronas/día',
      category: 'fresadora',
      price: 31900,
      financing: 'Consultar financiación',
      description:
          'La fresadora más avanzada de Philden. Sistema Húmedo y Seco en una sola máquina, alta producción industrial de 40-80 coronas/día. Ahorra 12.633€ (-28% vs PVP 43.778€).',
      features: [
        'Sistema Húmedo + Seco combinado',
        'Alta producción 40-80 coronas/día',
        'Versatilidad total de materiales',
        'Alta producción industrial',
        'Ahorra 12.633€ vs PVP',
        '-28% descuento feria',
      ],
      imageAsset: 'assets/products/philden_x500.png',
      badge: 'Mejor Oferta',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden X500 Híbrida (31.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'deprag_d5_max',
      name: 'Deprag D5 MAX',
      subtitle: 'Producción masiva 24/7 · 8 discos automáticos',
      category: 'fresadora',
      price: 20900,
      financing: '60 meses · desde 348 €/mes',
      description:
          'La fresadora de producción masiva con 8 discos automáticos y 10 herramientas. 5 ejes, 520 kg, funcionamiento 24/7. Para laboratorios de alto volumen que exigen máxima fiabilidad.',
      features: [
        '8 discos automáticos',
        'Producción masiva 24/7',
        '5 ejes — 10 herramientas',
        'Peso industrial 520 kg',
        'Máxima fiabilidad',
        'Ideal laboratorio alto volumen',
      ],
      imageAsset: 'assets/products/deprag_w4.png',
      badge: '8 Discos Auto',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Deprag D5 MAX (20.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'deprag_d5_afe',
      name: 'Deprag D5 AFE',
      subtitle: 'Fresado seco · Sin compresor · Airless',
      category: 'fresadora',
      price: 19900,
      financing: '60 meses · desde 332 €/mes',
      description:
          'Fresadora Deprag 5 ejes con tecnología Airless (sin compresor). 10 herramientas automáticas. Fresado en seco de alta precisión para laboratorio y clínica digital avanzada.',
      features: [
        '5 ejes de alta precisión',
        '10 herramientas automáticas',
        'Sin compresor — tecnología Airless',
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
      id: 'philden_adc500',
      name: 'Philden ADC-500',
      subtitle: 'Automática · Cargador 10 discos · Producción 24/7',
      category: 'fresadora',
      price: 17990,
      financing: '60 meses · desde 300 €/mes',
      description:
          'Fresadora automática con cargador de 10 discos para producción continua 24/7. 5 ejes, 12 herramientas y cambio automático de bloques. Máxima productividad para laboratorios de alto volumen.',
      features: [
        'Cargador automático 10 discos',
        'Producción continua 24/7',
        '5 ejes de alta precisión',
        '12 herramientas automáticas',
        'Fresado seco + software CAM',
        'Ideal laboratorio alto volumen',
      ],
      imageAsset: 'assets/products/philden_adc500.png',
      badge: 'Producción 24/7',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa la Philden ADC-500 automática (17.990€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_s410',
      name: 'Philden S410 Húmedo',
      subtitle: 'CAM Iniciación · Sistema húmedo · 15-25 coronas/día',
      category: 'fresadora',
      price: 16990,
      financing: 'Consultar financiación',
      description:
          'Sistema CAM de iniciación de Philden. Sistema húmedo compacto ideal para clínicas que comienzan en CAD/CAM. 15-25 coronas/día. Precio feria especial desde 16.990€ (antes 19.292€).',
      features: [
        'Sistema húmedo compacto',
        'Capacidad 15-25 coronas/día',
        'Nivel iniciación CAD/CAM',
        'Precio feria especial',
      ],
      imageAsset: 'assets/products/philden_s410.png',
      badge: 'Iniciación',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden S410 (16.990€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_s510',
      name: 'Philden S510 Seco',
      subtitle: 'CAM Estándar · 5 ejes · -15% OFF feria',
      category: 'fresadora',
      price: 15900,
      financing: 'Consultar financiación',
      description:
          'Fresadora CAM seca estándar de 5 ejes con electrónica Pro. 20-35 coronas/día. Precio feria 15.900€ (-15% OFF, antes 16.442€). La evolución natural desde la iniciación.',
      features: [
        '5 ejes seco',
        'Electrónica Pro',
        '20-35 coronas/día',
        '-15% OFF precio feria',
      ],
      imageAsset: 'assets/products/philden_s510.png',
      badge: '-15% OFF',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Philden S510 (15.900€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'philden_s500',
      name: 'Philden S500 Seco',
      subtitle: 'Laboratorio · 5 ejes · 12 herramientas · 60.000 rpm',
      category: 'fresadora',
      price: 13550,
      financing: '60 meses · desde 226 €/mes',
      description:
          'Fresadora de fresado seco ideal para laboratorio dental. 5 ejes, 12 herramientas automáticas, husillo 60.000 rpm. Software CAM incluido. Precisión industrial para producción diaria.',
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
      whatsappMessage: 'Hola, me interesa la Philden S500 Seco (13.550€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'deprag_w4',
      name: 'DEPRAG W4',
      subtitle: 'Fresadora 4 ejes · Cerámica vítrea · Auto-calibración',
      category: 'fresadora',
      price: 17500,
      financing: '60 meses · desde 292 €/mes',
      description:
          'Fresadora dental de 4 ejes especializada en cerámica vítrea. Precisión 0,01mm / 5µm. Sistema Wet/Tanque con 20 bloques de capacidad. Auto-calibración con -15% de desperdicio.',
      features: [
        '4 ejes de fresado',
        'Potencia 2,5 kW / 60.000 rpm',
        'Precisión 0,01mm / 5 µm',
        'Capacidad 20 bloques',
        'Sistema Wet / Tanque',
        'Materiales: Cerámica / PMMA',
        'Pantalla LCD 19,5" Windows 10',
        'Especializada en Cerámica Vítrea',
      ],
      imageAsset: 'assets/products/deprag_w4.png',
      badge: 'Precio Feria',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la DEPRAG W4 (17.500€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'lilivis_mill_lm100',
      name: 'Lilivis Mill LM-100',
      subtitle: 'Dual 3 Ejes · Húmedo y Seco · ±25 µm',
      category: 'fresadora',
      price: null,
      financing: 'Consultar oferta Expodental',
      description:
          'Fresadora dental Wet & Dry de alta precisión. Dual Spindles con 4 motores a 50.000 rpm. Precisión ±25µm. Procesa disilicato, híbrida y zirconia. Compacta y silenciosa ≤69 dB.',
      features: [
        'Dual 3 ejes simultáneo',
        '4 motores / 50.000 rpm',
        'Precisión repetibilidad ±25 µm',
        'Velocidad 8-15 min por pieza',
        'Materiales: Disilicato, Híbrida, Zirconia, PMMA',
        'Pantalla táctil LCD 7"',
        'Tamaño compacto 743×464×455 mm / 61 kg',
        'Unidades limitadas',
      ],
      imageAsset: 'assets/products/lilivis_mill.png',
      badge: 'Unidades Limitadas',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Lilivis Mill LM-100. ¿Podéis darme precio y más información?',
    ),

    // ══════════════════════════════════════════════════════════════════════════
    // 5. CAD/CAM – HORNOS SINTERIZACIÓN · de mayor a menor precio
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'kdf_plus',
      name: 'KDF Zircom Plus',
      subtitle: 'Alta Producción · 60-90 unidades · 1.600°C',
      category: 'cadcam',
      price: 15300,
      financing: '60 meses · desde 255 €/mes',
      description:
          'El horno KDF de mayor capacidad: 3 bandejas para 60-90 unidades simultáneas a 1.600°C. Para laboratorios de alta producción que necesitan máxima capacidad. Regalo 1.500€ en material.',
      features: [
        '60-90 unidades simultáneas',
        '3 bandejas gran capacidad',
        'Temperatura máx. 1.600°C',
        'Alta producción laboratorio',
        '1.500€ en material de regalo',
        'Máxima capacidad — gama KDF',
      ],
      imageAsset: 'assets/products/kdf_plus.png',
      badge: 'Alta Producción',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el KDF Zircom Plus (15.300€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'kdf_speed',
      name: 'KDF Zircom Speed',
      subtitle: 'Sinterización Rápida 90 min · Same-Day Dentistry',
      category: 'cadcam',
      price: 13890,
      financing: '60 meses · desde 232 €/mes',
      description:
          'Horno KDF con modo rápido de sinterización en solo 90 minutos. 1.600°C, 3 bandejas. Perfecto para clínicas que ofrecen restauraciones en el mismo día. Regalo 1.500€ en material.',
      features: [
        'Modo SPEED: solo 90 minutos',
        'Temperatura máx. 1.600°C',
        '3 bandejas de capacidad',
        'Same-day dentistry habilitado',
        '1.500€ en material de regalo',
        'Fabricación japonesa premium',
      ],
      imageAsset: 'assets/products/kdf_speed.png',
      badge: '90 min · 1.500€ Regalo',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el KDF Zircom Speed (13.890€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'kdf_standard',
      name: 'KDF Zircom Standard',
      subtitle: 'Fiabilidad japonesa · 1.600°C · 50 unidades',
      category: 'cadcam',
      price: 11800,
      financing: '60 meses · desde 197 €/mes',
      description:
          'Horno de sinterización japonés KDF de alta fiabilidad. 1.600°C máximo, 3 bandejas (50 unidades), fabricación japonesa de precisión. Regalo de 1.000€ en material incluido en la compra.',
      features: [
        'Temperatura máx. 1.600°C',
        '3 bandejas — 50 unidades',
        'Fabricación japonesa de precisión',
        'Alta fiabilidad garantizada',
        '1.000€ en material de regalo',
        'Garantía oficial 2 años',
      ],
      imageAsset: 'assets/products/kdf_standard.png',
      badge: '1.000€ Regalo',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el KDF Zircom Standard (11.800€). ¿Podéis darme más información?',
    ),

    Product(
      id: 'deprag_s7',
      name: 'Deprag S7 MOSI2',
      subtitle: 'Sinterización 90 min · WiFi · Control desde móvil',
      category: 'cadcam',
      price: 7500,
      financing: '60 meses · desde 125 €/mes',
      description:
          'Horno de sinterización rápida con tecnología MOSI2. Solo 90 minutos, 1.600°C, control total por WiFi y app móvil. El más avanzado tecnológicamente con conectividad desde el smartphone.',
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

    Product(
      id: 'pack_veltz',
      name: 'Pack Veltz',
      subtitle: 'Kit Completo Horno Inyección · Todo incluido',
      category: 'cadcam',
      price: 6300,
      financing: '60 meses · desde 105 €/mes',
      description:
          'Pack promocional Veltz completo para horno de inyección cerámica. Incluye 100 conos de soporte, 50 pins, kit de limpieza y garantía extendida 3 años. Todo lo necesario para empezar con inyección al mejor precio.',
      features: [
        '100 conos de soporte incluidos',
        '50 pins de laboratorio',
        'Kit de limpieza completo',
        'Garantía extendida 3 años',
        'Control PID de precisión',
        'Temperatura máx. 1.200°C',
      ],
      imageAsset: 'assets/products/veltz_horno.png',
      badge: 'Pack Completo',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Pack Veltz (6.300€). ¿Podéis darme más información?',
    ),

    // ══════════════════════════════════════════════════════════════════════════
    // 6. IMPRESORAS 3D Y HORNOS SINTERIZADO DENTAL
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'lilivis_print_lp100',
      name: 'Lilivis Print LP-100 + UV',
      subtitle: 'Impresora 3D Dental MSLA · Auto-calibración 95%',
      price: null,
      category: 'impresora',
      financing: 'Consultar condiciones Expodental',
      description:
          'Impresora 3D dental MSLA Adaptativa con sistema LSA de auto-calibración al 95%. Resolución 50µm XY, velocidad 10-30 min/trabajo. Lentes Fresnel patentadas. Incluye sistema UV de curado.',
      features: [
        'Tecnología MSLA Adaptativa',
        'Resolución 50 µm (XY) / 405 nm',
        'Sistema LSA auto-calibración 95%',
        'Velocidad 10-30 min por trabajo',
        'Plataforma 120×75×120 mm',
        'Lentes Fresnel asféricas patentadas',
        'Sistema abierto multi-materiales',
        'Software L-CAD integrado',
      ],
      imageAsset: 'assets/products/lilivis_print.png',
      badge: 'Solicitar Oferta',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa la Lilivis Print LP-100. ¿Podéis darme precio y condiciones Expodental?',
    ),

    Product(
      id: 'duotron_t3200',
      name: 'Duotron T-3200',
      subtitle: 'Horno Sinterizado · 1.100°C · Bomba vacío integrada',
      category: 'impresora',
      price: 4300,
      financing: '60 meses · desde 72 €/mes',
      description:
          'Horno de sinterizado profesional Máx. 1.100°C con bomba de vacío integrada. Ahorra 1.320€ (antes 5.620€). Ciclo 2-4 horas, cámara Ø92×66mm. Bandejas de cocción incluidas.',
      features: [
        'Temperatura máx. 1.100°C',
        'Ciclo 2-4 horas',
        'Cámara Ø92×66 mm',
        'Bomba de vacío integrada',
        'Bandejas de cocción incluidas',
        'Control automático de ciclo',
        'Ahorra 1.320€ vs PVP',
        'Kit materiales de regalo',
      ],
      imageAsset: 'assets/products/duotron_t3200.png',
      badge: 'Ahorra 1.320€',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Duotron T-3200 (4.300€). ¿Podéis darme más información?',
    ),

    // ══════════════════════════════════════════════════════════════════════════
    // 7. SILLONES DENTALES
    // ══════════════════════════════════════════════════════════════════════════

    Product(
      id: 'luvis_chair',
      name: 'Luvis Chair',
      subtitle: 'Unidad Dental Inteligente · Dentis · Alta Gama',
      category: 'sillon',
      price: null,
      financing: 'Consultar precio Expodental',
      description:
          'Unidad dental Luvis Chair de Dentis. Diseño moderno con lámpara LED integrada de alta potencia, sistema táctil de control y tapizado ergonómico de lujo. Referencia en clínicas de alto nivel.',
      features: [
        'Lámpara LED Luvis integrada de alta potencia',
        'Control táctil digital avanzado',
        'Tapizado ergonómico premium',
        'Sistema hidráulico ultra silencioso',
        'Escupidera integrada con sensor',
        'Bandeja instrumental articulada',
        'Acabados de alta calidad',
        'Garantía oficial 2 años',
      ],
      imageAsset: 'assets/products/luvis_chair.png',
      badge: 'Alta Gama',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Luvis Chair (unidad dental Dentis). ¿Podéis darme precio y más información?',
    ),

    Product(
      id: 'cingol_x1',
      name: 'Sillón Cingol X1',
      subtitle: 'Ergonómico Premium · Disponible en azul y naranja',
      category: 'sillon',
      price: null,
      financing: 'Consultar precio Expodental',
      description:
          'Sillón dental profesional Cingol X1 de diseño ergonómico y acabados premium. Tapizado de alta resistencia, sistema hidráulico silencioso y brazo articulado para máxima comodidad del paciente y del clínico.',
      features: [
        'Diseño ergonómico premium',
        'Sistema hidráulico silencioso',
        'Tapizado antibacteriano alta resistencia',
        'Brazo articulado con escupidera',
        'Panel de control digital integrado',
        'Lámpara LED de diagnóstico incluida',
        'Disponible en azul y naranja',
        'Garantía oficial 2 años',
      ],
      imageAsset: 'assets/products/sillon_x1_blue.png',
      badge: 'Oferta Expodental',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Sillón Cingol X1. ¿Podéis darme precio y más información?',
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

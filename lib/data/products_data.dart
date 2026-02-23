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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=bo36gaEjiZN5xJTck3%2FeUTqFi0pYcb3xd3GjcLAgjFN71SPOi9fMmqqQ9%2Bpton0GtYSFFe9T4B369FzG&u2=1K9H6WljXiJHzMlS&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=N3dxNbjpvTTUEADbu2Zvbl1yPYCDZCmxcPUtWeRGJr%2FmHZvDU%2BKTF2cdJlpVWu52hvfNRZKTEe0Lbaqt&u2=WkdoI6WYTpxfI2yf&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=bo36gaEjiZN5xJTck3%2FeUTqFi0pYcb3xd3GjcLAgjFN71SPOi9fMmqqQ9%2Bpton0GtYSFFe9T4B369FzG&u2=1K9H6WljXiJHzMlS&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=atWTVv1fC2Uc7EHqCfMPBCTvoAksmgPuxi9VS3b8lis1UXv5dCtcfKOaJbqjqYVz4oqXCvM5QvPMt%2FKk&u2=MnZg2yZDsju66zeT&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=RlXs3fQe7SWgFgE%2F25kwKWHd3MmzR9vHgIhGkFBEtNj8seFWubO0vZfgxGHT60W%2FZEcpdJVihTno6JCi&u2=Ai1FIiSC3%2FB8eiN0&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=RlXs3fQe7SWgFgE%2F25kwKWHd3MmzR9vHgIhGkFBEtNj8seFWubO0vZfgxGHT60W%2FZEcpdJVihTno6JCi&u2=Ai1FIiSC3%2FB8eiN0&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=atWTVv1fC2Uc7EHqCfMPBCTvoAksmgPuxi9VS3b8lis1UXv5dCtcfKOaJbqjqYVz4oqXCvM5QvPMt%2FKk&u2=MnZg2yZDsju66zeT&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=mvxJRtDLNaWkJT2yXq%2Bu87nBFu9biMYEuYjnbCQzuNywV8nb%2FIS1ksSIGCuB3bnSlDAe22mi9OeVHz9o&u2=1xI6g6xzPaGxt%2FrK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=laxNaWXPbxvT7TI4sbq7cRCZrqOQhKCcEb0O68vbGa3m%2FpJTCEE12Gm5ZTf5C9aVXPFiRJ6EzCPdu5EB&u2=FWAujCquBIDfWFcs&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=GHBGvRVYgLuzF0N%2B%2F751bGeqh73oa9qmdvOoBfwh13AUcv7PLHZ3fTv%2F51RJMxQIMs2Mundo%2BDy2x4il&u2=TIFfEbjHMjZ9PuwK&width=1024',
      badge: 'Ahorra 1.320€',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Duotron T-3200 (4.300€). ¿Podéis darme más información?',
    ),

    // ─── CBCT 3D ─────────────────────────────────────────────────────────────
    Product(
      id: 'rayscan_3d',
      name: 'Rayscan 3D',
      subtitle: 'CBCT Premium con IA',
      category: 'cbct',
      price: 27700,
      financing: '60 meses · desde 462 €/mes',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=ZofC5PbJwaD%2BYR9ImO5Yw6%2FYT0A5%2FsCbgaMQplel6%2FO51%2F9K4sQ%2FeF4yvpGPJF%2FY2tZhPz3YyNbaU1So&u2=BCHp62YnA6YmHHOH&width=1024',
      badge: 'Oferta Premium',
      isFeatured: false,
      whatsappMessage: 'Hola, me interesa el Rayscan 3D (27.700€). ¿Podéis darme más información?',
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
      imageUrl:
          'https://sspark.genspark.ai/cfimages?u1=omjwZr6HygFPxVXmFEoZdYLeaZf%2FIYUAiETqgB%2F3wZFVB84umL5fwgsr81Fq8xKWkPxwxO6mKjYIn7PX&u2=d%2FwFSlQ3iciL%2FsN%2B&width=1024',
      badge: 'Líder Calidad/Precio',
      isFeatured: true,
      whatsappMessage: 'Hola, me interesa el Meyer 3D 13x10 (29.900€). ¿Podéis darme más información?',
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

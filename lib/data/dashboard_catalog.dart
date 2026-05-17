// AUTOGENERADO desde index.html — NO EDITAR A MANO
import 'package:flutter/material.dart';

class DashboardProduct {
  final String id, name, cat, sub;
  final double coste, pvd, pvp;
  final String? asset;

  const DashboardProduct({
    required this.id, required this.name, required this.cat,
    required this.sub, required this.coste, required this.pvd,
    required this.pvp, this.asset,
  });

  double get margenPvd => coste == 0 ? 0 : (pvd - coste) / coste * 100;
  double get margenPvp => coste == 0 ? 0 : (pvp - coste) / coste * 100;
  bool   get hasImage  => asset != null;
}

class DashboardCategory {
  final String id, label, icon;
  final Color color;
  const DashboardCategory({required this.id, required this.label,
    required this.icon, required this.color});
}

class DashboardCatalog {
  static const List<DashboardCategory> categories = [
    DashboardCategory(id:'scanner', label:'Escáner intraoral', icon:'🦷', color: Color(0xFF2563EB)),
    DashboardCategory(id:'fotogram', label:'Fotogrametría', icon:'📸', color: Color(0xFF0891B2)),
    DashboardCategory(id:'xray', label:'CBCT / RX', icon:'🩻', color: Color(0xFF0F766E)),
    DashboardCategory(id:'printer', label:'Impresora 3D', icon:'🖨️', color: Color(0xFFDB2777)),
    DashboardCategory(id:'mill', label:'Fresadora', icon:'⚙️', color: Color(0xFF16A34A)),
    DashboardCategory(id:'unit', label:'Unidad dental', icon:'🪑', color: Color(0xFF9F1239)),
    DashboardCategory(id:'pack', label:'Pack', icon:'📦', color: Color(0xFFD97706)),
    DashboardCategory(id:'soft', label:'Software', icon:'💻', color: Color(0xFF6366F1)),
    DashboardCategory(id:'material', label:'Material CAD/CAM', icon:'🧱', color: Color(0xFFB91C1C)),
    DashboardCategory(id:'other', label:'Otros', icon:'🔧', color: Color(0xFF94A3B8)),
  ];

  static const Map<String, Color> brandColors = {
    'AldraScan': Color(0xFF0066FF),
    'Apple': Color(0xFF111827),
    'ClinicCAD': Color(0xFF4F46E5),
    'Medit': Color(0xFF1E40AF),
    'Panda': Color(0xFFBE185D),
    'Coxo': Color(0xFF2563EB),
    'Shining': Color(0xFF7C3AED),
    'RayScan': Color(0xFFB45309),
    'Philden': Color(0xFF0F766E),
    'Meyer': Color(0xFF0891B2),
    'NewLife': Color(0xFF7C2D12),
    'BMS': Color(0xFF854D0E),
    'Handy': Color(0xFF2563EB),
    'Cingol': Color(0xFF9F1239),
    'Puges': Color(0xFF065F46),
    'Pax': Color(0xFF4338CA),
    'Deprag': Color(0xFF0E7490),
    'DOF': Color(0xFFB91C1C),
    'Nexdent': Color(0xFF7C3AED),
    'Lilivis': Color(0xFF0F766E),
    'Vericom': Color(0xFF15803D),
    'Duotron': Color(0xFFC2410C),
  };

  // 117 productos extraídos
  static const List<DashboardProduct> products = [
    DashboardProduct(id:'meyer-img-16x18', name:'Meyer ImaGine FOV 16x18', cat:'xray', sub:'Meyer', coste:35352.0, pvd:44190.0, pvp:53028.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-img-16x18-ceph', name:'Meyer ImaGine 16x18 + Ceph', cat:'xray', sub:'Meyer', coste:40952.0, pvd:51190.0, pvp:61428.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-img-16x12', name:'Meyer ImaGine FOV 16x12', cat:'xray', sub:'Meyer', coste:31512.0, pvd:39390.0, pvp:47268.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-img-16x12-ceph', name:'Meyer ImaGine 16x12 + Ceph', cat:'xray', sub:'Meyer', coste:37112.0, pvd:46390.0, pvp:55668.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-upg-16x12-18', name:'Meyer Upgrade FOV 16x12 → 16x18', cat:'xray', sub:'Meyer', coste:5112.0, pvd:6390.0, pvp:7668.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-3d-13x10', name:'Meyer 3D Pro FOV 13x10', cat:'xray', sub:'Meyer', coste:23960.0, pvd:29950.0, pvp:35940.0, asset:'assets/products/meyer_cbct_2d.png'),
    DashboardProduct(id:'meyer-3d-13x10-ceph', name:'Meyer 3D Pro 13x10 + Ceph', cat:'xray', sub:'Meyer', coste:29560.0, pvd:36950.0, pvp:44340.0, asset:'assets/products/meyer_cbct_2d.png'),
    DashboardProduct(id:'meyer-3d-16x10', name:'Meyer 3D Pro FOV 16x10', cat:'xray', sub:'Meyer', coste:27160.0, pvd:33950.0, pvp:40740.0, asset:'assets/products/meyer_cbct_2d.png'),
    DashboardProduct(id:'meyer-3d-16x10-ceph', name:'Meyer 3D Pro 16x10 + Ceph', cat:'xray', sub:'Meyer', coste:32760.0, pvd:40950.0, pvp:49140.0, asset:'assets/products/meyer_cbct_2d.png'),
    DashboardProduct(id:'meyer-ceph-upg', name:'Meyer Ceph Upgrade', cat:'xray', sub:'Meyer', coste:6600.0, pvd:8250.0, pvp:9900.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-endo-mdv', name:'Meyer Endo Mod MDV-1010', cat:'xray', sub:'Meyer', coste:1200.0, pvd:1500.0, pvp:1800.0, asset:'assets/products/meyer_cbct.png'),
    DashboardProduct(id:'meyer-carro', name:'Meyer Carro con PC y Monitor táctil', cat:'other', sub:'Meyer', coste:2800.0, pvd:3500.0, pvp:4200.0, asset:'assets/products/meyer_cbct_2d.png'),
    DashboardProduct(id:'newlife-opera-2d', name:'NewLife OPERA 2D', cat:'xray', sub:'NewLife', coste:11120.0, pvd:13900.0, pvp:16680.0, asset:'assets/products/newlife_opera2d.png'),
    DashboardProduct(id:'newlife-opera-2d-upg', name:'NewLife OPERA 2D (upgrade a Ceph)', cat:'xray', sub:'NewLife', coste:11720.0, pvd:14650.0, pvp:17580.0, asset:'assets/products/newlife_opera2d.png'),
    DashboardProduct(id:'newlife-opera-ceph', name:'NewLife OPERA 2D + Ceph OneShot', cat:'xray', sub:'NewLife', coste:18778.0, pvd:22900.0, pvp:27480.0, asset:'assets/products/newlife_opera2d.png'),
    DashboardProduct(id:'bms-endoray-hf', name:'BMS Endoray HF + Tim-X', cat:'xray', sub:'BMS', coste:1793.0, pvd:2390.0, pvp:2868.0, asset:'assets/products/bms_endoray.png'),
    DashboardProduct(id:'bms-endoport-g', name:'BMS EndoPort G', cat:'xray', sub:'BMS', coste:1868.0, pvd:2490.0, pvp:2988.0, asset:'assets/products/bms_endoray.png'),
    DashboardProduct(id:'bms-endoport-c', name:'BMS EndoPort C', cat:'xray', sub:'BMS', coste:1493.0, pvd:1990.0, pvp:2388.0, asset:'assets/products/bms_endoray.png'),
    DashboardProduct(id:'bms-suporte', name:'BMS Soporte Pared/Móvil con ruedas', cat:'other', sub:'BMS', coste:315.0, pvd:420.0, pvp:504.0, asset:'assets/products/bms_endoray.png'),
    DashboardProduct(id:'panda-smart', name:'Panda Smart', cat:'scanner', sub:'Panda', coste:4875.0, pvd:7500.0, pvp:9000.0, asset:'assets/products/panda_smart.png'),
    DashboardProduct(id:'panda-hat-scanbody', name:'Panda HAT Scanbody Kit', cat:'other', sub:'Panda', coste:975.0, pvd:1500.0, pvp:1800.0, asset:'assets/products/panda_hat_scanbody_kit.png'),
    DashboardProduct(id:'panda-p3-plus', name:'Panda P3+', cat:'scanner', sub:'Panda', coste:3634.0, pvd:5590.0, pvp:6708.0, asset:'assets/products/panda_elf_scanner.png'),
    DashboardProduct(id:'panda-carro-bamboo', name:'Panda Carro Bamboo Ultra (PC + Monitor)', cat:'other', sub:'Panda', coste:3192.0, pvd:3990.0, pvp:4788.0, asset:null),
    DashboardProduct(id:'coxo-scanner', name:'Coxo escáner intraoral', cat:'scanner', sub:'Coxo', coste:2150.0, pvd:2990.0, pvp:3890.0, asset:'assets/products/coxo_scanner.png'),
    DashboardProduct(id:'handy-hdr500', name:'Handy HDR-500 Sensor (size 1.3)', cat:'xray', sub:'Handy', coste:748.0, pvd:1150.0, pvp:1380.0, asset:'assets/products/handy_hdr500.png'),
    DashboardProduct(id:'handy-hdr600', name:'Handy HDR-600 Sensor (size 2)', cat:'xray', sub:'Handy', coste:878.0, pvd:1350.0, pvp:1620.0, asset:'assets/products/handy_hdr500.png'),
    DashboardProduct(id:'handy-hdr360', name:'Handy HDR-360 Sensor (size 1.3)', cat:'xray', sub:'Handy', coste:943.0, pvd:1450.0, pvp:1740.0, asset:'assets/products/handy_hdr360.png'),
    DashboardProduct(id:'handy-hdr380', name:'Handy HDR-380 Sensor (size 1.5)', cat:'xray', sub:'Handy', coste:1073.0, pvd:1650.0, pvp:1980.0, asset:'assets/products/handy_hdr360.png'),
    DashboardProduct(id:'handy-psp-hds500', name:'Handy PSP Scanner HDS-500 (placas 0,1,2,3)', cat:'xray', sub:'Handy', coste:1194.0, pvd:1990.0, pvp:2388.0, asset:'assets/products/handy_hdr360.png'),
    DashboardProduct(id:'handy-promi-hdi712', name:'Handy Promi HDI-712D', cat:'xray', sub:'Handy', coste:750.0, pvd:1250.0, pvp:1500.0, asset:'assets/products/handy_hdr500.png'),
    DashboardProduct(id:'handy-touchmi-hdi220', name:'Handy Touchmi HDI-220C', cat:'xray', sub:'Handy', coste:390.0, pvd:650.0, pvp:780.0, asset:'assets/products/handy_hdr500.png'),
    DashboardProduct(id:'handy-supercam-hdi200', name:'Handy Supercam HDI-200A', cat:'xray', sub:'Handy', coste:210.0, pvd:350.0, pvp:420.0, asset:'assets/products/handy_hdr500.png'),
    DashboardProduct(id:'cingol-x1', name:'Cingol X1 (PU + banco + UDS-N2 + foto)', cat:'unit', sub:'Cingol', coste:3439.0, pvd:5290.0, pvp:6348.0, asset:'assets/products/cingol_x1.png'),
    DashboardProduct(id:'cingol-x3', name:'Cingol X3 (piel + banco + UDS-N2 + foto)', cat:'unit', sub:'Cingol', coste:4089.0, pvd:6290.0, pvp:7548.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-x5', name:'Cingol X5 (piel + touchscreen + MM eléctrico)', cat:'unit', sub:'Cingol', coste:5779.0, pvd:8890.0, pvp:10668.0, asset:null),
    DashboardProduct(id:'cingol-touchscreen', name:'Cingol panel touchscreen (accesorio)', cat:'other', sub:'Cingol', coste:293.0, pvd:450.0, pvp:540.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-bcir', name:'Cingol con banco Denasta + lámpara quirúrgica', cat:'unit', sub:'Cingol', coste:5714.0, pvd:8790.0, pvp:10548.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-x3-implant', name:'Cingol X3 Implant (piel + ECG Monitor)', cat:'unit', sub:'Cingol', coste:1229.0, pvd:1890.0, pvp:2268.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-camara', name:'Cingol Cámara intraoral + Monitor', cat:'other', sub:'Cingol', coste:943.0, pvd:1450.0, pvp:1740.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-bdr-pu', name:'Cingol Banco Doctor PU', cat:'other', sub:'Cingol', coste:228.0, pvd:350.0, pvp:420.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-bdr-pl', name:'Cingol Banco Doctor piel', cat:'other', sub:'Cingol', coste:260.0, pvd:400.0, pvp:480.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-basis-pu', name:'Cingol Banco Asistente PU', cat:'other', sub:'Cingol', coste:179.0, pvd:275.0, pvp:330.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-basis-pl', name:'Cingol Banco Asistente piel', cat:'other', sub:'Cingol', coste:195.0, pvd:300.0, pvp:360.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-lamp-s200', name:'Cingol Lámpara X1 (S200)', cat:'other', sub:'Cingol', coste:267.0, pvd:410.0, pvp:492.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-lamp-s300', name:'Cingol Lámpara X3 (S300)', cat:'other', sub:'Cingol', coste:338.0, pvd:520.0, pvp:624.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'cingol-lamp-s400', name:'Cingol Lámpara X5 (S400)', cat:'other', sub:'Cingol', coste:364.0, pvd:560.0, pvp:672.0, asset:'assets/products/cingol_x3.png'),
    DashboardProduct(id:'puges-autoclave-p23', name:'Puges Autoclave P23 (23 L)', cat:'other', sub:'Puges', coste:1528.0, pvd:2350.0, pvp:2820.0, asset:null),
    DashboardProduct(id:'pax-pml30', name:'Pax lámpara quirúrgica PML30', cat:'other', sub:'Pax', coste:1398.0, pvd:2150.0, pvp:2580.0, asset:null),
    DashboardProduct(id:'pax-xr1-pro', name:'Pax XR1 Pro', cat:'other', sub:'Pax', coste:2243.0, pvd:3450.0, pvp:4140.0, asset:null),
    DashboardProduct(id:'pax-xr1-pro-1080', name:'Pax XR1 Pro + Cámara 1080P', cat:'other', sub:'Pax', coste:4544.0, pvd:6990.0, pvp:8388.0, asset:null),
    DashboardProduct(id:'pax-xr1-max-4k', name:'Pax XR1 Max + Cámara 4K', cat:'other', sub:'Pax', coste:5129.0, pvd:7890.0, pvp:9468.0, asset:null),
    DashboardProduct(id:'pax-xr1-1080-mon24', name:'Pax XR1 + Cámara 1080P + Monitor 24"', cat:'other', sub:'Pax', coste:5844.0, pvd:8990.0, pvp:10788.0, asset:null),
    DashboardProduct(id:'pax-xr1-4k-mon27', name:'Pax XR1 + Cámara 4K + Monitor 27"', cat:'other', sub:'Pax', coste:7144.0, pvd:10990.0, pvp:13188.0, asset:null),
    DashboardProduct(id:'denprag-w4', name:'Deprag Fresadora W4', cat:'mill', sub:'Deprag', coste:14072.0, pvd:17590.0, pvp:19900.0, asset:'assets/products/deprag_w4.png'),
    DashboardProduct(id:'denprag-d5-afe', name:'Deprag Fresadora D5-AFE', cat:'mill', sub:'Deprag', coste:14072.0, pvd:17590.0, pvp:21108.0, asset:'assets/products/deprag_d5_airfree.png'),
    DashboardProduct(id:'denprag-d5max', name:'Deprag Fresadora D5Max', cat:'mill', sub:'Deprag', coste:15512.0, pvd:19390.0, pvp:23268.0, asset:'assets/products/deprag_d5_max.png'),
    DashboardProduct(id:'denprag-asp-v7', name:'Deprag Aspiración V7', cat:'other', sub:'Deprag', coste:1160.0, pvd:1450.0, pvp:1740.0, asset:'assets/products/deprag_logo.png'),
    DashboardProduct(id:'denprag-asp-v9', name:'Deprag Aspiración V9', cat:'other', sub:'Deprag', coste:1160.0, pvd:1450.0, pvp:1740.0, asset:'assets/products/deprag_logo.png'),
    DashboardProduct(id:'denprag-millbox-eco', name:'Deprag Millbox-D52 ECO', cat:'soft', sub:'Deprag', coste:2240.0, pvd:2800.0, pvp:3360.0, asset:'assets/products/clinicad_software.png'),
    DashboardProduct(id:'denprag-millbox-std', name:'Deprag Millbox-D52 STD', cat:'soft', sub:'Deprag', coste:3120.0, pvd:3900.0, pvp:4680.0, asset:'assets/products/clinicad_software.png'),
    DashboardProduct(id:'denprag-millbox-exp', name:'Deprag Millbox-D52 EXP', cat:'soft', sub:'Deprag', coste:4760.0, pvd:5950.0, pvp:7140.0, asset:'assets/products/clinicad_software.png'),
    DashboardProduct(id:'denprag-sinter-s7', name:'Deprag Horno Sinterización S7 MoSi2', cat:'other', sub:'Deprag', coste:5272.0, pvd:6590.0, pvp:7908.0, asset:'assets/products/deprag_s7.png'),
    DashboardProduct(id:'denprag-impresora-pl7', name:'Deprag Impresora PL7 Pro', cat:'printer', sub:'Deprag', coste:3352.0, pvd:4190.0, pvp:5028.0, asset:'assets/products/deprag_pl7.png'),
    DashboardProduct(id:'medit-i700', name:'Medit i700', cat:'scanner', sub:'Medit', coste:6250.0, pvd:7375.0, pvp:8850.0, asset:'assets/products/medit_i700_real.png'),
    DashboardProduct(id:'medit-i700w', name:'Medit i700 Wireless', cat:'scanner', sub:'Medit', coste:7000.0, pvd:8260.0, pvp:9912.0, asset:'assets/products/medit_i700_wireless_real.png'),
    DashboardProduct(id:'medit-i900c', name:'Medit i900 Classic', cat:'scanner', sub:'Medit', coste:8200.0, pvd:9676.0, pvp:11611.0, asset:'assets/products/medit_i900_classic_real.png'),
    DashboardProduct(id:'medit-i900', name:'Medit i900 Mobility', cat:'scanner', sub:'Medit', coste:9050.0, pvd:10679.0, pvp:12815.0, asset:'assets/products/medit_i900_mobility_real.png'),
    DashboardProduct(id:'medit-i900-ipad', name:'Pack: Medit i900M + iPad M5 (Express app)', cat:'pack', sub:'Medit', coste:10500.0, pvd:12390.0, pvp:14868.0, asset:'assets/products/medit_i900_mobility_real.png'),
    DashboardProduct(id:'medit-i900-mac', name:'Pack: Medit i900 Classic + MacBook', cat:'pack', sub:'Medit', coste:9300.0, pvd:10974.0, pvp:13169.0, asset:'assets/products/medit_i900_classic_real.png'),
    DashboardProduct(id:'medit-i900-pack', name:'Pack Medit i900 — Estación completa Mac mini', cat:'pack', sub:'Medit', coste:9700.0, pvd:11446.0, pvp:13735.0, asset:'assets/products/pack_medit_i900.png'),
    DashboardProduct(id:'dof-freedom', name:'DOF Freedom Air + PIM · Oferta 2026', cat:'fotogram', sub:'DOF', coste:7500.0, pvd:9750.0, pvp:12900.0, asset:'assets/products/dof_freedom_air.png'),
    DashboardProduct(id:'dof-freedom-3ud', name:'DOF Freedom Air — Tier 3 ud (−2%)', cat:'fotogram', sub:'DOF', coste:7500.0, pvd:9555.0, pvp:11900.0, asset:'assets/products/dof_freedom_air.png'),
    DashboardProduct(id:'dof-freedom-5ud', name:'DOF Freedom Air — Tier 5 ud (−5%)', cat:'fotogram', sub:'DOF', coste:7500.0, pvd:9262.0, pvp:11900.0, asset:'assets/products/dof_freedom_air.png'),
    DashboardProduct(id:'dof-freedom-7ud', name:'DOF Freedom Air — Tier 7 ud (−8%)', cat:'fotogram', sub:'DOF', coste:7500.0, pvd:8970.0, pvp:11900.0, asset:'assets/products/dof_freedom_air.png'),
    DashboardProduct(id:'dof-freedom-10ud', name:'DOF Freedom Air — Tier 10 ud (−10%)', cat:'fotogram', sub:'DOF', coste:7500.0, pvd:8775.0, pvp:11900.0, asset:'assets/products/dof_freedom_air.png'),
    DashboardProduct(id:'dof-freedom-pvmax', name:'DOF Freedom Air — PV máx. distribuidor → clínica', cat:'fotogram', sub:'DOF', coste:7500.0, pvd:9750.0, pvp:12100.0, asset:'assets/products/dof_freedom_air.png'),
    DashboardProduct(id:'dof-inst-bronze', name:'DOF Freedom Air — Instalación Bronze/Silver (remota)', cat:'other', sub:'DOF', coste:120.0, pvd:160.0, pvp:200.0, asset:null),
    DashboardProduct(id:'dof-inst-gold', name:'DOF Freedom Air — Instalación Gold/Platinum (remota/presencial)', cat:'other', sub:'DOF', coste:625.0, pvd:900.0, pvp:1100.0, asset:null),
    DashboardProduct(id:'dof-scanbody-12', name:'Bonus 12 scanbodies (sin cargo)', cat:'other', sub:'DOF', coste:0.0, pvd:0.0, pvp:0.0, asset:'assets/products/shining_elite_kit_original.png'),
    DashboardProduct(id:'shining-elf', name:'Shining Elf', cat:'scanner', sub:'Shining', coste:7000.0, pvd:8260.0, pvp:9912.0, asset:'assets/products/shining_elf.png'),
    DashboardProduct(id:'shining-elite', name:'Shining Elite + Kit', cat:'fotogram', sub:'Shining', coste:13300.0, pvd:15694.0, pvp:18833.0, asset:'assets/products/shining_elite_kit_original.png'),
    DashboardProduct(id:'shining-elite-rn', name:'Shining Elite + Kit (RENOVE)', cat:'fotogram', sub:'Shining', coste:11000.0, pvd:12980.0, pvp:15576.0, asset:'assets/products/shining_elite_kit_original.png'),
    DashboardProduct(id:'shining-elite-w', name:'Shining Elite W + Kit', cat:'fotogram', sub:'Shining', coste:15445.0, pvd:18225.0, pvp:21870.0, asset:'assets/products/shining_elite_wireless_kit.png'),
    DashboardProduct(id:'shining-elite-wrn', name:'Shining Elite W + Kit (RENOVE)', cat:'fotogram', sub:'Shining', coste:12500.0, pvd:14750.0, pvp:17700.0, asset:'assets/products/shining_elite_wireless_kit.png'),
    DashboardProduct(id:'accufab-f1', name:'Shining AccuFab F1 (+ FabWash + FabCure)', cat:'printer', sub:'Shining', coste:6100.0, pvd:7500.0, pvp:9000.0, asset:'assets/products/accufab_f1.png'),
    DashboardProduct(id:'accufab-4d', name:'Shining AccuFab 4D (L4D)', cat:'printer', sub:'Shining', coste:2500.0, pvd:2898.0, pvp:3333.0, asset:'assets/products/accufab_4d.png'),
    DashboardProduct(id:'ray-alpha-3d', name:'RAY ALPHA 3D', cat:'xray', sub:'RayScan', coste:24900.0, pvd:29382.0, pvp:35258.0, asset:'assets/products/rayscan_alpha.png'),
    DashboardProduct(id:'ray-alpha-plus', name:'RAY ALPHA PLUS', cat:'xray', sub:'RayScan', coste:33900.0, pvd:39402.0, pvp:47282.0, asset:'assets/products/rayscan_cbct.png'),
    DashboardProduct(id:'nexdent-lc1', name:'Nexdent LCD1 (Impresora 3D resina)', cat:'printer', sub:'Nexdent', coste:3600.0, pvd:4174.0, pvp:4800.0, asset:'assets/products/nexdent_lc1.png'),
    DashboardProduct(id:'lilivis-print', name:'Lilivis Print LP-100', cat:'printer', sub:'Lilivis', coste:5564.0, pvd:7790.0, pvp:9348.0, asset:'assets/products/lilivis_print.png'),
    DashboardProduct(id:'lilivis-uvcure', name:'Lilivis UV Cure LC-100', cat:'printer', sub:'Lilivis', coste:1757.0, pvd:2460.0, pvp:2952.0, asset:'assets/products/lilivis_uv.png'),
    DashboardProduct(id:'lilivis-slicer', name:'Lilivis Slicer Software', cat:'soft', sub:'Lilivis', coste:1282.0, pvd:1474.0, pvp:1769.0, asset:'assets/products/lilivis_mill.png'),
    DashboardProduct(id:'lilivis-print-inst', name:'Lilivis Print — Instalación + Formación online (4h)', cat:'other', sub:'Lilivis', coste:680.0, pvd:782.0, pvp:938.0, asset:'assets/products/lilivis_print.png'),
    DashboardProduct(id:'lilivis-print-ship', name:'Lilivis Print — Transporte y envío', cat:'other', sub:'Lilivis', coste:350.0, pvd:389.0, pvp:467.0, asset:'assets/products/lilivis_print.png'),
    DashboardProduct(id:'lilivis-mill', name:'Lilivis Mill Dual 3-Axis', cat:'mill', sub:'Lilivis', coste:18000.0, pvd:24900.0, pvp:29880.0, asset:'assets/products/lilivis_mill.png'),
    DashboardProduct(id:'lilivis-mill-inst', name:'Lilivis Mill — Instalación + Formación presencial (1 día)', cat:'other', sub:'Lilivis', coste:1500.0, pvd:1668.0, pvp:2002.0, asset:'assets/products/lilivis_mill.png'),
    DashboardProduct(id:'lilivis-mill-ship', name:'Lilivis Mill — Transporte y envío', cat:'other', sub:'Lilivis', coste:1351.0, pvd:1501.0, pvp:1801.0, asset:'assets/products/lilivis_mill.png'),
    DashboardProduct(id:'philden-adc500', name:'Philden Fresadora ADC-500', cat:'mill', sub:'Philden', coste:13845.0, pvd:15921.0, pvp:19105.0, asset:'assets/products/philden_adc500.png'),
    DashboardProduct(id:'philden-s500', name:'Philden Fresadora S-500', cat:'mill', sub:'Philden', coste:10424.0, pvd:11988.0, pvp:14386.0, asset:'assets/products/philden_s510_b.png'),
    DashboardProduct(id:'philden-s510', name:'Philden Fresadora S-510', cat:'mill', sub:'Philden', coste:11302.0, pvd:12997.0, pvp:15596.0, asset:'assets/products/philden_s510.png'),
    DashboardProduct(id:'philden-x500', name:'Philden X500 + Mueble completo', cat:'mill', sub:'Philden', coste:24959.0, pvd:28703.0, pvp:34444.0, asset:'assets/products/philden_s510.png'),
    DashboardProduct(id:'philden-ship', name:'Philden — Importación, transporte y envío', cat:'other', sub:'Philden', coste:1351.0, pvd:1554.0, pvp:1865.0, asset:'assets/products/philden_s510.png'),
    DashboardProduct(id:'philden-inst', name:'Philden — Instalación y puesta en marcha (1 día)', cat:'other', sub:'Philden', coste:680.0, pvd:782.0, pvp:938.0, asset:'assets/products/philden_s510.png'),
    DashboardProduct(id:'duotron-t3200', name:'Duotron T-3200 Ceramic', cat:'other', sub:'Duotron', coste:3251.0, pvd:3739.0, pvp:4487.0, asset:'assets/products/duotron_furnace.png'),
    DashboardProduct(id:'millbox-expert-cim', name:'Mill Box CAM Expert CIMSystem', cat:'soft', sub:'Philden', coste:6044.0, pvd:6950.0, pvp:8340.0, asset:null),
    DashboardProduct(id:'millbox-expert-ph', name:'Mill Box CAM Expert Philden', cat:'soft', sub:'Philden', coste:5625.0, pvd:6469.0, pvp:7763.0, asset:null),
    DashboardProduct(id:'millbox-std-cim', name:'Mill Box CAM Standard CIMSystem', cat:'soft', sub:'Philden', coste:5238.0, pvd:6024.0, pvp:7229.0, asset:null),
    DashboardProduct(id:'millbox-std-ph', name:'Mill Box CAM Standard Philden', cat:'soft', sub:'Philden', coste:3600.0, pvd:4140.0, pvp:4968.0, asset:null),
    DashboardProduct(id:'cliccad', name:'ClinicCAD con IA (Licencia perpetua)', cat:'soft', sub:'ClinicCAD', coste:1200.0, pvd:2200.0, pvp:2640.0, asset:null),
    DashboardProduct(id:'lcam', name:'L-CAM (Licencia perpetua)', cat:'soft', sub:'Lilivis', coste:900.0, pvd:1600.0, pvp:1920.0, asset:'assets/products/lilivis_mill.png'),
    DashboardProduct(id:'mazic-duro', name:'Mazic Duro', cat:'material', sub:'Vericom', coste:95.0, pvd:118.75, pvp:142.5, asset:'assets/products/mazic_duro.png'),
    DashboardProduct(id:'mazic-claro', name:'Mazic Claro', cat:'material', sub:'Vericom', coste:95.0, pvd:118.75, pvp:142.5, asset:'assets/products/mazic_claro.png'),
    DashboardProduct(id:'pack-pro', name:'Pack AldraScan Pro (Chairside · Captura → Diseño → Producción → Terminado)', cat:'pack', sub:'AldraScan', coste:33855.0, pvd:37617.0, pvp:45140.0, asset:'assets/products/pack_aldrascan_pro.png'),
    DashboardProduct(id:'pack-lab', name:'Pack Laboratorio Digital (Express + Horno Duotron)', cat:'pack', sub:'AldraScan', coste:20000.0, pvd:25000.0, pvp:30000.0, asset:'assets/products/pack_laboratorio_digital.png'),
    DashboardProduct(id:'ipad-pro-13', name:'iPad Pro 13"', cat:'other', sub:'Apple', coste:1100.0, pvd:1400.0, pvp:1680.0, asset:'assets/products/ipad_pro_13.png'),
    DashboardProduct(id:'kit-mat', name:'Kit materiales completo', cat:'other', sub:'AldraScan', coste:800.0, pvd:1100.0, pvp:1320.0, asset:null),
    DashboardProduct(id:'inst-clinica', name:'Instalación y formación clínica', cat:'other', sub:'AldraScan', coste:400.0, pvd:700.0, pvp:840.0, asset:null),
  ];

  static List<DashboardProduct> byCategory(String? cat) =>
    cat == null || cat == 'all' ? products : products.where((p) => p.cat == cat).toList();

  static List<String> get brands {
    final s = <String>{}; for (final p in products) { s.add(p.sub); }
    return s.toList()..sort();
  }

  static DashboardCategory catOf(String id) =>
    categories.firstWhere((c)=>c.id==id, orElse: ()=>categories.last);

  static DashboardProduct? byId(String id) {
    for (final p in products) { if (p.id == id) return p; }
    return null;
  }
}

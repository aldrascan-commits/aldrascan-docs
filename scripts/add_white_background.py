#!/usr/bin/env python3
"""
Script para añadir fondo blanco 2550x1600 a imágenes de productos
"""

import os
import requests
from PIL import Image
from io import BytesIO
from urllib.parse import unquote

# Imágenes que necesitan fondo blanco (fondos de color detectados)
IMAGES_TO_PROCESS = [
    # Radiología - fondos azules
    ("https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/gntn3jz9_Alpha%203D%201080x1080%20.jpeg", "rayscan_alpha_3d"),
    ("https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/mgmnn7fx_RAY%20PreMiere%201080x1080.jpeg", "ray_premiere"),
    ("https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/2s0j9dha_PHOTO-2024-05-07-13-00-29.jpg", "ray_alpha_5d"),
    # CAD/CAM
    ("https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/47iiimxw_Articon-MILLBOX-SUM-3D.jpg", "millbox_eco"),
    ("https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/uynja0sf_mant%20CAD%20CAM.jpg", "mant_cadcam"),
]

OUTPUT_DIR = "/app/frontend/public/images/products"
TARGET_SIZE = (2550, 1600)

def process_image(url, output_name):
    """Descarga imagen y la coloca centrada sobre fondo blanco"""
    try:
        print(f"Procesando: {output_name}")
        
        # Descargar imagen
        response = requests.get(url, timeout=30)
        response.raise_for_status()
        
        # Abrir imagen
        img = Image.open(BytesIO(response.content))
        
        # Convertir a RGBA si es necesario
        if img.mode != 'RGBA':
            img = img.convert('RGBA')
        
        # Crear fondo blanco
        white_bg = Image.new('RGB', TARGET_SIZE, (255, 255, 255))
        
        # Calcular tamaño para mantener proporciones
        img_ratio = img.width / img.height
        target_ratio = TARGET_SIZE[0] / TARGET_SIZE[1]
        
        # Dejar margen del 10%
        max_width = int(TARGET_SIZE[0] * 0.85)
        max_height = int(TARGET_SIZE[1] * 0.85)
        
        if img_ratio > target_ratio:
            # Imagen más ancha - ajustar por ancho
            new_width = max_width
            new_height = int(new_width / img_ratio)
        else:
            # Imagen más alta - ajustar por alto
            new_height = max_height
            new_width = int(new_height * img_ratio)
        
        # Redimensionar imagen
        img_resized = img.resize((new_width, new_height), Image.Resampling.LANCZOS)
        
        # Calcular posición centrada
        x = (TARGET_SIZE[0] - new_width) // 2
        y = (TARGET_SIZE[1] - new_height) // 2
        
        # Pegar imagen sobre fondo blanco
        white_bg.paste(img_resized, (x, y), img_resized if img_resized.mode == 'RGBA' else None)
        
        # Guardar
        output_path = os.path.join(OUTPUT_DIR, f"{output_name}.png")
        white_bg.save(output_path, "PNG", quality=95)
        print(f"  ✓ Guardado: {output_path}")
        
        return output_path
    except Exception as e:
        print(f"  ✗ Error: {e}")
        return None

def main():
    # Crear directorio de salida
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    print(f"Procesando {len(IMAGES_TO_PROCESS)} imágenes...")
    print(f"Tamaño objetivo: {TARGET_SIZE[0]}x{TARGET_SIZE[1]} con fondo blanco\n")
    
    processed = []
    for url, name in IMAGES_TO_PROCESS:
        result = process_image(url, name)
        if result:
            processed.append((name, result))
    
    print(f"\n✓ Procesadas {len(processed)} de {len(IMAGES_TO_PROCESS)} imágenes")
    
    # Mostrar rutas para actualizar catalog.js
    print("\nRutas para catalog.js:")
    for name, path in processed:
        relative_path = path.replace("/app/frontend/public", "")
        print(f'  "{name}": "{relative_path}"')

if __name__ == "__main__":
    main()

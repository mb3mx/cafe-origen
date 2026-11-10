# Origen · Café 100% de origen oaxaqueño

Landing page de **Café Origen**, café de San Mateo Piñas, Oaxaca, cultivado a más de 1,600 m bajo sombra natural.

## Estructura

| Ruta | Contenido |
|---|---|
| `index.html` | Landing page (HTML, CSS y JS en un solo archivo, sin dependencias ni build) |
| `assets/` | Imágenes optimizadas (WebP), logo, íconos y fotos |
| `assets/fonts/` | Tipografías alojadas en el sitio: Cormorant Garamond, Montserrat y Cinzel |
| `etiqueta-origen.html` | Fuente editable de la etiqueta para imprimir (10 × 15 cm + 3 mm de sangrado) |
| `etiqueta-origen.pdf` / `etiqueta-origen-300dpi.png` | Etiqueta lista para imprenta |

## Ver en local

Es un sitio estático: basta con abrir `index.html` o servir la carpeta con cualquier servidor web
(por ejemplo XAMPP en `http://localhost/.../cafe-origen/`).

## Detalles útiles

- **Carita de WhatsApp de temporada:** cambia sola cada mes. Para previsualizar un mes: `index.html?mes=1` … `?mes=12`.
- **Pedidos:** el formulario "Arma tu bolsa" abre WhatsApp (55 3705 3034) con el pedido ya escrito.
- **Créditos de fotos** (Wikimedia Commons): «Café bajo sombra», Feria de Productores, CC BY 2.0 — el crédito
  debe mantenerse visible mientras se use; «Planta de café en Zihuateutla», Jaontiveros, dominio público.

## Imagen Docker (GitHub Packages)

La imagen sirve el sitio con nginx (gzip, caché larga en `assets/`, sin caché en `index.html` y health check).
Solo incluye lo que usa la página: las fuentes de diseño y la etiqueta para imprimir se quedan fuera (`.dockerignore`).

```bash
# Construir (el servidor es linux/amd64)
docker build --platform linux/amd64 --build-arg VERSION=1.1.0 \
  -t ghcr.io/mb3mx/cafe-origen:1.1.0 -t ghcr.io/mb3mx/cafe-origen:latest .

# Publicar
docker push ghcr.io/mb3mx/cafe-origen:1.1.0
docker push ghcr.io/mb3mx/cafe-origen:latest

# Ejecutar
docker run -d --name cafe-origen --restart unless-stopped -p 80:80 ghcr.io/mb3mx/cafe-origen:1.1.0
```

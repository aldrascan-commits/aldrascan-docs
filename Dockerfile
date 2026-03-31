# ─────────────────────────────────────────────────────────────────────────────
# AldraScan App — Dockerfile
# Build: docker build -t aldrascan-app .
# Run:   docker run -p 5060:5060 aldrascan-app
# ─────────────────────────────────────────────────────────────────────────────

# ── STAGE 1: Build Flutter Web ───────────────────────────────────────────────
FROM ghcr.io/cirruslabs/flutter:3.22.0 AS builder

WORKDIR /app

# Copiar dependencias primero (cache layer)
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

# Copiar código fuente
COPY . .

# Build Flutter web en modo release
RUN flutter build web --release --no-wasm-dry-run

# ── STAGE 2: Serve con Nginx ─────────────────────────────────────────────────
FROM nginx:alpine

# Copiar configuración nginx personalizada
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar build de Flutter
COPY --from=builder /app/build/web /usr/share/nginx/html

# Exponer puerto 5060
EXPOSE 5060

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:5060/ || exit 1

# Arrancar nginx
CMD ["nginx", "-g", "daemon off;"]

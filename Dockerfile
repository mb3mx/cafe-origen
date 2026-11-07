# Café Origen — landing estática servida con nginx
FROM nginx:1.27-alpine

ARG VERSION=1.0.0
LABEL org.opencontainers.image.title="cafe-origen" \
      org.opencontainers.image.description="Landing page de Café Origen, café 100% de origen oaxaqueño" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.source="https://github.com/mb3mx/cafe-origen" \
      org.opencontainers.image.url="https://www.cafeorigen.com.mx"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -q --spider http://127.0.0.1/ || exit 1

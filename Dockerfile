# Imagen base oficial de Odoo 17 Community
FROM odoo:17

# Copiar (opcionalmente) módulos personalizados al contenedor
COPY ./extra-addons /mnt/extra-addons

# Exponer puerto estándar de Odoo
EXPOSE 8069

# Configurar el puerto de PostgreSQL (Render usa 5432 por defecto)
ENV PGPORT=5432

# 🔹 Inicializar la base de datos en la fase de build
# Esto crea las tablas de Odoo dentro de la BD indicada
# Si la BD ya existe, simplemente la ignora
RUN bash -lc "odoo -i base \
    --db_host=\$PGHOST \
    --db_port=\$PGPORT \
    --db_user=\$PGUSER \
    --db_password=\$PGPASSWORD \
    --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons \
    --db-filter=.* || true"

# 🔹 Comando de inicio normal del servidor Odoo
CMD ["bash", "-lc", "odoo \
    --db_host=$PGHOST \
    --db_port=$PGPORT \
    --db_user=$PGUSER \
    --db_password=$PGPASSWORD \
    --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons \
    --db-filter=.* \
    --dev=all"]

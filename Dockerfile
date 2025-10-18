# Imagen base oficial de Odoo 17 Community
FROM odoo:17

# Copiar (opcionalmente) módulos personalizados al contenedor
COPY ./extra-addons /mnt/extra-addons

# Exponer puerto estándar de Odoo
EXPOSE 8069

# Configurar el puerto de PostgreSQL (Render usa 5432 por defecto)
ENV PGPORT=5432

# Comando de inicio normal de Odoo
CMD ["bash", "-lc", "odoo \
    --db_host=$PGHOST \
    --db_port=$PGPORT \
    --db_user=$PGUSER \
    --db_password=$PGPASSWORD \
    --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons \
    --db-filter=.* \
    --dev=all"]

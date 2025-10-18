FROM odoo:17

# (Opcional) módulos propios si los hubiera
COPY ./extra-addons /mnt/extra-addons

EXPOSE 8069

# Ajusta el puerto si tu Postgres usa otro (por defecto 5432 en Render)
ENV PGPORT=5432

# Usamos shell para que EXPANDAN las variables PG*
# e indicamos addons-path por si usas extra-addons
CMD ["bash","-lc","odoo \
#la siguiente instruccion '-i base' solo hay que ejecutarla la primera vez o nos machacaremos
#la bd con la instalacion inicial
-i base \
  --db_host=\"$PGHOST\" \
  --db_port=\"${PGPORT}\" \
  --db_user=\"$PGUSER\" \
  --db_password=\"$PGPASSWORD\" \
  --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons \
  --db-filter=.* \
  --dev=all"]



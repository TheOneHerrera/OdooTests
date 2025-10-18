# Imagen base oficial de Odoo 17 Community
FROM odoo:17

# Variables de entorno
ENV HOST=db
ENV USER=odoo
ENV PASSWORD=odoo

# Copiar módulos personalizados al contenedor
COPY ./extra-addons /mnt/extra-addons

# Exponer puerto 8069 (interfaz web)
EXPOSE 8069

# Comando de inicio
CMD ["odoo", "--db-filter=.*", "--dev=all"]


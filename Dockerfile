# Imagen base oficial de Odoo 17 Community
FROM odoo:17

# Copiar módulos personalizados al contenedor
COPY ./extra-addons /mnt/extra-addons

# Exponer puerto 8069 (interfaz web)
EXPOSE 8069

# Comando de inicio
CMD ["odoo", "--db-filter=.*", "--dev=all"]


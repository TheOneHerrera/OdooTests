# Imagen base oficial de Odoo 17 Community
FROM odoo:17

# Variables de entorno (Render las puede sobreescribir)
ENV HOST=db
ENV USER=odoo
ENV PASSWORD=odoo

# Exponemos el puerto web de Odoo
EXPOSE 8069

# Comando de inicio del servidor Odoo
CMD ["odoo", "-d", "odoo_db", "--db_host=db", "--db_user=odoo", "--db_password=odoo", "--db_port=5432"]

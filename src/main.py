#!/usr/bin/env python3
#
# Script principal del backend
#
# Este se encarga de hacer todo
#
# Como se utiliza:
#   $ python ./src/main.py
#


"""
Script principal del backend

Este se encarga de hacer todo
"""


# Paquetes estandar
## NOTE: esto esta vacio por ahora

# Paquetes instalados
## NOTE: esto esta vacio por ahora

# Paquetes locales
from servicio import Servicio
from controlador import Controlador
from configuracion import (
    DB_HOST, DB_USER, DB_PASSWORD, DB_NOMBRE
)


if __name__ == '__main__':
    servicio = Servicio()
    controlador = Controlador(servicio)
    servicio.conectarse(DB_HOST, DB_USER, DB_PASSWORD, DB_NOMBRE)
    controlador.iniciar()

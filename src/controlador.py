#!/usr/bin/env python3
#
# Modulo Controlador
#
# Este modulo es responsable
# de atender las peticiones
# que llegan del frontend
#


"""
Modulo Controlador

Este modulo es responsable
de atender las peticiones
que llegan del frontend
"""


# Paquetes estandar
## NOTE: esto esta vacio por ahora

# Paquetes instalados
from flask import Flask
from flask_cors import CORS, cross_origin

# Paquetes locales
## NOTE: esto esta vacio por ahora


class Controlador:
    """
    Esta clase es responsable de atender
    las peticiones que llegan del frontend
    """

    def __init__(self, servicio) -> None:
        self.servicio = servicio

    def iniciar(self) -> None:
        """Inicia la ejecucion el controlador"""
        app = Flask(__name__)
        cors = CORS(app) # pylint: disable=unused-variable
        app.config['CORS_HEADERS'] = 'Content-Type'

        @app.route('/test/controlador')
        @cross_origin()
        def test_controlador():
            """Endpoint de test"""
            return 'Controlador funcionando!'

        @app.route('/test/servicio')
        @cross_origin()
        def test_servicio():
            """Endpoint de test"""
            return self.servicio.test_this()

        @app.route('/test/mysql')
        @cross_origin()
        def test_mysql():
            """Endpoint de test"""
            return self.servicio.test_mysql()

        @app.route('/contenidos')
        @cross_origin()
        def contenidos():
            """Endpoint de test"""
            return self.servicio.obtener_contenidos()

        app.run()


if __name__ == '__main__':
    print('Este modulo NO se debe ejecutar desde la consola')

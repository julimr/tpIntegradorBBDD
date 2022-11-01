#!/usr/bin/env python3
#
# Modulo Servicio
#
# Este modulo es responsable de
# conectarse con backend
#


"""
Modulo Servicio

Este modulo es responsable de
conectarse con backend
"""


# Paquetes estandar
import itertools
import json

# Paquetes instalados
import pymysql

# Paquetes locales
## NOTE: esto esta vacio por ahora


class Servicio:
    """Esta clase es responsable de conectarse con backend"""

    def __init__(self) -> None:
        self.conexion_db = None

    def conectarse(
            self,
            host:str,
            user:str,
            password:str,
            database:str
            ) -> None:
        """
        Conectarse a base de datos MySQL
        usando HOST, USER y PASSWORD
        """
        try:
            self.conexion_db = pymysql.connect(
                host=host,
                user=user,
                password=password,
                db=database
                )
            print("Conexión correcta a la base de datos")
        except (pymysql.err.OperationalError, pymysql.err.InternalError) as error:
            print("Ocurrió un error al conectar: ", error)

    def test_this(self) -> str:
        """
        Metodo para testear visualmente la correcta
        conexion entre controlador-servicio
        """
        return 'Servicio funcionando!'

    def test_mysql(self) -> str:
        """
        Metodo para testear visualmente que se conecta
        correctamente a MySQL
        """
        with self.conexion_db.cursor() as cursor:
            cursor.execute('SHOW DATABASES;')
            # NOTE: fetchall devuelve tuplas, debemos convertirlos a listas
            bases_de_datos = list(itertools.chain(*cursor.fetchall()))
        self.conexion_db.commit()

        result = f'Bases de datos encontradas ({len(bases_de_datos)}):<br>'
        for bdd in bases_de_datos:
            result += f'- {bdd}<br>'

        return result

    def obtener_contenidos(self) -> list:
        """
        Retorna lista de contenidos en formato:
        - [titulo, extension, cantidad de comentarios]
        """
        ## NOTE: esto se podria separar en otro modulo 'database' o algo asi
        # Hacemos consulta a la base de datos
        consulta = None
        with self.conexion_db.cursor() as cursor:
            cursor.execute(
                'SELECT contenido.titulo, contenido.extension, COUNT(*) as cantComentarios\n'
                'FROM comentario\n'
                'LEFT JOIN contenido ON comentario.id_contenido = comentario.id_contenido\n'
                'GROUP BY contenido.id_contenido\n'
                'ORDER BY cantComentarios DESC;'
            )
            # NOTE: fetchall devuelve tuplas, debemos convertirlos a listas
            consulta = cursor.fetchall()
        self.conexion_db.commit()

        # Convertimos las tupas en json
        result = []
        for titulo, extension, cant_comentarios in consulta:
            result.append({
                    "titulo": titulo,
                    "extension": extension,
                    "cantComentarios": cant_comentarios
                })
        result = json.loads(json.dumps(result))

        return result


if __name__ == '__main__':
    print('Este modulo NO se debe ejecutar desde la consola')

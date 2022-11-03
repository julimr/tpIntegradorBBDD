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

    def obtener_mas_comentados(self) -> list:
        """
        Retorna lista de contenidos en formato:
        - [titulo, extension, cantidad de comentarios]
        """
        ## NOTE: esto se podria separar en otro modulo 'database' o algo asi
        # Hacemos consulta a la base de datos
        consulta = None
        with self.conexion_db.cursor() as cursor:
            cursor.execute(
                "select tbl_rank.titulo 'Titulo', tbl_rank.tipo_contenido 'Tipo de contenido', tbl_rank.cant_comentarios 'Cant comentarios'from (select contenido.id_contenido, contenido.titulo , contenido.tipo_contenido , count(comentario.id_comentario) 'cant_comentarios', rank () over ( partition by contenido.tipo_contenido order by count(comentario.id_comentario) desc) 'rango' from comentario join contenido on contenido.id_contenido = comentario.id_contenido  group by contenido.id_contenido ) as tbl_rank where tbl_rank.rango < 5;"
            )
            # NOTE: fetchall devuelve tuplas, debemos convertirlos a listas
            consulta = cursor.fetchall()
        self.conexion_db.commit()

        # Convertimos las tupas en json
        result = []
        # for id_contenido, titulo, tipo_contenido, cant_comentarios in consulta:
        for titulo, tipo_contenido, cant_comentarios in consulta:
            result.append({
                    # "id": id_contenido,
                    "titulo": titulo,
                    "extension": tipo_contenido,
                    "cantComentarios": cant_comentarios
                })
        result = json.loads(json.dumps(result))

        return result

    def obtener_contenidos_tipo(self, tipo) -> list:
        """
        Retorna lista de los contenidos de musica mas comentados
        """
        tipo_contenido = tipo
        consulta = "SELECT c.id_contenido, c.titulo , extension, COUNT(com.id_contenido) as 'Cantidad de comentarios' FROM contenido c LEFT JOIN comentario com ON c.id_contenido = com.id_contenido WHERE c.tipo_contenido = %s GROUP BY com.id_contenido ORDER BY COUNT(com.id_contenido) DESC;"
        with self.conexion_db.cursor() as cursor:
            cursor.execute(consulta, (tipo_contenido))
            # NOTE: fetchall devuelve tuplas, debemos convertirlos a listas
            consulta = cursor.fetchall()
        self.conexion_db.commit()

        # Convertimos las tupas en json
        result = []
        for id_contenido, titulo, extension, cant_comentarios in consulta:
            result.append({
                    "id" : id_contenido,
                    "titulo": titulo,
                    "extension": extension,
                    "cantComentarios": cant_comentarios
                })
        result = json.loads(json.dumps(result))

        return result


if __name__ == '__main__':
    print('Este modulo NO se debe ejecutar desde la consola')

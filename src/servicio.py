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
                "SELECT tipo_contenido as 'Tipo de contenido', extension, COUNT(com.id_contenido) as 'Cantidad de comentarios' FROM contenido c LEFT JOIN comentario com ON c.id_contenido = com.id_contenido GROUP BY c.extension ORDER BY tipo_contenido ASC;"
            )
            # NOTE: fetchall devuelve tuplas, debemos convertirlos a listas
            consulta = cursor.fetchall()
            cursor.close()
        self.conexion_db.commit()

        # Convertimos las tupas en json
        result = []
        for titulo, tipo_contenido, cant_comentarios in consulta:
            result.append({
                    "tipo_contenido": titulo,
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
            cursor.close()
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
        
    def obtener_contenido_por_id(self, id_contenido) -> list:
        """
        Retorna el contenido segun el id_contenido
        """
        id = id_contenido
        consulta = "SELECT id_contenido, titulo, tipo_contenido FROM contenido WHERE id_contenido = %s;"
        with self.conexion_db.cursor() as cursor:
            cursor.execute(consulta, (id))
            consulta = cursor.fetchall()
            cursor.close()
        self.conexion_db.commit()
        # Convertimos las tupas en json
        result = []
        for id_contenido, titulo, tipo_contenido in consulta:
            result.append({
                    "id_contenido" : id_contenido,
                    "titulo": titulo,
                    "tipo_contenido": tipo_contenido
                })
        result = json.loads(json.dumps(result))
        return result
    
    def comentar(self, titulo, descripcion, apodo_comentarista, id_contenido) -> list:
        consulta = "INSERT INTO comentario(titulo, descripcion, apodo_comentarista, id_contenido) VALUES (%s,%s,%s,%s);"
        with self.conexion_db.cursor() as cursor:
            cursor.execute(consulta, (titulo, descripcion,apodo_comentarista,id_contenido))
            consulta = cursor.fetchall()
            cursor.close()
        self.conexion_db.commit()
        # Convertimos las tupas en json
        result = []
        
        return result

    def obtener_comentarios_por_id_contenido(self, id_contenido) -> list:
        """
        Retorna el contenido segun el id_contenido
        """
        id = id_contenido
        consulta = "SELECT id_contenido, titulo, descripcion, apodo_comentarista, id_comentario FROM comentario WHERE id_contenido = %s;"
        with self.conexion_db.cursor() as cursor:
            cursor.execute(consulta, (id))
            consulta = cursor.fetchall()
            cursor.close()
        self.conexion_db.commit()
        # Convertimos las tupas en json
        result = []
        for id_contenido, titulo, descripcion, apodo_comentarista, id_comentario in consulta:
            result.append({
                    "id_contenido" : id_contenido,
                    "titulo": titulo,
                    "descripcion": descripcion,
                    "apodoComentarista": apodo_comentarista,
                    "id_comentario": id_comentario
                })
        result = json.loads(json.dumps(result))

        return result

    def eliminar_comentario(self, id_comentario) -> list:
        """ Elimina un comentario """
        id = id_comentario
        consulta = "DELETE FROM comentario WHERE id_comentario = %s;" 
        try:
            with self.conexion_db.cursor() as cursor:
                cursor.execute(consulta, (id))
                cursor.close()
            self.conexion_db.commit()

            return json.loads(json.dumps({'mensaje': "comentario eliminado"}))
        except Exception as ex:
            return json.loads(json.dumps({'mensaje': f"{ex}"}))

        

if __name__ == '__main__':
    print('Este modulo NO se debe ejecutar desde la consola')

import pymysql

def obtener_conexion():
    return pymysql.connect (
        host='mysql-usat2024-usat-fc50.a.aivencloud.com',
        port=17580,
        user='avnadmin',
        password='AVNS_qPrQmXKedZ0dcoB12Ee',
        db='bd_academicoCloud' )
        
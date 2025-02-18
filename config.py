import os

# Configuración base de datos "dongalleto-master"
class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://admin:root@localhost/dongalleto-master'
    SQLALCHEMY_TRACK_MODIFICATIONS = False


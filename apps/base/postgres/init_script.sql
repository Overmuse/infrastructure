CREATE ROLE ordermanager
CREATEDB
LOGIN
PASSWORD 'password';

CREATE DATABASE ordermanager
WITH
    OWNER=ordermanager;

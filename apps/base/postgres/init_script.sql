CREATE ROLE "order-manager"
CREATEDB
LOGIN
PASSWORD="password";

CREATE DATABASE "order-manager"
WITH
    OWNER="order-manager";

CREATE ROLE ordermanager WITH CREATEDB LOGIN PASSWORD 'password';
CREATE DATABASE ordermanager;
GRANT ALL PRIVILEGES ON DATABASE ordermanager TO ordermanager;

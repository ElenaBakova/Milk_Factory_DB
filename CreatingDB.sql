--CREATE DATABASE milk_factory_db;
--GO
--USE milk_factory_db;
---------------------------------------------------------------
-- Создание таблиц и PK 
---------------------------------------------------------------
CREATE TABLE Material(
    Material_ID   INTEGER      NOT NULL,
    Price         INTEGER      NOT NULL,
    Name	      VARCHAR(20)  NOT NULL,
CONSTRAINT Material_PK PRIMARY KEY (Material_ID)
)
;
CREATE TABLE Pack(
    Pack_ID		INTEGER      NOT NULL,
    Pack_Type   VARCHAR(20)  NOT NULL,
    Volume	    INTEGER      NOT NULL,
CONSTRAINT Pack_PK PRIMARY KEY (Pack_ID)
)
;
CREATE TABLE Supplier(
    Supplier_ID       INTEGER       NOT NULL,
    Name	          VARCHAR(15)	NOT NULL,
    State             VARCHAR(15)   NOT NULL,
CONSTRAINT Supplier_PK PRIMARY KEY (Supplier_ID)
)
;
CREATE TABLE Client(
    Client_ID     INTEGER       NOT NULL,
    Name	      VARCHAR(15)	NOT NULL,
    Address       VARCHAR(15)   NOT NULL,
CONSTRAINT Client_PK PRIMARY KEY (Client_ID)
)
;
CREATE TABLE Product(
    Product_ID        INTEGER      NOT NULL,
    Material_ID       INTEGER      NOT NULL,
    Pack_ID           INTEGER      NOT NULL,
    Name	          VARCHAR(15)  NOT NULL,
    Price	          INTEGER      NOT NULL,
	Manufacture_Date  DATETIME      DEFAULT GETDATE()    NOT NULL,
CONSTRAINT Product_PK PRIMARY KEY (Product_ID)
)
;
CREATE TABLE Factory_Order(
    Order_ID            INTEGER       NOT NULL,
    Material_ID         INTEGER       NOT NULL,
    Supplier_ID         INTEGER       NOT NULL,
    Date_Order          DATETIME      DEFAULT GETDATE()    NOT NULL,
    Amount	            INTEGER	      NOT NULL,
CONSTRAINT Factory_Order_PK PRIMARY KEY (Order_ID)
)
;
CREATE TABLE Client_Order(
    Order_ID            INTEGER       NOT NULL,
    Product_ID          INTEGER       NOT NULL,
    Client_ID           INTEGER       NOT NULL,
    Date_Order          DATETIME      DEFAULT GETDATE()    NOT NULL,
    Amount	            INTEGER	      NOT NULL,
CONSTRAINT Client_Order_PK PRIMARY KEY (Order_ID)
)
;
---------------------------------------------------------------
-- Создание FK 
---------------------------------------------------------------
ALTER TABLE Factory_Order ADD CONSTRAINT FK_Material_ID
    FOREIGN KEY (Material_ID)
    REFERENCES Material(Material_ID)
;
ALTER TABLE Factory_Order ADD CONSTRAINT FK_Supplier_ID
    FOREIGN KEY (Supplier_ID)
    REFERENCES Supplier(Supplier_ID)
;
ALTER TABLE Client_Order ADD CONSTRAINT FK_Product_ID
    FOREIGN KEY (Product_ID)
    REFERENCES Product(Product_ID)
;
ALTER TABLE Client_Order ADD CONSTRAINT FK_Client_ID
    FOREIGN KEY (Client_ID)
    REFERENCES Client(Client_ID)
;
ALTER TABLE Product ADD CONSTRAINT FK_Material
    FOREIGN KEY (Material_ID)
    REFERENCES Material(Material_ID)
;
ALTER TABLE Product ADD CONSTRAINT FK_Pack_ID
    FOREIGN KEY (Pack_ID)
    REFERENCES Pack(Pack_ID)
;
---------------------------------------------------------------
-- Заполнение таблиц тестовыми данными
---------------------------------------------------------------
-- set dateformat ymd;

INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (1, 'Ivanov', 'Vania', '+79123456789', 'Srednii pr VO, 34-2');

---------------------------------------------------------------
-- Удаление таблиц 
---------------------------------------------------------------

/*
DROP TABLE Factory_Order;
DROP TABLE Client_Order;
DROP TABLE Supplier;
DROP TABLE Client;
DROP TABLE Product;
DROP TABLE Pack;
DROP TABLE Material;
*/
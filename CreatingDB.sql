--CREATE DATABASE milk_factory_db;
--GO
--USE milk_factory_db;
---------------------------------------------------------------
-- Создание таблиц и PK 
---------------------------------------------------------------
CREATE TABLE Material(
    Material_ID   INTEGER      NOT NULL		UNIQUE,
    Price         INTEGER      NOT NULL,
    Name	      VARCHAR(20)  NOT NULL,
CONSTRAINT Material_PK PRIMARY KEY (Material_ID)
)
;
CREATE TABLE Pack(
    Pack_ID		INTEGER      NOT NULL	UNIQUE,
    Pack_Type   VARCHAR(20)  NOT NULL,
CONSTRAINT Pack_PK PRIMARY KEY (Pack_ID)
)
;
CREATE TABLE Supplier(
    Supplier_ID       INTEGER       NOT NULL	UNIQUE,
    Name	          VARCHAR(15)	NOT NULL,
    State             VARCHAR(15)   NOT NULL,
CONSTRAINT Supplier_PK PRIMARY KEY (Supplier_ID)
)
;
CREATE TABLE Client(
    Client_ID     INTEGER       NOT NULL	UNIQUE,
    Name	      VARCHAR(15)	NOT NULL,
    Address       VARCHAR(15)   NOT NULL,
CONSTRAINT Client_PK PRIMARY KEY (Client_ID)
)
;
CREATE TABLE Product_Type(
    Product_Type_ID        INTEGER      NOT NULL		UNIQUE,
    Name	          VARCHAR(15)  NOT NULL,
CONSTRAINT Product_Type_PK PRIMARY KEY (Product_Type_ID)
)
;
CREATE TABLE Product(
    Product_ID        INTEGER      NOT NULL		UNIQUE,
    Material_ID       INTEGER      NOT NULL,
    Pack_ID           INTEGER      NOT NULL,
    Product_Type_ID   INTEGER      NOT NULL,
    Name	          VARCHAR(15)  NOT NULL,
    Volume			  INTEGER      NOT NULL,
	Manufacture_Date  DATETIME      DEFAULT GETDATE()    NOT NULL,
CONSTRAINT Product_PK PRIMARY KEY (Product_ID)
)
;
CREATE TABLE Factory_Order(
    Order_ID            INTEGER       NOT NULL	UNIQUE,
    Material_ID         INTEGER       NOT NULL,
    Supplier_ID         INTEGER       NOT NULL,
    Date_Order          DATETIME      DEFAULT GETDATE()    NOT NULL,
    Amount	            INTEGER	      NOT NULL,
CONSTRAINT Factory_Order_PK PRIMARY KEY (Order_ID)
)
;
CREATE TABLE Client_Order(
    Order_ID            INTEGER       NOT NULL	UNIQUE,
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
ALTER TABLE Product ADD CONSTRAINT FK_Product_Type_ID
    FOREIGN KEY (Product_Type_ID)
    REFERENCES Product_Type(Product_Type_ID)
;
---------------------------------------------------------------
-- Заполнение таблиц тестовыми данными
---------------------------------------------------------------

INSERT INTO Client(Client_ID, Name, Address) VALUES (1, 'Lenta', 'Gostilitskoye shosse 58, Petergof, St Petersburg, 198504');
INSERT INTO Client(Client_ID, Name, Address) VALUES (2, 'Lenta', 'Moskovskoye shosse 14, St Petersburg, 196158');
INSERT INTO Client(Client_ID, Name, Address) VALUES (3, 'Lenta', 'Planernaya Ulitsa, 17, St Petersburg, 197374');
INSERT INTO Client(Client_ID, Name, Address) VALUES (4, 'Lenta', 'Piskarovskiy Ave, 59, St Petersburg, 195067');
INSERT INTO Client(Client_ID, Name, Address) VALUES (5, 'Prisma', 'Bolshoy Prospekt Vasilyevskogo Ostrova, 62, St Petersburg, 199106');
INSERT INTO Client(Client_ID, Name, Address) VALUES (6, 'Perekrestok', 'Ligovsky Ave, 30, St Petersburg, 191040');
INSERT INTO Client(Client_ID, Name, Address) VALUES (7, 'Dixy', 'Pushkinskaya Ulitsa, 20, St Petersburg, 191040');
INSERT INTO Client(Client_ID, Name, Address) VALUES (8, 'Okey', 'Prospekt Bolshevikov, 10А, St Petersburg, 193231');

INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (1, 'Lenta', 'Leningrad oblast');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (2, 'Valio', 'Yaroslavl Oblast');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (3, 'Danone', 'Nizhny Novgorod Oblast');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (4, 'Piskarevskiy', 'St. Petersburg');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (5, 'EkoNiva', 'Leningrad oblast');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (6, 'Molvest', 'Voronezh Oblast');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (7, 'Agrokomplex', 'Krasnodar Krai');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (8, 'Hochland', 'Pskov Oblast');
INSERT INTO Supplier(Supplier_ID, Name, State) VALUES (9, 'Nestle Food', 'Republic of Karelia');

INSERT INTO Material(Material_ID, Name, Price) VALUES (1, 'Normalized Milk', 40);
INSERT INTO Material(Material_ID, Name, Price) VALUES (2, 'Whole Milk', 35);
INSERT INTO Material(Material_ID, Name, Price) VALUES (3, 'Nonfat Dry Milk', 85);
INSERT INTO Material(Material_ID, Name, Price) VALUES (4, 'Cream', 120);
INSERT INTO Material(Material_ID, Name, Price) VALUES (5, 'Ferment', 15);
INSERT INTO Material(Material_ID, Name, Price) VALUES (6, 'Cottage Cheese', 100);

INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (1, 'Tetrapack');
INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (2, 'Plastic');
INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (3, 'Glass');
INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (4, 'Wrap');

INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (1, 'Milk');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (2, 'Cheese');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (3, 'Sour Cream');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (4, 'Yogurt');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (5, 'Ice Cream');

INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (1, 'Milk');
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (2, 'Cheese');
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (3, 'Sour cream');
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (4, 'Yogurt');
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (5, 'Condensed milk');
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (6, 'Cream');
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Volume, Manufacture_Date) VALUES (7, 'Butter');

---------------------------------------------------------------
-- Удаление таблиц 
---------------------------------------------------------------

/*
DROP TABLE Factory_Order;
DROP TABLE Client_Order;
DROP TABLE Supplier;
DROP TABLE Client;
DROP TABLE Product;
DROP TABLE Product_Type;
DROP TABLE Pack;
DROP TABLE Material;
*/
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
CONSTRAINT Material_PK PRIMARY KEY (Material_ID),
CONSTRAINT Material_Price CHECK (Price > 0)
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
    State             VARCHAR(50)   NOT NULL,
CONSTRAINT Supplier_PK PRIMARY KEY (Supplier_ID)
)
;
CREATE TABLE Client(
    Client_ID     INTEGER       NOT NULL	UNIQUE,
    Name	      VARCHAR(15)	NOT NULL,
    Address       VARCHAR(100)   NOT NULL,
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
	Price			  INTEGER      NOT NULL,
CONSTRAINT Product_PK PRIMARY KEY (Product_ID),
CONSTRAINT Product_Price CHECK (Price > 0)
)
;
CREATE TABLE Factory_Order(
    Order_ID            INTEGER       NOT NULL	UNIQUE,
    Material_ID         INTEGER       NOT NULL,
    Supplier_ID         INTEGER       NOT NULL,
    Date_Order          DATE     DEFAULT GETDATE()    NOT NULL,
    Amount	            INTEGER	      NOT NULL,
	Cost				INTEGER
CONSTRAINT Factory_Order_PK PRIMARY KEY (Order_ID),
CONSTRAINT Order_Cost CHECK (Cost > 0),
CONSTRAINT Order_Amount CHECK (Amount > 0)
)
;
CREATE TABLE Client_Order(
    Order_ID            INTEGER       NOT NULL	UNIQUE,
    Product_ID          INTEGER       NOT NULL,
    Client_ID           INTEGER       NOT NULL,
    Date_Order          DATE      DEFAULT GETDATE()    NOT NULL,
    Amount	            INTEGER	      NOT NULL,
	Cost				INTEGER
CONSTRAINT Client_Order_PK PRIMARY KEY (Order_ID),
CONSTRAINT Client_Order_Cost CHECK (Cost > 0),
CONSTRAINT Client_Order_Amount CHECK (Amount > 0)
)
;
---------------------------------------------------------------
-- Создание FK 
---------------------------------------------------------------
ALTER TABLE Factory_Order ADD CONSTRAINT FK_Material_ID
    FOREIGN KEY (Material_ID)
    REFERENCES Material(Material_ID) ON DELETE CASCADE
;
ALTER TABLE Factory_Order ADD CONSTRAINT FK_Supplier_ID
    FOREIGN KEY (Supplier_ID)
    REFERENCES Supplier(Supplier_ID)
;
ALTER TABLE Client_Order ADD CONSTRAINT FK_Product_ID
    FOREIGN KEY (Product_ID)
    REFERENCES Product(Product_ID) ON DELETE CASCADE
;
ALTER TABLE Client_Order ADD CONSTRAINT FK_Client_ID
    FOREIGN KEY (Client_ID)
    REFERENCES Client(Client_ID) ON DELETE CASCADE
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
    REFERENCES Product_Type(Product_Type_ID) ON DELETE CASCADE
;

-----------------------------------------------------------------
-- Добавление индексов
-----------------------------------------------------------------
CREATE INDEX product_type_idx ON Product(Product_Type_ID);
CREATE INDEX material_idx ON Product(Material_ID);
CREATE INDEX supplier_in_order_idx ON Factory_Order(Supplier_ID);
CREATE INDEX client_in_order_idx ON Client_Order(Client_ID);

---------------------------------------------------------------
-- Заполнение таблиц тестовыми данными
---------------------------------------------------------------
SET DATEFORMAT dmy;

INSERT INTO Client(Client_ID, Name, Address) VALUES (1, 'Lenta', 'Gostilitskoye shosse 58, Petergof, St Petersburg, 198504');
INSERT INTO Client(Client_ID, Name, Address) VALUES (2, 'Pyaterochka', 'Moskovskoye shosse 14, St Petersburg, 196158');
INSERT INTO Client(Client_ID, Name, Address) VALUES (3, 'Supermarket', 'Planernaya Ulitsa, 17, St Petersburg, 197374');
INSERT INTO Client(Client_ID, Name, Address) VALUES (4, 'Svetofor', 'Piskarovskiy Ave, 59, St Petersburg, 195067');
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
INSERT INTO Material(Material_ID, Name, Price) VALUES (4, 'Cream', 40);
INSERT INTO Material(Material_ID, Name, Price) VALUES (5, 'Cottage Cheese', 60);

INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (1, 'Tetrapack');
INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (2, 'Plastic');
INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (3, 'Glass');
INSERT INTO Pack(Pack_ID, Pack_Type) VALUES (4, 'Wrap');

INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (1, 'Milk');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (2, 'Cheese');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (3, 'Sour Cream');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (4, 'Yogurt');
INSERT INTO Product_Type(Product_Type_ID, Name) VALUES (5, 'Ice Cream');

INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (1, 1, 1, 1, 'Milk 2,5%', 80);
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (2, 2, 3, 1, 'Milk 3,2%', 85);
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (3, 4, 2, 3, 'Sour cream 15%', 75);
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (4, 5, 2, 4, 'Yogurt', 120);
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (5, 2, 4, 2, 'Camembert', 200);
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (6, 4, 4, 5, 'Ice Cream', 90);
INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (7, 2, 4, 2, 'Gouda', 250);

INSERT INTO Factory_Order(Order_ID, Material_ID, Supplier_ID, Amount, Date_Order)
VALUES (1, 1, 7, 200, '30-04-2022')
INSERT INTO Factory_Order(Order_ID, Material_ID, Supplier_ID, Amount, Date_Order)
VALUES (2, 2, 3, 200, '30-04-2022')
INSERT INTO Factory_Order(Order_ID, Material_ID, Supplier_ID, Amount, Date_Order)
VALUES (3, 3, 1, 500, '25-04-2022')
INSERT INTO Factory_Order(Order_ID, Material_ID, Supplier_ID, Amount, Date_Order)
VALUES (4, 4, 5, 1000, '28-04-2022')
INSERT INTO Factory_Order(Order_ID, Material_ID, Supplier_ID, Amount, Date_Order)
VALUES (5, 5, 7, 150, '29-04-2022')
INSERT INTO Factory_Order(Order_ID, Material_ID, Supplier_ID, Amount, Date_Order)
VALUES (6, 5, 7, 250, '09-04-2022')

INSERT INTO Client_Order(Order_ID, Product_ID, Client_ID, Amount, Date_Order)
VALUES (1, 7, 5, 500, '15-04-2022')
INSERT INTO Client_Order(Order_ID, Product_ID, Client_ID, Amount, Date_Order)
VALUES (2, 3, 5, 200, '30-04-2022')
INSERT INTO Client_Order(Order_ID, Product_ID, Client_ID, Amount, Date_Order)
VALUES (3, 2, 5, 300, '25-04-2022')
INSERT INTO Client_Order(Order_ID, Product_ID, Client_ID, Amount, Date_Order)
VALUES (4, 4, 2, 1000, '28-04-2020')
INSERT INTO Client_Order(Order_ID, Product_ID, Client_ID, Amount, Date_Order)
VALUES (5, 5, 1, 150, '29-04-2020')

---------------------------------------------------------------
-- Удаление таблиц 
---------------------------------------------------------------

/*
DROP INDEX product_type_idx ON Product;
DROP INDEX material_idx ON Product;
DROP INDEX supplier_in_order_idx ON Factory_Order;
DROP INDEX client_in_order_idx ON Client_Order;

DROP TABLE Factory_Order;
DROP TABLE Client_Order;
DROP TABLE Supplier;
DROP TABLE Client;
DROP TABLE Product;
DROP TABLE Product_Type;
DROP TABLE Pack;
DROP TABLE Material;
*/
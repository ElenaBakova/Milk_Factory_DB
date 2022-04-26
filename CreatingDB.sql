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
ALTER TABLE Product ADD CONSTRAINT FK_Material_ID
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
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (2, 'Petrov', 'Petia', '+79234567890', 'Sadovaia ul, 17\2-23');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (3, 'Vasiliev', 'Vasia', '+7345678901', 'Nevskii pr, 9-11');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (4, 'Orlov', 'Oleg', '+7456789012', '5 linia VO, 45-8');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (5, 'Galkina', 'Galia', '+7567890123', '10 linia VO, 35-26');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (6, 'Sokolov', 'S.', '+7678901234', 'Srednii pr VO, 27-1');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (7, 'Vorobiev', 'Vova', '123-45-67', 'Universitetskaia nab, 17');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (8, 'Ivanov', 'Vano', '+7789012345', 'Malyi pr VO, 33-2');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (9, 'Sokolova', 'Sveta', '234-56-78', '');
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (10, 'Zotov', 'Misha', '111-56-22', '');

INSERT INTO Owner(Owner_ID, Description, Person_ID) VALUES (1, 'good boy', 4);
INSERT INTO Owner(Owner_ID, Description, Person_ID) VALUES (2, '', 5);
INSERT INTO Owner(Owner_ID, Description, Person_ID) VALUES (3, '', 6);
INSERT INTO Owner(Owner_ID, Description, Person_ID) VALUES (4, 'from the ArtsAcademy', 7);
INSERT INTO Owner(Owner_ID, Description, Person_ID) VALUES (5, '', 8);
INSERT INTO Owner(Owner_ID, Description, Person_ID) VALUES (6, 'mean', 9);

INSERT INTO Employee(Employee_ID, Spec, Person_ID) VALUES (1, 'boss', 1);
INSERT INTO Employee(Employee_ID, Spec, Person_ID) VALUES (2, 'hairdresser', 2);
INSERT INTO Employee(Employee_ID, Spec, Person_ID) VALUES (3, 'student',3);
INSERT INTO Employee(Employee_ID, Spec, Person_ID) VALUES (4, 'student', 10);
     
INSERT INTO Pet_Type(Pet_Type_ID, NAME) VALUES (1, 'DOG');
INSERT INTO Pet_Type(Pet_Type_ID, NAME) VALUES (2, 'CAT');
INSERT INTO Pet_Type(Pet_Type_ID, NAME) VALUES (3, 'COW');
INSERT INTO Pet_Type(Pet_Type_ID, NAME) VALUES (4, 'FISH');

INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (1, 'Bobik', 'unknown', 3, NULL, 1, 1);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (2, 'Musia', NULL, 12, NULL, 2, 1);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (3, 'Katok', NULL, 2, 'crazy guy', 2, 1);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (4, 'Apelsin', 'poodle', 5, NULL,1, 2);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (5, 'Partizan', 'Siamese', 5, 'very big', 2, 2);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (6, 'Daniel', 'spaniel', 14, NULL, 1, 3);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (7, 'Model', NULL, 5, NULL, 3, 4);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (8, 'Markiz', 'poodle', 1, NULL, 1, 5);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (9, 'Zombi', 'unknown', 7, 'wild', 2, 6);
INSERT INTO Pet(Pet_ID, Nick, Breed, Age, Description, Pet_Type_ID, Owner_ID) VALUES (10, 'Las', 'Siamese', 7, '', 2, 6);

INSERT INTO Service(Service_ID, NAME) VALUES (1, 'Walking');
INSERT INTO Service(Service_ID, NAME) VALUES (2, 'Combing');
INSERT INTO Service(Service_ID, NAME) VALUES (3, 'Milking');

INSERT INTO Employee_Service(Employee_ID, Service_ID, Is_Basic) VALUES (1, 1, 0);
INSERT INTO Employee_Service(Employee_ID, Service_ID, Is_Basic) VALUES (1, 2, 0);
INSERT INTO Employee_Service(Employee_ID, Service_ID, Is_Basic) VALUES (1, 3, 1);
INSERT INTO Employee_Service(Employee_ID, Service_ID, Is_Basic) VALUES (2, 1, 0);
INSERT INTO Employee_Service(Employee_ID, Service_ID, Is_Basic) VALUES (2, 2, 1);
INSERT INTO Employee_Service(Employee_ID, Service_ID, Is_Basic) VALUES (3, 1, 1);

INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (1, 1, 1, 1, 3, '2020-09-04 08:00', 1, 5, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (2, 1, 2, 2, 2, '2020-09-04 09:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (3, 1, 2, 3, 2, '2020-09-04 09:00', 0, 0, 'That cat is crazy!');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (4, 1, 1, 1, 3, '2020-09-05 00:00', 1, 5, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (5, 1, 1, 1, 3, '2020-09-06 11:00', 1, 3, 'Comming late');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (6, 1, 1, 1, 3, '2020-09-07 17:00', 1, 5, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (7, 1, 2, 2, 2, '2020-09-07 18:00', 1, 5, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (8, 2, 1, 5, 3, '2020-09-07 18:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (9, 2, 1, 4, 3, '2020-09-07 10:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (10, 2, 1, 5, 3, '2020-09-08 17:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (11, 2, 1, 4, 3, '2020-09-08 18:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (12, 2, 1, 5, 3, '2020-09-08 12:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (13, 2, 1, 4, 3, '2020-09-08 14:00', 1, 4, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (14, 3, 1, 6, 3, '2020-09-09 10:00', 1, 5, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (15, 3, 2, 6, 2, '2020-09-09 18:00', 0, 0, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (16, 3, 1, 6, 3, '2020-09-10 10:00', 0, 0, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (17, 3, 1, 6, 3, '2020-09-10 11:00', 0, 0, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (18, 3, 1, 6, 3, '2020-09-12 10:00', 0, 0, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (19, 3, 1, 6, 3, '2020-09-13 10:00', 0, 0, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark, Comments) 
       VALUES (20, 4, 3, 7, 1, '2020-09-10 11:00', 1, 5, '');
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark) 
       VALUES (21, 4, 3, 7, 1, '2020-09-11 11:00', 0, 0);
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark) 
       VALUES (22, 4, 3, 7, 1, '2020-09-12 11:00', 0, 0);
INSERT INTO Order1(Order_ID, Owner_ID, Service_ID, Pet_ID, Employee_ID, Time_Order, Is_Done, Mark) 
       VALUES (23, 5, 2, 8, 2, '2020-09-10 16:00', 0, 0);

---------------------------------------------------------------
-- Удаление таблиц 
---------------------------------------------------------------

/*
DROP TABLE Order1;
DROP TABLE Employee_Service;
DROP TABLE Service;
DROP TABLE Pet;
DROP TABLE Pet_Type;
DROP TABLE Employee;
DROP TABLE Owner;
DROP TABLE Person;
*/
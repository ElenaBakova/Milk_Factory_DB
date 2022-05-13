-------------------------------------------------------------------------------------------------------
-- Контроль повторного добавления продукта
-------------------------------------------------------------------------------------------------------
CREATE TRIGGER Tr_Product_Ins ON Product FOR INSERT
AS
IF EXISTS (
SELECT * FROM Product
  JOIN INSERTED ON Product.Name = INSERTED.Name AND Product.Material_ID = INSERTED.Material_ID AND Product.Pack_ID = INSERTED.Pack_ID 
  AND Product.Product_Type_ID = INSERTED.Product_Type_ID)
BEGIN
ROLLBACK
END;

-- INSERT INTO Product(Product_ID, Material_ID, Pack_ID, Product_Type_ID, Name, Price) VALUES (10, 1, 1, 1, 'Milk 2,5%', 80);
-- DROP TRIGGER Tr_Product_Ins
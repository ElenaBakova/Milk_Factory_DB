-------------------------------------------------------------------------------------------------
-- Продукты в пластиковой таре (название продукта, тип)
-------------------------------------------------------------------------------------------------
CREATE VIEW V_Plastic_Package (Name, Product_Type)
AS
SELECT Product.Name, Product_Type.Name FROM Product
  JOIN Product_Type ON Product_Type.Product_Type_ID = Product.Product_Type_ID
  JOIN Pack ON Pack.Pack_ID = Product.Pack_ID WHERE Pack.Pack_Type = 'Plastic';

--DROP VIEW V_Plastic_Package
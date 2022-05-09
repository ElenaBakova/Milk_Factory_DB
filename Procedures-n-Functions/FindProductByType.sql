-------------------------------------------------------------------------------------------------
-- Поиск продуктов по типу
-------------------------------------------------------------------------------------------------
CREATE FUNCTION FindProductByType (@product_type VARCHAR(15))
RETURNS TABLE
AS
RETURN
(
  SELECT Product.Name FROM Product
    JOIN Product_Type ON Product_Type.Product_Type_ID = Product.Product_Type_ID
  WHERE Product_Type.Name = @product_type
);
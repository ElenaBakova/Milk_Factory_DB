-------------------------------------------------------------------------------------------------
-- Изменение частоты поставки заданного сырья из определенного региона
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE ChangeMaterialPrice
@var_name AS CHAR(20),
@var_new_price AS INTEGER
AS
BEGIN
  UPDATE Material SET Price = @var_new_price WHERE Material.Name = @var_name
END;

-- Пример вызова процедуры:
-- EXECUTE ChangeMaterialPrice @var_name='Cream', @var_new_price=120

-- DROP PROCEDURE ChangeMaterialPrice;
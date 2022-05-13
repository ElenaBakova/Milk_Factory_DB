-------------------------------------------------------------------------------------------------------
-- Пересчёт стоимости заказа продукта при изменении цены
-------------------------------------------------------------------------------------------------------
CREATE TRIGGER Tr_Update_Client_Order_Price ON Product AFTER UPDATE
AS
BEGIN
  IF UPDATE (Price)
  BEGIN
    UPDATE Client_Order SET Client_Order.Cost = (SELECT Product.Price FROM Product WHERE Product.Product_ID = Client_Order.Product_ID) * 
      Client_Order.Amount FROM Product WHERE Product.Product_ID = Client_Order.Product_ID
  END
END;

-- UPDATE Product SET Price = Price + 500
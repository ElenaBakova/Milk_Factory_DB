-------------------------------------------------------------------------------------------------
-- Вычисление стоимости заказа cырья
-------------------------------------------------------------------------------------------------
CREATE TRIGGER Tr_Count_Client_Order_Cost ON Client_Order FOR INSERT
AS
UPDATE Client_Order SET Client_Order.Cost = (SELECT Amount FROM INSERTED) * (SELECT Price FROM Product WHERE Product_ID = Client_Order.Product_ID);
-------------------------------------------------------------------------------------------------
-- Вычисление стоимости заказа cырья
-------------------------------------------------------------------------------------------------
CREATE TRIGGER Tr_Count_Factory_Order_Cost ON Factory_Order 
AFTER INSERT
AS
UPDATE Factory_Order SET Factory_Order.Cost = (SELECT Amount FROM INSERTED) * (SELECT Price FROM Material WHERE Material_ID = Factory_Order.Material_ID);

-- DROP TRIGGER Tr_Count_Factory_Order_Cost
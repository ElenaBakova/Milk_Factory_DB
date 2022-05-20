-------------------------------------------------------------------------------------------------
-- Заказы сырья (название поставщика, сырьё, количество, стоимость, дата заказа)
-------------------------------------------------------------------------------------------------
CREATE VIEW V_Material_Order (Supplier, Material, Amount, Cost, Date_Order)
AS
SELECT Supplier.Name, Material.Name, Amount, Factory_Order.Cost, Date_Order FROM Factory_Order
  JOIN Supplier ON Supplier.Supplier_ID = Factory_Order.Supplier_ID
  JOIN Material ON Material.Material_ID = Factory_Order.Material_ID;

--DROP VIEW V_Material_Order
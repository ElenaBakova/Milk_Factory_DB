-- Заказы сырья, цена которого больше 35, в порядке возрастания стоимости заказа
SELECT Material.Name, Supplier.Name AS Supplier_Name, Factory_Order.Cost, Factory_Order.Date_Order FROM Factory_Order, Supplier, Material
  WHERE Factory_Order.Material_ID IN (SELECT Material_ID FROM Material WHERE Material.Price > 35)
    AND Factory_Order.Supplier_ID = Supplier.Supplier_ID
	AND Material.Material_ID = Factory_Order.Material_ID
      ORDER BY Factory_Order.Cost DESC;
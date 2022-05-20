-- (03) Поставщики с названием не длинее 7 символов (название, регион, количество заказов)
SELECT Supplier.Name, Supplier.State, COUNT(Factory_Order.Material_ID) AS Order_Amount FROM Supplier
  LEFT JOIN Factory_Order ON Factory_Order.Supplier_ID = Supplier.Supplier_ID
    WHERE LEN(Supplier.Name) <= 7
      GROUP BY Supplier.Name, Supplier.State;
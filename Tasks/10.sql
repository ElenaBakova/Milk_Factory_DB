-- (10) Типы продуктов по убыванию востребованности, но заказанные больше 2 раз
SELECT Product_Type.Name, COUNT(Client_Order.Product_ID) AS cnt FROM Product_Type, Client_Order
  WHERE Product_Type.Product_Type_ID = Client_Order.Product_ID
    GROUP BY Product_Type.Name
	HAVING COUNT(Client_Order.Product_ID) > 2
    ORDER BY cnt DESC;
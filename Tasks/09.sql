-- (09) Заказы сыра в количестве меньше 400 
SELECT Client_Order.Order_ID, Client.Name, Product.Name, Client_Order.Amount FROM Client_Order
  JOIN Client ON Client.Client_ID = Client_Order.Client_ID
  JOIN Product ON Product.Product_ID = Client_Order.Product_ID
    WHERE Client_Order.Amount < 400 
	AND Client_Order.Product_ID IN 
	(SELECT Product.Product_ID FROM Product, Product_Type
	WHERE Product.Product_Type_ID = Product_Type.Product_Type_ID AND Product_Type.Name = 'Cheese');